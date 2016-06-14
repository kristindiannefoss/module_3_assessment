require 'rails_helper'

RSpec.feature "UserVisitsHomePages", type: :feature do
  # As a user
  describe "visit root" do
    # store = Store.first
    # When I visit "/"
    visit root_path
    # And I fill in a search box with "80202"
    fill_in "zip", with: "80202"
    #  and click "search"
    click_on "search"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq("/search")
    # And I should see stores within 25 miles of 80202
    # expect(store.distance).to ()

    # And I should see a message that says "17 Total Stores"
    expect(page).to have_content("17 Total Stores")
    # And I should see exactly 15 results
    # expect(:css, ul.stores)

    expect(page).to have_css('li#sore_list', count: 15)
    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
    it "shows list sorted by distance" do
      page.should have_tag("ul:nth-last-child(1)", :text => "Best Buy - Belmar")
    end

  end





end
