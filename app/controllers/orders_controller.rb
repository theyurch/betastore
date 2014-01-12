class OrdersController < ApplicationController

	def new

		@order = Order.new
		@order.build_credit_card
		Hash(session[:cart]).each do |pid, qty|
			@order.line_items.build(
				product_id: pid,
				quantity: qty)
		end
		

	end

	def create

		@order = Order.new(order_params)
		@order.customer = current_customer
		@order.
		@order.credit_card.customer = current_customer

		if @order.save

		# logger.debug "card info start"
		# logger.debug current_customer.inspect
		# logger.debug current_customer.email.inspect
		# logger.debug @order.inspect
		# logger.debug params[:stripe_customer_token]

	        customer = Stripe::Customer.create(
    	    :card => params[:stripe_customer_token],
          	:description => current_customer.email)
     #    logger.debug customer
	    # logger.debug "card info end"

        	current_customer.update_attributes!(stripe_token: customer.id)

	        Stripe::Charge.create(
	          :amount => @order.total_amount_in_cents,
	          :currency => "usd",
	          :customer => current_customer.stripe_token)

			redirect_to '/', notice: 'Your order has been placed'
		else
			flash.now[:alert] = @order.errors.full_messages.join(', ')
			logger.error "errors: #{@order.errors.full_messages.join(', ')}"
      		render 'new'
      	end
	end

  	def index
  	end

  	protected
  	def order_params
  		params.require(:order).permit(
  			line_items_attributes: [:product_id, :quantity], 
  			credit_card_attributes: [:stripe_token, :card_type, :last_4, :exp_month, :exp_year]
  			)
  	end

end


