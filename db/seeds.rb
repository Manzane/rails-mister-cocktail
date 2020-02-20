require 'json'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

opening = open(url).read
parsing = JSON.parse(opening)
puts 'Creating ingredients...'


parsing["drinks"].each do |x|
  Ingredient.new( name: x["strIngredient1"]).save!
end

puts 'Finished!'
