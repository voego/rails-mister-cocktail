# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create!({ name: ingredient["strIngredient1"] })
end

cocktails = {
  strongdesire: { name: 'Strong Desire' },
  properaction: { name: 'Proper Action' },
  dueforgiveness: { name: 'Due Forgiveness' },
  nastyunion: { name: 'Nasty Union' },
  strangeobsession: { name: 'Strange Obsession' },
  tickletongue: { name: 'Tickle Tongue' },
  robinontherocks: { name: 'Robin on the Rocks' },
  leafymorning: { name: 'Leafy Morning' }
}

cocktails.each_key do |cocktail|
  Cocktail.create!(cocktails[cocktail])
end

doses = {
  strongdesire: { description: '40 pounds', cocktail_id: 5, ingredient_id: 2 },
  properaction: { description: '5 litres', cocktail_id: 3, ingredient_id: 3 },
  dueforgiveness: { description: '10 cm', cocktail_id: 4, ingredient_id: 4 },
  nastyunion: { description: '2 cubes', cocktail_id: 6, ingredient_id: 5 },
  strangeobsession: { description: '20 leaves', cocktail_id: 7, ingredient_id: 6 },
  tickletongue: { description: '7 squares', cocktail_id: 8, ingredient_id: 7 },
  robinontherocks: { description: '14 meters', cocktail_id: 9, ingredient_id: 8 },
  leafymorning: { description: '1 kg', cocktail_id: 10, ingredient_id: 9 }
}

doses.each_key do |dose|
  Dose.create!(doses[dose])
end
