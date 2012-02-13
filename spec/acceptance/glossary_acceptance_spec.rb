require 'spec_helper'

feature "GlossaryManager", %{
  As a smart guy business guy
  I want to effectively communicate technical terms to clients
  So that we can make sure that we both know what we're talking about
} do

  scenario "Add Glossary" do
    visit root_url
    click_on "New Glossary"
    fill_in "Name", with: "First Glossary"
    find('input[type=submit]').click
    visit root_url
    page.should have_link "First Glossary"
  end

end