class Ciu8DisplaysController < ApplicationController
  def index
    @ciu8_displays = Ciu8Display.all
  end
end
