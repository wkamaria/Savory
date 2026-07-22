puts "Seeding database..."

user1 = User.find_or_create_by!(email_address: "amina@example.com") do |u|
  u.name = "Amina"
  u.password = "password123"
  u.password_confirmation = "password123"
end

user2 = User.find_or_create_by!(email_address: "juma@example.com") do |u|
  u.name = "Juma"
  u.password = "password123"
  u.password_confirmation = "password123"
end

recipe1 = Recipe.find_or_create_by!(title: "Swahili Coconut Fish Curry", user: user1) do |r|
  r.description = "A rich, coconutty coastal fish curry with warm spices."
  r.cooking_time = 40
  r.servings = 4
  r.category = "Dinner"
  r.instructions = "Saute onions, garlic and ginger. Add spices, tomatoes, and coconut milk. Simmer, then add fish and cook until done. Serve with rice or ugali."
end
recipe1.ingredients.find_or_create_by!(ingredient_name: "Tilapia fillets") { |i| i.quantity = "500g" }
recipe1.ingredients.find_or_create_by!(ingredient_name: "Coconut milk") { |i| i.quantity = "400ml" }
recipe1.ingredients.find_or_create_by!(ingredient_name: "Onion") { |i| i.quantity = "1 large" }
recipe1.ingredients.find_or_create_by!(ingredient_name: "Garlic cloves") { |i| i.quantity = "3" }
recipe1.ingredients.find_or_create_by!(ingredient_name: "Curry powder") { |i| i.quantity = "1 tbsp" }

recipe2 = Recipe.find_or_create_by!(title: "Mahamri (Swahili Coconut Buns)", user: user2) do |r|
  r.description = "Sweet, fluffy coastal buns flavored with coconut and cardamom, perfect with tea."
  r.cooking_time = 30
  r.servings = 6
  r.category = "Breakfast"
  r.instructions = "Mix flour, sugar, cardamom, and yeast. Add coconut milk and knead into a soft dough. Let rise, cut into triangles, and deep fry until golden."
end
recipe2.ingredients.find_or_create_by!(ingredient_name: "All-purpose flour") { |i| i.quantity = "3 cups" }
recipe2.ingredients.find_or_create_by!(ingredient_name: "Coconut milk") { |i| i.quantity = "1 cup" }
recipe2.ingredients.find_or_create_by!(ingredient_name: "Sugar") { |i| i.quantity = "1/4 cup" }
recipe2.ingredients.find_or_create_by!(ingredient_name: "Ground cardamom") { |i| i.quantity = "1 tsp" }
recipe2.ingredients.find_or_create_by!(ingredient_name: "Active dry yeast") { |i| i.quantity = "1 tsp" }

recipe3 = Recipe.find_or_create_by!(title: "Mango Passion Smoothie", user: user1) do |r|
  r.description = "A refreshing tropical smoothie, great for hot days."
  r.cooking_time = 5
  r.servings = 2
  r.category = "Drinks"
  r.instructions = "Blend all ingredients until smooth. Serve chilled."
end
recipe3.ingredients.find_or_create_by!(ingredient_name: "Ripe mango") { |i| i.quantity = "1" }
recipe3.ingredients.find_or_create_by!(ingredient_name: "Passion fruit pulp") { |i| i.quantity = "2 tbsp" }
recipe3.ingredients.find_or_create_by!(ingredient_name: "Plain yogurt") { |i| i.quantity = "1 cup" }

Review.find_or_create_by!(recipe: recipe1, user: user2) do |rv|
  rv.rating = 5
  rv.comment = "So flavorful, tastes just like home!"
end

Favorite.find_or_create_by!(recipe: recipe1, user: user2)
Favorite.find_or_create_by!(recipe: recipe2, user: user1)

puts "Done seeding!"
