class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  
  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show 
    @user = User.find_by(id: params[:id])
  end

  private 
  
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :tickets, :happiness, :height, :admin)
  end
end