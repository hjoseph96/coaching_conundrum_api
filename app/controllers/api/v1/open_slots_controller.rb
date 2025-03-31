class Api::V1::OpenSlotsController < ApplicationController
  def index
    @open_slots = OpenSlot.all

    render json: { success: true, events: @open_slots }
  end

  def create
    @open_slot = OpenSlot.new(open_slot_params)

    if @open_slot.save
      render json: { success: true, open_slot: @open_slot }
    else
      render json: { error: @open_slot.errors.map(&:full_message).join(", ") }
    end
  end

  private

  def open_slot_params
    params.require(:open_slot).permit(:start, :end, :user_id)
  end
end
