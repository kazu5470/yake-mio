class Public::PostsController < ApplicationController
  before_action :current_user
  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def index
    @post = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to public_post_path(@post), notice: "正常に投稿できました"
    else
      @posts = Post.all
      render 'index'
    end  
  end
  
  def update
  end
  
  def destroy
  end
  
  
  private
    def post_params
      params.require(:post).permit(:title, :body, :star)
    end  
  
end
