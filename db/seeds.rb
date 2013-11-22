# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# me = Customer.create(name: 'Paul Barry', email: 'mail@paulbarry.com')
# test = Customer.create(name: 'John Doe', email: 'test@example.com')
# Customer.create(name: 'Nowhere Man', email: 'man@nowhere.com')

# muffin = Product.create(name: 'Muffin', price: 2.99)
# smoothie = Product.create(name: 'Smoothie', price: 3.75)
# coffee = Product.create(name: 'Coffee', price: 3.99)

# order = Order.create(customer: me, placed_at: '2013-09-27')
# LineItem.create(order: order, quantity: 1, product: muffin)
# LineItem.create(order: order, quantity: 1, product: smoothie)

# order = Order.create(customer: me, placed_at: Time.current)
# LineItem.create(order: order, quantity: 1, product: smoothie)

# order = Order.create(customer: test, placed_at: Time.current)
# LineItem.create(order: order, quantity: 1, product: muffin)
# LineItem.create(order: order, quantity: 1, product: coffee)


Category.create!(name: 'Clothing')
Category.create!(name: 'Stuff')

# add stock qtys

clothing.products << Product.create(name: 'hat', price: 3.99)
Product.create(name: 'hoodie', price: 3.99)
stuff.products << Product.create(name: 'iphone_case', price: 3.99)
Product.create(name: 'journal', price: 3.99)
Product.create(name: 'shirt', price: 3.99)
Product.create(name: 'sticker', price: 3.99)


