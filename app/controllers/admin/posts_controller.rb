class Admin::PostsController < ApplicationController
    before_action :authenticate_admin!
    
    def index
        @post = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
        @post_comment = PostComment.new
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to public_post_path(@post), notice: '投稿を更新しました'
        else
            @post = Post.find(params[:id])
            flash[:notice] = '投稿を更新できませんでした'
            render 'edit'
        end    
    end
    
    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to admin_posts_path, notice: '投稿を削除しました'
        else
            redirect_to admin_post_path(@post), notice: '投稿を削除できませんでした'
        end    
    end
    
    private
    
    def post_params
        params.riquire(:post).permit(:title, :body, :post_image, :star)
    end    
end
