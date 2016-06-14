class BestBuyService

  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: 'https://api.bestbuy.com/v1')
  end

  def stores(zip)
    binding.pry
    #  "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&apiKey=#{ENV[best_buy_secret_key]}"

    response = conn.get "stores(area(#{zip},25))?format=json&apiKey=#{ENV[best_buy_secret_key]}"

    JSON.parse(response.body)
  end

end
