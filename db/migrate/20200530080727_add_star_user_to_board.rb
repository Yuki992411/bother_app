class AddStarUserToBoard < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :star_rate, :float
    add_reference :boards, :user, type: :integer, foreign_key: true
  end
end
