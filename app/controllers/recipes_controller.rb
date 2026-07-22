class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy toggle_favorite ]

  def index
    @recipes = Recipe.all
    @recipes = @recipes.where("title LIKE ?", "%#{params[:search]}%") if params[:search].present?
    @recipes = @recipes.where(category: params[:category]) if params[:category].present?
  end

  def show
    @review = Review.new
  end

  def new
    @recipe = Current.user.recipes.build
    @recipe.ingredients.build
  end

  def edit
  end

  def create
    @recipe = Current.user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "Recipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy!
    redirect_to recipes_path, notice: "Recipe was successfully destroyed.", status: :see_other
  end

  def toggle_favorite
    favorite = Current.user.favorites.find_by(recipe: @recipe)
    if favorite
      favorite.destroy
    else
      Current.user.favorites.create(recipe: @recipe)
    end
    redirect_to @recipe
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.expect(recipe: [ :title, :description, :cooking_time, :servings, :category, :instructions, :photo,
        ingredients_attributes: [[ :id, :ingredient_name, :quantity, :_destroy ]] ])
    end
end
