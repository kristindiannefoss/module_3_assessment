class SearchController < ApplicationController

  def index
    @all_stores = Stores.all
    @stores = Stores.all.take(15)
  end

  def show
    @store = Store.find(params[:id])
  end

end
