class BestBuyService

  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: 'https://api.bestbuy.com/v1')
  end

  def stores(data)
    conn.get "/stores", {
      apiKey: ENV[""]
    }
  end

end
