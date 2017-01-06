class StoresController < ApplicationController
  def show
    id = params[:id]
    @store = BestbuyService.new.store_info(id)[:stores].first
    @hours = @store[:hoursAmPm].split(";")
  end
end
