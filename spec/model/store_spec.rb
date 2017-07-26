require"rails_helper"

RSpec.describe Store do
  it "should wrap response in object" do
    response = {
                longName: "test_name",
                city: "city",
                distance: 23.3,
                phone: "234-324-234",
                storeType: "Big Box"
              }
    store = Store.new(response)

    expect(store.name).to eq(response[:longName])
    expect(store.city).to eq(response[:city])
    expect(store.distance).to eq(response[:distance])
    expect(store.phone).to eq(response[:phone])
    expect(store.type).to eq(response[:storeType])
  end
end