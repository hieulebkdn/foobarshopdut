class LineItemsController < ApplicationController
	before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = find_cart(params[:card_id])
    product = Product.find(params[:product_id])
    quantity = params[:quantity]
    if quantity == nil
      quantity = 1
    end

    if quantity.to_i > product.stock
     @line_item = LineItem.new
    else
      new_stock = product.stock - quantity.to_i 
      @line_item = @cart.add_product(product.id,quantity)
      product.update_attribute(:stock, new_stock)
      product.save
    end
    
    respond_to do |format|    
      if @line_item.save
        format.html { redirect_to @cart }
        format.json { render :show, status: :created, location: @line_item }
      else
        flash[:danger] = 'Adding failed!'
        format.html { redirect_to product }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @line_item.quantity = params[:quantity].to_i
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { redirect_to @line_item }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    cart = @line_item.cart
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.fetch(:line_item,{}).permit(:product_id, :cart_id, :quantity)
    end
    def find_cart(cart_id)
      Cart.find(cart_id)
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        cookies.permanent.signed[:cart_id] = cart.id
        cart
    end
end
