class ReviewsController < ApplicationController
  before_action :set_recipe

  def create
    @review = @recipe.reviews.build(review_params)
    @review.user = Current.user
    if @review.save
      redirect_to @recipe, notice: "Review posted."
    else
      redirect_to @recipe, alert: @review.errors.full_messages.join(", ")
    end
  end

  def destroy
    review = @recipe.reviews.find(params[:id])
    review.destroy if review.user == Current.user
    redirect_to @recipe, notice: "Review removed."
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def review_params
      params.expect(review: [ :rating, :comment ])
    end
end
