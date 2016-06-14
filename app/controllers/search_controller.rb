class SearchController < ApplicationController

  def index
    @stores = Stores.all
  end

end
