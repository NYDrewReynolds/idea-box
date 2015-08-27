require 'spec_helper'

describe "User", :type => :feature, :js => true do

  before(:each) do
    visit root_path
    fill_in "idea-title", :with => "woo"
    fill_in "idea-body", :with => "hoo"
    click_link_or_button "Save!"
    fill_in "idea-title", :with => "hello"
    fill_in "idea-body", :with => "world"
    click_link_or_button "Save!"
  end

  it "can search an idea" do
    expect(page).to have_content('woo')
    expect(page).to have_content('hoo')
    expect(page).to have_content('hello')
    expect(page).to have_content('world')
    fill_in "filter_ideas", :with => "hello"
    expect(page).to_not have_content('woo')
    expect(page).to_not have_content('hoo')
    expect(page).to have_content('hello')
    expect(page).to have_content('world')
  end
end
