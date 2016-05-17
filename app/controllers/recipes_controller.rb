class RecipesController < ApplicationController
  def index
  	@search_term = params[:search] || 'chocolate'
  	@keyword = Recipe.for(@search_term)
  end
end
