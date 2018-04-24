class ShopsController < ApplicationController
  def index
    @products = Product.all
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
