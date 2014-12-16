class UsersController < ApplicationController
  def new
    @user = User.create
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def update_info
    render 'update_password'
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      @user.password = ''
      redirect_to root_url
    else
      update_info
    end
  end

  def index
    @users = User.all.where(isAdmin: nil)

    @users.each{|user|
      user.password_hash = 'nunya'
      user.password_salt = 'business'
    }
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
