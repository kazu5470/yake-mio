class Public::PostCommentsController < ApplicationController
    
    def create
        @post = Post.find(params[:post_id])
        @post_comment = current_user.post_comments.new(post_comment_params)
        @post_comment.post_id = @post.id
        if @post_comment.save
            @post = Post.find(params[:post_id])
            @post_comment = PostComment.new
        else
            render 'public/posts/show'
            flash[:notice] = "コメントを入力してください"
        end    
    end
    
    def destroy
        PostComment.find(params[:id]).destroy
        #redirect_to public_post_path(params[:post_id])
        @post_comment = PostComment.find_by(id: params[:id], post_id: params[:post_id])
        render :destroy
    end
    
    
    private
    
    def post_comment_params
        params.require(:post_comment).permit(:body)
    end    
end
