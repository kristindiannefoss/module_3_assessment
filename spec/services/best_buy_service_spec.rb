require 'rails_helper'

describe "it makes a connection" do
  it "gets the stores in zip 80203" do
    @service = BestBuyService.new
    @service.stores("80203")



  end



end

#
# def initialize
#   @conn = Faraday.new(url: 'https://api.bestbuy.com/v1/')
# end
#
# def stores(zip)
#   # binding.pry
#   conn.get "stores"
#   #  "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&apiKey=#{ENV[best_buy_secret_key]}"
#
#   response = conn.get "stores(area(#{zip},25))?format=json&apiKey=#{ENV["best_buy_secret_key"]}"
#   JSON.parse(response.body)
# end
