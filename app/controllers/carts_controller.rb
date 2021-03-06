class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = []
        if cookies.signed[:cart_id] != nil
            @carts << Cart.find_by_id(cookies.signed[:cart_id])
        end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = current_cart
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
    @cart = current_cart
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    # @cart = current_cart
    # @cart.destroy
    # cookies.delete :cart_id
    @cart = current_cart
    @cart.line_items.each do |item|
      product = item.product
      new_stock = product.stock + item.quantity 
      product.update_attribute(:stock, new_stock)
      product.save
      item.destroy
    end
    respond_to do |format|
      flash[:success] = 'Cart was successfully emptied'
      format.html { redirect_to @cart  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end
end
