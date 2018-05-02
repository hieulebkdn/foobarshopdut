class ShopsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], :per_page => 8).order('created_at asc')
  end

  def search(querryName)
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
