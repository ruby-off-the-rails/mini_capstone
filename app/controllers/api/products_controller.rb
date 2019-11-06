class Api::ProductsController < ApplicationController
  def index
    render 'products.json.jb'
  end
end
