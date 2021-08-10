class AddManufacturerReferenceToCars < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cars, :manufacturers
    add_index :cars, :manufacturer_id
    change_column_null :cars, :manufacturer_id, false
  end
end
