class RemoveIngredientsColumn2 < ActiveRecord::Migration
  def change
    remove_column :recipes, :direction
  end
end
