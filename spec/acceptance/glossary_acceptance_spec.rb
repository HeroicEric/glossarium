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

  scenario "Adding a term to a glossary" do
    gm = GlossaryManager.new
    glossary = gm.new_glossary(name: "foo")
    visit glossary_path(glossary)
    click_on "New Term"
    fill_in "Name", with: "foo term"
    fill_in "Definition", with: "a foo is a bar with baz"
    find('input[type=submit]').click
    current_path.should == glossary_path(glossary)
    page.should have_content "foo term"
    page.should have_content "a foo is a bar with baz"
  end

end
