class RemoveIngredientsColumn < ActiveRecord::Migration
  def change
    remove_column :recipes, :ingredient
  end
end
