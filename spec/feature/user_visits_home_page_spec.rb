require 'rails_helper'

describe do
  it 'has 200' do
    visit('/')
    # expect() 200, page.status_code
    # expect(response).to respond_with 200
    expect(page.status_code).to be(200)

    within(:css, 'h1') do
      expect(page).to have_content('Items'), "page should have an Items heading"
    end
  end
end
