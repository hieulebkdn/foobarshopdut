class ProductsController < ApplicationController
  before_action :admin, only: [:index, :edit, :destroy, :import, :dell, :asus, :samsung, :blackberry, :apple, :hp, :sony, :oppo, :acer, :msi, :gigabyte]
  has_scope :price_min
  has_scope :price_max


  def dell
    @products = Product.all
  end

  def asus
    @products = Product.all
  end

  def samsung
    @products = Product.all
  end

  def blackberry
    @products = Product.all
  end

  def apple
    @products = Product.all
  end

  def hp
    @products = Product.all
  end

  def sony
    @products = Product.all
  end

  def oppo
    @products = Product.all
  end

  def acer
    @products = Product.all
  end

  def msi
    @products = Product.all
  end

  def gigabyte
    @products = Product.all
  end
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @brand_dell = Brand.find(1)
    @brand_asus = Brand.find(2)
    @brand_samsung = Brand.find(3)
    @brand_blackberry = Brand.find(4)
    @brand_apple = Brand.find(5)
    @brand_hp = Brand.find(6)
    @brand_sony = Brand.find(7)
    @brand_oppo = Brand.find(8)
    @brand_acer = Brand.find(9)
    @brand_msi = Brand.find(10)
    @brand_gigabyte = Brand.find(11)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @trendingProduct = Product.all.order(view: :desc).limit(5)
    @review = Review.create
    @cart = current_cart
    @cateName = Category.where("id == ?", @product.category_id).pluck(:name)[0]
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
