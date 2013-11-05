class PasswordReset < ActiveRecord::Base
  belongs_to :customer
  before_validation :generate_token

  validates_presence_of :customer_id, :token

  def generate_token
    self.token ||= SecureRandom.hex(16)
  end
  def show
  	self.token
  end
end

# learncodethehardway
# railstutorial.org