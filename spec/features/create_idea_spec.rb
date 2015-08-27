require 'spec_helper'

describe "Ideas", :type => :feature, :js => true do

  before(:each) do
    visit root_path
  end

  it "posts an idea" do
    fill_in "idea-title", :with => "Woo!"
    fill_in "idea-body", :with => "Hoo!"
    click_link_or_button "Save!"
    within('#ideas') do
      expect(page).to have_content("Woo!")
      expect(page).to have_content("Hoo!")
    end
  end
end
