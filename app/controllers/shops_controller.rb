class ShopsController < ApplicationController
  def index
    @listBrand = [["All brand", 0]]
    Brand.all.each do |b|
      @listBrand.push([b.name,b.id])
    end
    @options = ["A-Z","Price: Low to High", "Price: High to Low"]
    @products = Product.paginate(page: params[:page], :per_page => 8).order('created_at asc')
  end

  def search
    @q = "%#{params[:query]}%"
    searchBy = params[:option].to_s
    @listBrand = [["All brand", 0]]
    Brand.all.each do |b|
      @listBrand.push([b.name,b.id])
    end
    @options = ["A-Z","Price: Low to High", "Price: High to Low"]

    if searchBy == "1"
      @products = Product.where('name like ?', @q).paginate(page: params[:page], :per_page => 8).order('name asc')
    elsif searchBy == "2"
      @products = Product.where('name like ?', @q).paginate(page: params[:page], :per_page => 8).order('price asc')
    else 
      @products = Product.where('name like ?', @q).paginate(page: params[:page], :per_page => 8).order('price desc')
    end

    # queryName = params[:query].to_s 
    render 'index'
  end

  def filter
    # @products = Product.paginate(page: params[:page], :per_page => 8).order('created_at asc')
    @listBrand = [["All brand", 0]]
    Brand.all.each do |b|
      @listBrand.push([b.name,b.id])
    end
    @options = ["A-Z","Price: Low to High", "Price: High to Low"]
    byBrand = params[:brand_option].to_s
    byRating = params[:rating_option].to_s
    byPrice = params[:price_option].to_s
    @products = Product.above_rating(byRating).belong_to_brand(byBrand).price_range(byPrice).paginate(page: params[:page], :per_page => 8)
    flash[:success] = "Brandid #{byBrand}, Rating #{byRating}, Price #{byPrice}" 
    render 'index'
  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
  end

end
