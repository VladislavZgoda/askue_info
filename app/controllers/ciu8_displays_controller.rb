class Ciu8DisplaysController < ApplicationController
  def index
    @ciu8_displays = Ciu8Display.all
  end

  def new
    @ciu8_display = Ciu8Display.new
  end

  def create
    @ciu8_display = Ciu8Display.new(ciu8_display_params)

    if @ciu8_display.save
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ciu8_display_params
    params.require(:ciu8_display).permit(
      :transformer_substation,
      :adress_street,
      :adress_number,
      :meter_model,
      :meter_serial_number,
      :display_serial_number
    )
  end
end
