class CreateRecipes < ActiveRecord::Migration[8.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :cooking_time
      t.integer :servings
      t.string :category
      t.text :instructions
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
