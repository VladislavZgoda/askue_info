class Ciu8Display < ApplicationRecord
  validates :transformer_substation, :adress_street, :meter_model,
    :meter_serial_number, :display_serial_number, presence: true

  validates :meter_serial_number, :display_serial_number, numericality: {
    only_integer: true, message: "Серийный номер должен состоять только из целых цифр 0-9."
  }

  validates :meter_serial_number, :display_serial_number, length: {
    is: 8, message: "Длинна серийного номера должна состоять из %{count} цифр."
  }

  validates :meter_serial_number, :display_serial_number, uniqueness: {
    message: "Серийный номер уже существует."
  }

  scope :ordered, -> { order(id: :desc) }

  before_validation :add_zero_to_the_begging_of_serial_number

  after_create_commit -> { broadcast_prepend_to "ciu8_displays" }

  private

  def add_zero_to_the_begging_of_serial_number
    self.meter_serial_number = "0" + meter_serial_number if valid_for_add_zero?(meter_serial_number)
    self.display_serial_number = "0" + display_serial_number if valid_for_add_zero?(display_serial_number)
  end

  def valid_for_add_zero?(number)
    true if number.length == 7 && !number.start_with?("0")
  end
end
