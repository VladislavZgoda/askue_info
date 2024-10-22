class AddIndexToCiu8Displays < ActiveRecord::Migration[7.2]
  def change
    add_index :ciu8_displays, :display_serial_number, unique: true
    add_index :ciu8_displays, :meter_serial_number, unique: true
  end
end
