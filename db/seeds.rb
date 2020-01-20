# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients_file = open(url).read

ingredients = JSON.parse(ingredients_file)

# p ingredients[“drinks”][0]
puts 'Cleaning database...'
Cocktail.destroy_all

puts 'Creating cocktails...'

# cocktials_attributes = [
#   { name: 'White Russian' },
#   { name: 'BELLINI'},
#   {
#     name:         'CHAMPAGNE COCKTAIL'
#   },
#   {
#     name:         'IRISH COFFEE'
#   },
#   {
#     name:         'BAMBOO'
#   },
#   {
#     name:         'LONG ISLAND ICED TEA'
#   }
# ]
# Cocktail.create!(cocktials_attributes)

file = URI.open('https://static.vinepair.com/wp-content/uploads/2017/11/white-russian-inside.jpg')
cocktail = Cocktail.new(name: 'White Russian')
cocktail.photo.attach(io: file, filename: 'whiterussian.jpg', content_type: 'image/jpg')
cocktail.save!

file2 = URI.open('https://cdn.liquor.com/wp-content/uploads/2012/06/12153016/Bellini-newest.jpg')
cocktail2 = Cocktail.new(name: 'Bellini')
cocktail2.photo.attach(io: file2, filename: 'Bellini.jpg', content_type: 'image/jpg')
cocktail2.save!

file3 = URI.open('https://res.cloudinary.com/hksqkdlah/image/upload/v1568666100/SFS_champagne_cocktail_150_d2wzhn.jpg')
cocktail3 = Cocktail.new(name: 'Champagne Cocktail')
cocktail3.photo.attach(io: file3, filename: 'Champagnecocktail.jpg', content_type: 'image/jpg')
cocktail3.save!

file4 = URI.open('https://hips.hearstapps.com/delish/assets/18/08/1519246829-delish-irish-coffee.jpg')
cocktail4 = Cocktail.new(name: 'Irish Coffee')
cocktail4.photo.attach(io: file4, filename: 'Irishcoffee.jpg', content_type: 'image/jpg')
cocktail4.save!

file5 = URI.open('https://s3.us-east-2.amazonaws.com/chrissy-tuxedo-no2/1500x861bamboo-8.jpg')
cocktail5 = Cocktail.new(name: 'Bamboo')
cocktail5.photo.attach(io: file5, filename: 'Bamboo.jpg', content_type: 'image.jpg')
cocktail5.save!

file6 = URI.open('https://besthqwallpapers.com/Temp/20-1-2020/long-island-iced-tea-cocktail-darkness-cocktails-macro-glass-with-drink-besthqwallpapers.com-2048x1536.jpg')
cocktail6 = Cocktail.new(name: 'Long Island Ice Tea')
cocktail6.photo.attach(io: file6, filename: 'LongIslandIceTea.jpg', content_type: 'image.jpg')
cocktail6.save!

Ingredient.destroy_all

ingredients['drinks'].each do |ingredient|
  # p ingredient["strIngredient1"]
  Ingredient.create(name: ingredient['strIngredient1'])
end

# dose_attributes =

puts 'Finished!'
