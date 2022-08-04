class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  
  def update
  end
  
  def unsubscribe
  end

  def withdraw
  end
  
  def index
    @users = User.all
  end
  
end
