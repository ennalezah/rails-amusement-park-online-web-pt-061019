class SessionsController < ApplicationController
  def signin
    @user= User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      render 'signin'
    end
  end

  def destroy 
    session.delete :user_id
    redirect_to root_path
  end
end