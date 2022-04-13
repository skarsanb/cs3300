require "rails_helper"

RSpec.feature "Visiting the homepage", type: :feature do
  before(:each) do
    user = User.create!(email: 'test2@gmail.com', password: 'testing')
    login_as user
  end

  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
  end
end
