class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
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

      flash[:notice] = "ありがとうございました。またいつでもご利用ください。"
      redirect_to root_path
  end
  
  def index
    @users = User.all
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :introduction, :age, :email)
  end
  
end
