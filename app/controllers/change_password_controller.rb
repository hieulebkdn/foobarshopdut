class ChangePasswordController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def index
  end

  def new
      @user = User.find(params[:id])
      if @user && @user.authenticate(params[:user][:old_password])
      if params[:user][:password].empty?
        @user.errors.add(:password, "can't be empty")
        render 'edit'
      elsif @user && @user.authenticate(params[:user][:password])
        @user.errors.add(:password, "is Old Password! Please choose another password")
        render 'edit'
      elsif @user.update_attributes(user_params)
        flash[:success] = "Your password has been changed!"
        redirect_to @user
      else
        render 'edit'
      end
    else
      @user.errors.add(:old_password, "is not correct")
      render 'edit'
    end
  end

  def show
  end

  def create
  end

  def edit
      @user = User.find(params[:id])
  end

  def destroy
  end
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # Before filters

  # Confirms a logged_in user.
  def logged_in_user
    unless  logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end     
  end

  # Confirms a correct_user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless  current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
