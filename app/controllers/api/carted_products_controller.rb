class Api::CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      status: 'carted',
      quantity: params[:quantity]
    )
    # @carted_product.errors.full_messages
    @carted_product.save
    render 'show.json.jb'
  end
end
