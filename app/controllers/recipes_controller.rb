class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @recipes = Recipe.all
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
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
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe has been edited"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Recipe has not been edited"
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    flash[:notice] = "Recipe has been deleted"
    redirect_to root_path
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:title, :description, :avatar, ingredients_attributes: [:id, :name, :_destroy],
                                                                    directions_attributes: [:id, :step, :_destroy])
    end
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    
end