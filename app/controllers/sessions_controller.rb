class SessionsController < ApplicationController

  def new 
  end
  
  def create
    user = User.find_by email: params[:session][:email].downcase
    admin = Admin.find_by email: params[:session][:email].downcase
    if admin && admin.authenticate(params[:session][:password])
      admin_log_in admin
      params[:session][:remember_me] == '1' ? remember(admin) : forget(admin)
      redirect_to admin      
    elsif user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
  			#successfull update
  			flash[:success] = "Profile Updated"
  			redirect_to @user
  		else
  			render 'edit'
  		end
  	end
  end
