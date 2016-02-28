class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  
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
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
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
      params.require(:recipe).permit(:title, :description, ingredients_attributes: [:id, :name, :_destroy],
                                                           directions_attributes: [:id, :step, :_destroy])
    end
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    
end