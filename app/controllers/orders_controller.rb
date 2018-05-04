class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :login_to_order, only: [:new, :create]

  # GET /orders
  # GET /orders.json
  def index
    @orders = []
    if admin_logged_in?
       @orders = Order.all
    elsif logged_in?
      @orders = current_user.orders
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      flash[:notice] = 'Your cart is empty'
      redirect_to '/'
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @user = current_user
    @order = Order.new(:shipname => params[:shipname], :shipaddress => params[:shipaddress],
      :city => params[:city], :phone => params[:phone])
    @order.user_id = @user.id
    @order.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(cookies.signed[:cart_id])
        cookies.delete :cart_id
        NotifierMailer.order_received(@order).deliver
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }

      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      user = @order.user
      redirect_to(root_url) unless  (current_user?(user))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:shipname, :shipaddress, :phone, :city)
    end

    def login_to_order
      unless logged_in? 
        store_location
        flash[:danger] = "Only member can order"
        redirect_to login_url
      end
    end

end
