class RecordsController < ApplicationController
  def index
    @records = Record.order("created_at DESC")
  end

  def new

  end
end
