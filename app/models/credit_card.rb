class CreditCard < ActiveRecord::Base

end
# rails generate model CreditCard cardholder_name:string card_number:string exp_month:integer exp_year:integer
# rails generate migration AddCreditCardRefToOrders credit_card:references
