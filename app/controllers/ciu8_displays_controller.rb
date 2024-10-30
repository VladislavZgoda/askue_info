class Ciu8DisplaysController < ApplicationController
  before_action :set_ciu8_display, only: [ :edit, :update, :destroy ]

  def index
    @ciu8_displays = Ciu8Display.all
  end

  def new
    @ciu8_display = Ciu8Display.new
  end

  def create
    @ciu8_display = Ciu8Display.new(ciu8_display_params)

    if @ciu8_display.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
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

    redirect_to root_path, status: :see_other
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
