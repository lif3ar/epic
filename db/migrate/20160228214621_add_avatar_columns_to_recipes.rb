class AddAvatarColumnsToRecipes < ActiveRecord::Migration
  def up
    add_attachment :recipes, :avatar
  end

  def down
    remove_attachment :recipes, :avatar
  end
end
