class CreateCiu8Displays < ActiveRecord::Migration[7.2]
  def change
    create_table :ciu8_displays do |t|
      t.string :transformer_substation
      t.text :adress_street
      t.string :adress_number
      t.string :meter_model
      t.string :meter_serial_number
      t.string :display_serial_number
      t.timestamps
    end
  end
end
