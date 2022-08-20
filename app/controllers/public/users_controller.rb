class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to public_user_path, notice: 'ログインユーザーではないため、編集できません'
    end  
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path, notice: "会員情報が更新されました"
    else
      flash[:notice] = "更新できませんでした"
      render 'edit'
    end  
  end
  
  def unsubscribe
    @user = current_user
  end

  def withdraw
      @user = current_user
      @user.update(is_active: true)
      # ログアウトさせる
      reset_session

      flash[:notice] = "ありがとうございました。またいつでもご利用くださいませ。"
      redirect_to root_path
  end
  
  def index
    @users = User.all
  end
  
  # def ensure_correct_user
  #   @user = User.find(params[:id])
  #   if @user.first_name == 'ゲスト' && @user.last_name == 'ユーザー'
  #     flash[:notice] = "ゲストユーザーは編集できません"
  #     redirect_to public_post_path(@user)
  #   end  
  # end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
      unless @post.user == current_user
        redirect_to public_posts_path, notice: 'ゲストユーザーは編集できません'
      end  
  end  
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :introduction, :age, :email, :is_active, :profile_image)
  end
  
end
