class OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @order= Order.new
  end
  def create
    @order = current_user.orders.new(order_params)
    if @order.save
       flash[:notice] = "We recieved your order. Wait some time, We will be right there."
       redirect_to root_path
    else
      flash[:alert] = "Sorry! Not available right now. "
      redirect_to orders_new_path
    end
  end
  private
  def order_params
    params.require(:order).permit(:item, :quantity, :address)
  end
end
