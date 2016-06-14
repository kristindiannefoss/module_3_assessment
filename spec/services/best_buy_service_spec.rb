require 'rails_helper'

describe "it makes a connection" do
  it "gets the stores in zip 80203" do
    @service = BestBuyService.new
    @service.stores("80203")
  end

end
