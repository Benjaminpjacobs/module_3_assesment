require 'rails_helper'

describe "Displays items" do

  it "can reach the root page" do
    visit '/'
    assert_equal 200, page.status_code

    within('h1') do
      expect(page).to have_content('Items')
    end
  end
end

