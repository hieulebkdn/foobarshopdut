class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_admin, only: [:edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find_by id: params[:id]
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        admin_log_in @admin
        flash[:success] = "Admin was successfully created !!!"
        format.html { redirect_to @admin}
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        flash[:success] = 'Your Profile has been updated !!!' 
        format.html { redirect_to @admin}
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully deleted !!!' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:name, :password, :password_confirmation, :email, :phone, :company, :address, :image)
    end

    def logged_in_admin
      unless admin_logged_in?
        store_location
        flash[:danger] = "Please log in by Adminstrator !!!"
        redirect_to login_url
      end        
    end

    def correct_admin
      @admin = Admin.find(params[:id])
      redirect_to(root_url) unless current_admin?(@admin)
    end
    
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end
