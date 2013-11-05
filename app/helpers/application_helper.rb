module ApplicationHelper
	def cart_item_count
		if session[:cart]
			session[:cart].values.sum
		else
			0
		end
	end
end
