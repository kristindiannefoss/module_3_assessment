class BestBuyService

  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: 'https://api.bestbuy.com/v1')

  end

  def stores(zip)
    conn.get "/stores(area(#{zip},25)", {
      apiKey: ENV["best_buy_secret_key"]
      format: "json",




    }
  end

end
