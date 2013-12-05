class Admin::OrdersController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index

    @orders = Order.all
  	@line_items = LineItem.all

  end

  def show
  	@order = Order.find(params[:id])
  end
  
  def update
  	redirect_to admin_orders_path
  end

	# private
	# def set_order
	# 	@order = Order.find(params[:id])
	# end

end
