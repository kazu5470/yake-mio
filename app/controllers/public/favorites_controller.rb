class Public::FavoritesController < ApplicationController
    
    def create
        @post = Post.find(params[:post_id])
        @favorite = current_user.favorites.create(post_id: @post.id)
        #redirect_to public_post_path(post)
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @favorite = current_user.favorites.find_by(post_id: @post.id)
        @favorite.destroy
        #redirect_to public_post_path(post)
    end
    
end