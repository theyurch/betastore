class CustomerMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.password_reset.subject
  #
  def password_reset(password_reset)
    @password_reset = password_reset
    @url = reset_password_url(id: @password_reset.id, token: @password_reset.token)
    mail to: password_reset.customer.email,
      subject:"Password Reset Instructions"
    # @greeting = "http://localhost:3000/reset_password/#{customer.id}/#{customer.password_resets.last.show}/"
  end
end
