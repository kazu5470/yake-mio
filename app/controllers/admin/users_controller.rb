class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!
    
    def index
        @user = User.all
    end
    
    def edit
        @user = User.find(params[:id])
    end    
    
    def show
        @user = User.find(params[:id])
    end
    
    def user_posts
        @user = User.find(params[:id])
        @post = @user.posts.all
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to admin_user_path, notice: '会員情報を更新しました'
            if @user.is_active == true
                flash[:notice] = '会員を退会処理しました'
            end    
        else
            flash[:notice] = '更新できませんでした'
            render 'edit'
        end
    end    
    
    def destroy
        @user = User.find(params[:id])
        if @user.is_active == false
            flash[:notice] = '退会していないため、削除できません'
            render 'edit'
        else
            @user.destroy
            redirect_to admin_users_path, notice: '会員を削除しました'
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :age, :introduction, :profile_image, :is_active, :email)
    end    
end
