json.extract! ingredient, :id, :ingredient_name, :quantity, :recipe_id, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
