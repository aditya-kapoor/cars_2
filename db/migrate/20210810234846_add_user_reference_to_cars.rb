class AddUserReferenceToCars < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cars, :users
    add_index :cars, :user_id
    change_column_null :cars, :user_id, false
  end
end
