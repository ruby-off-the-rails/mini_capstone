class Api::OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: 2,
      product_id: 2,
      quantity: 5,
      subtotal: 10,
      tax: 0.9,
      total: 10.9
    )
    @order.save
    render 'show.json.jb'
  end
end
