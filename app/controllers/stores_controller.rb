class StoresController < ApplicationController
  def show
    id = params[:id]
    @store_info = BestbuyService.new.store_info(id)[:stores].first
    @hours = @store_info[:hoursAmPm].split(";")
  end
end
