require 'test_helper'

class OrderTest < ActiveSupport::TestCase
	test "an order placed yesterday is returned by recent" do
		assert Order.recent.where(id: orders(:yesterday).id).exists?
	end

	test "an order placed 10 days ago is not returned by recent" do
		assert !Order.recent.where(id: orders(:ten_days_ago).id).exists?
	end
end
