class ProductsController < ApplicationController
  before_action :admin, only: [:edit, :destroy, :import]

  # GET /products
  # GET /products.json
  def index
    @products = Product.paginate(page: params[:page], :per_page => 5).order('created_at desc')
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @trendingProduct = Product.all
    @review = Review.create
    @cart = current_cart

    if recent_products
      @recently_viewed = recent_products.reverse
    end
    recent_products.push @product
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        flash[:success] = 'Product was successfully created !!!' 
        format.html { redirect_to @product}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        flash[:success] = 'Product was successfully updated !!!' 
        format.html { redirect_to @product}
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    Product.find(params[:id]).destroy
    respond_to do |format|
      flash[:success] = 'Product was successfully deleted !!!' 
      format.html { redirect_to products_url}
      format.json { head :no_content }
    end
  end

  def import
    Product.import_file params[:file]
    redirect_to products_url
    flash[:success] = "Data imported !!!"
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :weight, :image, :stock, :detail, :description, :rating, :cpu, :ram, :memory, :display)
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
