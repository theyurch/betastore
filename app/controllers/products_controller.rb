class ProductsController < ApplicationController
	def index
		@products = Products.all
		
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