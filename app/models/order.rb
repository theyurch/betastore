class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :line_items
  accepts_nested_attributes_for :line_items

  def self.recent
    where("placed_at > ?", 7.days.ago)
  end

  def self.by(customer)
    where(customer_id: customer.id)
  end

  def total_price
  	line_items.inject(0) do |sum, li|
  		li.total_price + sum
  	end
  end

end
