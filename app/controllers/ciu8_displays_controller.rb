class Ciu8DisplaysController < ApplicationController
  before_action :set_ciu8_display, only: [ :edit, :update, :destroy ]

  def index
    @ciu8_displays = Ciu8Display.ordered
  end

  def new
    @ciu8_display = Ciu8Display.new
  end

  def create
    @ciu8_display = Ciu8Display.new(ciu8_display_params)

    render :new, status: :unprocessable_entity unless @ciu8_display.save
  end

  def edit
  end

  def update
    if @ciu8_display.update(ciu8_display_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ciu8_display.destroy
  end

  private

  def set_ciu8_display
    @ciu8_display = Ciu8Display.find(params[:id])
  end

  def ciu8_display_params
    params
      .require(:ciu8_display)
      .permit(
        :transformer_substation,
        :adress_street,
        :adress_number,
        :meter_model,
        :meter_serial_number,
        :display_serial_number
      )
      .each_value { |value| value.try(:squish!) }
  end
end
