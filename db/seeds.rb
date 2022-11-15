# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  drinks = Category.create!(name: 'drinks')
  desserts = Category.create!(name: 'desserts')
  sandwiches = Category.create!(name: 'sandwiches')
  specials = Category.create!(name: 'specials')

  Item.create!(name: 'Original Milk Tea', category: drinks, price_cents: 550, tax_rate: 0.07, description: 'Our best selling classic milk tea')
  Item.create!(name: 'Bottled Water', category: drinks, price_cents: 100, taxable: false, description: 'Straight from the tap')
  Item.create!(name: 'Iced Mocha', category: drinks, price_cents: 400, tax_rate: 0.07,
               description: 'Coffee made from expresso, milk, and chocolate served over ice')
  Item.create!(name: 'Strawberry Vodka Martini', category: drinks, price_cents: 900, tax_rate: 0.15, description: 'A mouthwatering refreshing blend')
  lemonade = Item.create!(name: 'Lemonade', category: drinks, price_cents: 350, tax_rate: 0.07,
                          description: 'Freshly squeezed with no artificial flavoring')

  Item.create!(name: 'Smoked Ham and Turkey Delight', category: sandwiches, price_cents: 700, tax_rate: 0.07,
               description: 'Finest cuts of hickory smoked ham and turkey with Swiss cheese')
  Item.create!(name: 'Vegan Bonanza', category: sandwiches, price_cents: 600, tax_rate: 0.07, description: 'All the vegetables you could imagine :)')
  Item.create!(name: 'Bacon n Egg', category: sandwiches, price_cents: 500, tax_rate: 0.07, description: 'The perfect start for the day')
  roasted_chicken_sandwich = Item.create!(name: 'Roasted Chicken Sandwich', category: sandwiches, price_cents: 750, tax_rate: 0.07,
                                          description: 'Roast chicken served with tomatoes, lettuce, onions, and whole wheat')

  Item.create!(name: 'Salted Chocolate Cake Slice', category: desserts, price_cents: 600, tax_rate: 0.05,
               description: 'Slice of deliciousness and creaminess with a pinch of salt')
  Item.create!(name: 'Lavender Honey Ice Cream', category: desserts, price_cents: 550, tax_rate: 0.05,
               description: 'Lavender flavored ice cream drizzled in honey')
  Item.create!(name: 'Vanilla Creme Brulee', category: desserts, price_cents: 400, tax_rate: 0.05,
               description: 'Light and airy with a hint of vanilla nutty richness')
  mango_pudding = Item.create!(name: 'Mango Pudding', category: desserts, price_cents: 450, tax_rate: 0.05,
                               description: 'Refreshing and light mangoey goodness')

  tropical_refresher = Special.create!(name: 'Tropical Refresher Combo', category: specials, price_cents: 1_000, tax_rate: 0.07,
                                       description: 'Roasted chicken sandwich with lemonade and mango pudding')
  SpecialItem.create!(special: tropical_refresher, item: roasted_chicken_sandwich)
  SpecialItem.create!(special: tropical_refresher, item: lemonade)
  SpecialItem.create!(special: tropical_refresher, item: mango_pudding)
end
