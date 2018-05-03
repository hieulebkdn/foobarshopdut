  class UsersController < ApplicationController
  before_action :logged_in_user_admin, only: [:index ,:edit, :update, :destroy, :show]
  before_action :correct_user_admin, only: [:edit, :update]
  before_action :admin, only: [:destroy]  

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], :per_page => 4)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by id: params[:id]
  end

  # GET /users/new
  def new
    if logged_in?
      flash[:danger] = "Please log out before sign up !!!"
      redirect_to current_user
    else
    @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        log_in @user
        username = @user.name
        flash[:success] = "Welcome to FooBarShop #{username}!!!"
        format.html { redirect_to @user}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        user_name = @user.name
        flash[:success] = "#{user_name}'s Profile has been updated !!!"
        format.html { redirect_to @user}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    respond_to do |format|
      flash[:success] = "User was successfully deleted !!!"
      format.html { redirect_to users_url}
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :avatar, :email, :phone, :city, :address)
    end

    def logged_in_user_admin
      unless (logged_in? || admin_logged_in?)
        store_location
        flash[:danger] = "Please log in !!!"
        redirect_to login_url
      end        
    end

    def correct_user_admin
    @user = User.find(params[:id])
    redirect_to(root_url) unless  (current_user?(@user)|| current_admin.present?)
    end

    # Confirms an admin user.
    def admin
      unless  current_admin.present?
        store_location
        flash[:danger] = "Please log in by Adminstrator !!!"
        redirect_to login_url
      end
    end
end
