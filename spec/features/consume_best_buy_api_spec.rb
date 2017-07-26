require 'rails_helper'

RSpec.describe "as a user" do
  it "can see all stores within 25 miles of zipcode" do
    visit root_path
    fill_in "zip", with: "80202"
    click_button "Search"

    expect(page).to have_content('17 Total Stores')
    expect(page).to have_css('.store', count: 10)
    within all('.store').first do
      expect(page).to have_content('Name:')
      expect(page).to have_content('City:')
      expect(page).to have_content('Distance:')
      expect(page).to have_content('Phone Number:')
      expect(page).to have_content('Type:')
    end
    
  end
end
