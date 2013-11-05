require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	setup do
		products(:test).update_attribute(:price, 1000)
	end
  	test "fixture" do
  		products(:test)
  		assert_equal "Example", products(:test).name
  	end
end

# C:\Ruby200\run\betastore\betastore>ruby -I test test/models/product_test.rb

