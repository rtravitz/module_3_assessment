class SearchController < ApplicationController
  def index
    zipcode = params["zipcode"]
    @stores = Store.generate_stores(zipcode)
    @total = Store.total_stores(zipcode)
  end
end
