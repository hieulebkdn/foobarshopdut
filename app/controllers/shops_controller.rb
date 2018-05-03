class ShopsController < ApplicationController
  def index
    @options = ["A-Z","Price: Low to High", "Price: High to Low"]
    @products = Product.paginate(page: params[:page], :per_page => 8).order('created_at asc')
  end

  def search
    @q = "%#{params[:query]}%"
    searchBy = params[:option].to_s

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
