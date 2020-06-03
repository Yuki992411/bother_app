class AddStarToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :star, :integer
  end
end
