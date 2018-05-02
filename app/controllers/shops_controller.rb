class ShopsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], :per_page => 8).order('created_at asc')
  end

  def search
    @q = "%#{params[:query]}%"
    @products = Product.where('name like ?', @q).paginate(page: params[:page], :per_page => 8).order('created_at asc')
    searchName = params[:query].to_s 
    flash[:success] = "Search result for #{searchName}"
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
