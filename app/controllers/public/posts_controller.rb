class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to public_post_path(@post), notice: "正常に投稿できました"
    else
      render 'new', notice: "投稿できませんでした"
    end  
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update
      redirect_to public_post_path(@post), notice: "投稿が更新されました"
    else
      flash[:notice] = "更新できませんでした"
      render 'edit'
    end  
  end
  
  def destroy
  end
  
  
  private
    def post_params
      params.require(:post).permit(:title, :body, :post_image, :lat, :lng, :star)
    end  
  
end
