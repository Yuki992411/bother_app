class AddUserToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user, foreign_key: true, type: :integer
  end
end
