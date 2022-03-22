class RecordsController < ApplicationController
  def index
    @records = Record.order("created_at DESC")
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path(@record)
    else
      render :new
    end
  end


  private

  def record_params
    params.require(:record).permit(:datetime, :age_id, :food, :quantity, :unit_id, :state_id, :note).merge(user_id: current_user.id)
  end

end
