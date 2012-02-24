require 'spec_helper'

feature "Glossaries", %{
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

  scenario "Creating a new term in the glossary" do
    glossary = Factory(:glossary)
    visit glossary_path(glossary)
    click_on "New Term"
    fill_in "Name", with: "foo term"
    fill_in "Definition", with: "a foo is a bar with baz"
    find('input[type=submit]').click
    page.should have_content "foo term"
    page.should have_content "a foo is a bar with baz"
  end

  scenario "Viewing a term" do
    term = Factory(:term)
    visit glossary_term_path(term.glossary, term)
    page.should have_content term.name
    page.should have_content term.definition.text
    page.should have_link(
      "Edit", href: edit_glossary_term_path(term.glossary, term))
  end

  scenario "Editing a term" do
    term = Factory(:term)
    visit glossary_term_path(term.glossary, term)
    click_on "Edit"
    fill_in "Name", with: "New Name"
    find('input[type=submit]').click
    page.should have_css("h1", text: "New Name")
  end

  scenario "Deleting a term" do
    term = Factory(:term)
    visit glossary_term_path(term.glossary, term)
    expect { click_on "Delete" }.should change(Term, :count).by(-1)
    page.should have_content "Term was successfully deleted!"
  end

end
