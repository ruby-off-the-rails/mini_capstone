class Api::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def create
    if current_user
      product = Product.find_by(id: params[:product_id])
      calculated_subtotal =  params[:quantity].to_i * product.price
      calculated_tax =  calculated_subtotal * 0.09
      calculated_total = calculated_subtotal + calculated_tax

      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total
      )
      @order.save!
      render 'show.json.jb'
    else
      render json: {message: "You cannot do this"}
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.json.jb'
  end

end
