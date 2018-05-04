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
      @products = Product.where('name like ?', @q).order('name asc')
    elsif searchBy == "2"
      @products = Product.where('name like ?', @q).order('price asc')
    else 
      @products = Product.where('name like ?', @q).order('price desc')
    end

    render 'result'
  end

  def filter
    @listBrand = [["All brand", 0]]
    Brand.all.each do |b|
      @listBrand.push([b.name,b.id])
    end
    @options = ["A-Z","Price: Low to High", "Price: High to Low"]
    
    byBrand = params[:brand_option].to_s
    byRating = params[:rating_option].to_s
    byPrice = params[:price_option].to_s
    @products = Product.above_rating(byRating).belong_to_brand(byBrand).price_range(byPrice)
    render 'result'
  end

  def classify
    @listBrand = [["All brand", 0]]
    Brand.all.each do |b|
      @listBrand.push([b.name,b.id])
    end
    @options = ["A-Z","Price: Low to High", "Price: High to Low"]

    cate_id = params[:cateid].to_i
    @listCate_id = [cate_id]

    Category.all.each do |c|
      if c.childof == cate_id
        @listCate_id.push(c.id)
      end
    end

    @products = Product.belong_to_cate(@listCate_id)
    flash[:success] = @listCate_id
    render 'result'
  end

end
