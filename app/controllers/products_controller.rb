class ProductsController < ApplicationController
	# skip_before_filter :require_log_in


	def index
	    @categories = Category.all

	    scope = Product

	    if params[:min_price].present?
	      scope = scope.where('price >= ?', params[:min_price])
	    end

	    if params[:max_price].present?
	      scope = scope.where('price <= ?', params[:min_price])
	    end

	    if params[:category_id].present?
	      scope = scope.in_category(params[:category_id])
	    end

	    if params[:search].present?
	    	scope = scope.search
	    end
	    @products = scope.page(params[:page] || 1).per(10)

		respond_to do |format| 
			format.html 
			format.rss
			format.json do
				render json: @products
			end
		end
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			render json: @product
		else
			render json: {errors: @product.errors }, status: 422
		end
	end


	def show
		@product = Product.find(params[:id])
	end


	private
	def product_params
		params.require(:product).permit(:name, :price)
	end
# do delete
end