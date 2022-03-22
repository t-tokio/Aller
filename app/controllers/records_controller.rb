class RecordsController < ApplicationController
  before_action :set_record, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @records = Record.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to record_path
    else
      render :edit
    end
  end

  def destroy
    @record.destroy
    redirect_to root_path
  end

  private

  def record_params
    params.require(:record).permit(:datetime, :age_id, :food, :quantity, :unit_id, :state_id,
                                   :note).merge(user_id: current_user.id)
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def move_to_index
    @record = Record.find(params[:id])
    @user = @record.user
    redirect_to(root_path) unless @user == current_user
  end
end
