class UsersController < ApplicationController

  def show
    @user = @current_user
    @children = @user.children
  end

  def index
    @users = User.all
  end



  def welcome
    email = "misshershi@gmail.com"
    WelcomeMailer.welcome(email).deliver_now
    redirect_to :back
  end

end
