require 'spec_helper'

describe "Ideas", :type => :feature, :js => true do

  before(:each) do
    visit root_path
    fill_in "idea-title", :with => "Woo!"
    fill_in "idea-body", :with => "Hoo!"
    click_link_or_button "Save!"
  end

  xit "posts an idea" do
    click_link_or_button "X"
    expect(page).to_not have_content('Woo!')
  end
end
