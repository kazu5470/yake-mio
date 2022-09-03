class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :ensure_correct_user, only: [:edit]
  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @tag = Tag.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end
  
  def tag_posts
    @tag = Tag.find(params[:tag_id])
    target_posts_ids = Tag.where(name: @tag.name).pluck(:post_id)
    @post = Post.where(id: target_posts_ids)
  end  
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      tags = Vision.get_image_data(@post.post_image)
      tags.each do |tag|
        @post.tags.create(name: tag)
      end  
      redirect_to public_post_path(@post), notice: "正常に投稿できました"
    else
      render 'new', notice: "投稿できませんでした"
    end  
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_post_path(@post), notice: "投稿が更新されました"
    else
      flash[:notice] = "更新できませんでした"
      render 'edit'
    end  
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to public_posts_path, notice: '投稿を削除しました'
    else
      flash[:notice] = '投稿を削除できませんでした'
      render 'edit'
    end
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
      unless @post.user == current_user
        redirect_to public_posts_path
      end  
  end    
  
  private
    def post_params
      params.require(:post).permit(:title, :body, :post_image, :lat, :lng, :star, :tag_id)
    end  
  
end
