class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe has been added"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Recipe has not been created"
      render 'new'
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.save
      flash[:success] = "Recipe has been edited"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Recipe has not been edited"
      render 'edit'
    end
  end

  def destroy
    
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:title, :description, :ingredient, :direction)
    end
  
end