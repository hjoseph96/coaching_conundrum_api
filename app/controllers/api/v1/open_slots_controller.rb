class OpenSlotsController < ApplicationController
  def index
    @open_slots = OpenSlot.all
  end

  def create
  end

  private

  def open_slot_params
    params.require(:open_slot).permit(:start_time, :end_time)
  end
end
