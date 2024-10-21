class Ciu8Display < ApplicationRecord
  validates :transformer_substation, :adress_street, :meter_model,
    :meter_serial_number, :display_serial_number, presence: {
      message: "Пустое поле."
    }

  validates :meter_serial_number, :display_serial_number, numericality: {
    only_integer: true, message: "Серийный номер должен состоять только из целых цифр 0-9."
  }

  validates :meter_serial_number, :display_serial_number, length: {
    is: 8, message: "Длинна серийного номера должна состоять из %{count} цифр."
  }

  validates :meter_serial_number, :display_serial_number, uniqueness: {
    message: "Серийный номер уже существует."
  }
end
