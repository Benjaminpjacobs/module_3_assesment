require 'rails_helper'

RSpec.describe "Items Requests" do
  scenario "GET request to /api/v1/items" do
      item = create_list(:item, 5)

      get "/api/v1/items"
      items = JSON.parse(response.body, symbolize_names: true)
      item = items.first

      expect(response).to be_success
      expect(response.status).to be(200)
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
    expect(response.status).to be(200)
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

