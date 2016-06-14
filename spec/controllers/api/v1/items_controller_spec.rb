require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

# When I send a GET request to /api/v1/items I receive a 200 JSON response containing all items And each item has a name,
# description, and image_url but not the created_at or updated_at


  describe "Get /api/v1/items" do
    it "returns a hash of item info" do

      i1 = Item.create(name: "thing", description: "cool", image_url: "something")
      i2 = Item.create(name: "thing2", description: "cooler", image_url: "else")

      get :index, format: :json

      body = JSON.parse(response.body)
      # binding.pry
      item_names = body.map {|m| m["name"]}
      item_descriptions = body.map {|m| m["description"]}
      item_image_urls = body.map {|m| m["image_url"]}
      item_created_ats = body.map {|m| m["created_at"]}
      item_updated_ats = body.map {|m| m["updated_at"]}

      expect(response.status).to eq(200)
      expect(item_names).to match_array(["thing", "thing2"])
      expect(item_descriptions).to match_array(["cool", "cooler"])
      expect(item_image_urls).to match_array(["something", "else"])
      expect




    end


  end


end
