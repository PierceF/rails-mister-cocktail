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

file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
cocktail = Cocktail.new(name: 'NES')
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
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
Cocktail.create(cocktail)
Ingredient.destroy_all

ingredients['drinks'].each do |ingredient|
  # p ingredient["strIngredient1"]
  Ingredient.create(name: ingredient['strIngredient1'])
end

# dose_attributes =

puts 'Finished!'
