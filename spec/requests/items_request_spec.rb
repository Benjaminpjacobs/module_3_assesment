require 'rails_helper'

RSpec.describe "Items Requests" do
  scenario "GET request to /api/v1/items" do
      item = create_list(:item, 5)

      get "/api/v1/items"
      items = JSON.parse(response.body, symbolize_names: true)
      item = items.first

      expect(response).to be_success
      expect(items.count).to eq(5)
      expect(item).to have_key(:id)
      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
      expect(item).to have_key(:image_url)
      expect(item).to_not have_key(:created_at)
      expect(item).to_not have_key(:updated_at)
  end

  scenario "GET request to `/api/v1/items/1" do
    item = create(:item)
    
    get "/api/v1/items/1"
    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:image_url)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end

  scenario "DELETE request to /api/v1/items/1" do
    item1 = create(:item)
    item2 = create(:item)

    expect(Item.count).to eq(2)

    delete "/api/v1/items/1"

    expect(response).to be_success
    expect(response.status).to eq(204)
    expect(Item.count).to eq(1)
    expect(Item.first).to eq(item2)
  end

  scenario " POST request to /api/v1/items with a name, description, and image_url" do
    expect(Item.count).to eq(0)

    post "/api/v1/items?item[name]=item1&item[description]=item+description&item[image_url]=http://via.placeholder.com/350x150"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(response.status).to eq(201)
    expect(item).to have_key(:id)
    expect(item).to have_key(:name)
    expect(item).to have_key(:description)
    expect(item).to have_key(:image_url)
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated_at)
  end
end






# For this challenge clone [Storedom](https://github.com/turingschool-examples/storedom).

# We need an API for the application that can both read and write data. Start by focusing on functionality for items. All of this should happen in a dedicated, versioned controller.

# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at

# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at

# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted

# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at

# * Verify that your non-GET requests work using Postman or curl. (Hint: `ActionController::API`). Why doesn't the default `ApplicationController` support POST and PUT requests?