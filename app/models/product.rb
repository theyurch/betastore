class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :product_categorizations
  has_many :categories, :through => :product_categorizations

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # def image_url
  #   "/products/#{name.downcase.tr(' ', '_')}.jpg"
  # end

  def self.in_category(category_id)
    includes(:product_categorizations)
      .where('product_categorizations.category_id' => category_id)
  end

end