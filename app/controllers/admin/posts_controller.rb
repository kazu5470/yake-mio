class Admin::PostsController < ApplicationController
    def index
        @post = post.all
    end
    
    def destroy
    end
    
end
