require 'rails_helper'

RSpec.describe BestBuyService do 
  it "#within_radius" do
    VCR.use_cassette('best_buy_service') do
 
    radius = 25
    zip = '80202'
    
    response = BestBuyService.within_radius({radius: radius, zip:zip})
 
    expect(response.count).to eq(17)

    store = response.first
    
    expect(store).to be_a Hash
    expect(store).to have_key(:longName)
    expect(store[:longName]).to be_a String
    expect(store).to have_key(:city)
    expect(store[:city]).to be_a String
    expect(store).to have_key(:distance)
    expect(store[:distance]).to be_a Float
    expect(store).to have_key(:phone)
    expect(store[:phone]).to be_a String
    expect(store).to have_key(:storeType)
    expect(store[:storeType]).to be_a String
    end
  end
end