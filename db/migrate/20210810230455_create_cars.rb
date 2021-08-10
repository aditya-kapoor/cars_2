class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.integer :manufacturer_id

      t.timestamps
    end
  end
end
