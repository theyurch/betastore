class CartItemsController < ApplicationController

	skip_before_filter :require_log_in
		
	def index
		@cart_items = Hash(session[:cart]).map do |pid, qty|
			CartItem.new(Product.find(pid), qty)
		end
		render layout: !request.xhr?
	end


	def create
		session[:cart] ||= Hash.new(0)
		session[:cart][params[:product_id]] += 1

		respond_to do |format|
			format.html do
				redirect_to products_path, notice: "product #{params[:product_id]} was added to your cart"
			end
			format.json do
				render json: {
					cart: session[:cart],
					item_count: session[:cart].values.sum
				}
			end
		end
	end
end