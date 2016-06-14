require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  before do
    i1 = Item.create(name: "thing", description: "cool", image_url: "something")
    i2 = Item.create(name: "thing2", description: "cooler", image_url: "else")
  end

  describe "Get /api/v1/items" do
    it "returns a hash of item info" do

      get :index, format: :json
# When I send a GET request to /api/v1/items
      body = JSON.parse(response.body)
      # binding.pry
      item_names = body.map {|m| m["name"]}
      item_descriptions = body.map {|m| m["description"]}
      item_image_urls = body.map {|m| m["image_url"]}
      item_created_ats = body.map {|m| m["created_at"]}
      item_updated_ats = body.map {|m| m["updated_at"]}

 # I receive a 200 JSON response
      expect(response.status).to eq(200)

# JSON response containing all items And each item has a name,
      expect(item_names).to match_array(["thing", "thing2"])
      expect(item_descriptions).to match_array(["cool", "cooler"])
      expect(item_image_urls).to match_array(["something", "else"])
      expect(body).not_to include("created_at")
      expect(body).not_to include("updated_at")
      expect(Item.all.count).to eq(2)

  # description, and image_url but not the created_at or updated_at
    end
  end


  # When I send a GET request to /api/v1/items/1 I receive a 200 JSON response containing the name, description, and image_url but not the created_at or updated_at

  describe "Get /api/v1/items/1" do
    it "returns a hash of item info" do

      get :show, id: 1, format: :json
# When I send a GET request to /api/v1/items/1
      body = JSON.parse(response.body)
      # binding.pry
      item_name = body["name"]
      item_description = body["description"]
      item_image_url = body["image_url"]
      item_created_at = body["created_at"]
      item_updated_at = body["updated_at"]

 # I receive a 200 JSON response
      expect(response.status).to eq(200)

# JSON response containing one item, item has a name,
# description, and image_url
      expect(item_name).to eq("thing")
      expect(item_description).to eq("cool")
      expect(item_image_url).to eq("something")
      expect(body).not_to include("created_at")
      expect(body).not_to include("updated_at")
  # but not the created_at or updated_at
    end
  end


# When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON response if the record is successfully deleted

  describe "Delete /api/v1/items/1" do
    it "deletes a hash of item info" do

      delete :destroy, id: 1, format: :json

      expect(response.status).to eq(204)

      expect(Item.all.count).to eq(1)

      expect(response).not_to include("name")
      expect(response).not_to include("description")
      expect(response).not_to include("image_url")
      expect(response).not_to include("created_at")
      expect(response).not_to include("updated_at")
    end
  end

  # When I send a POST request to /api/v1/items with a name, description, and image_url
  # I receive a 201 JSON response if the record is successfully created
  # And I receive a JSON response containing the name, description, and image_url but not the created_at or updated_at

  describe "Create /api/v1/items" do
    it "creates an item and the hash of item info" do

      post :create, id: 1, format: :json, name: "this",
                                          description: "neat",
                                          image_url: "stuff"


      item = Item.last
      expect(response.status).to eq(204)

      expect(Item.all.count).to eq(2)

      expect(response).to include(item.name)
      expect(response).to include(item.description)
      expect(response).to include(item.image_url)
      expect(response).not_to include(item.created_at)
      expect(response).not_to include(item.updated_at)
    end
  end


end
