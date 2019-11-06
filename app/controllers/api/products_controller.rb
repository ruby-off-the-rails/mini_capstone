class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'products.json.jb'
  end

  def first
    @product = Product.find_by(id: 1)
    render 'one_product.json.jb'
  end
end
