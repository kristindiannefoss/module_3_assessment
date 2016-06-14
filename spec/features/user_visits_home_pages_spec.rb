require 'rails_helper'

RSpec.feature "UserVisitsHomePages", type: :feature do
  # As a user
  describe "visit root" do
    # When I visit "/"
    visit "/"
    # And I fill in a search box with "80202"
    fill_in "", with: "80202"
    #  and click "search"
    click_on "search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path)


  end



  # And I should see stores within 25 miles of 80202
  # And I should see a message that says "17 Total Stores"
  # And I should see exactly 15 results
  # And I should see the long name, city, distance, phone number and store type for each of the 15 results


end
