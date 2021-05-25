class FoodsController < ApplicationController
  def new
    @orders= current_user.orders.all
  end
end
