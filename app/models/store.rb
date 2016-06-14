class Store < OpenStruct
  def self.service
    @service ||=BestBuyService.new
  end

  def self.all
    service.stores(zip).map { |store| Store.new(store)}
  end

  def self.find(id)
    Store.new(service.store(id))
  end
end
