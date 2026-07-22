json.extract! recipe, :id, :title, :description, :cooking_time, :servings, :category, :instructions, :user_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
