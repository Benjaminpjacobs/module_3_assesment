require 'rails_helper'

RSpec.describe "as a user" do
  it "can see all stores within 25 miles of zipcode" do
    visit root_path
    fill_in "search", with: "80202"
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

# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
# And I should see the long name, city, distance, phone number and store type for each of the 10 results