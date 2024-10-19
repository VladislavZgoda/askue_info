class CreateCiu8Displays < ActiveRecord::Migration[7.2]
  def change
    create_table :ciu8_displays do |t|
      t.string :transformer_substaion, null: false
      t.text :adress_street, null: false
      t.string :adress_number
      t.text :meter_model, null: false
      t.string :meter_serial_number, limit: 8, null: false
      t.string :display_serial_number, limit: 8, null: false
      t.timestamps
    end
  end
end
