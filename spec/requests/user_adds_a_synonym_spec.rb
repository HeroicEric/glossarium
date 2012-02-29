require 'spec_helper'

feature "User adds a synonym", %{
  As a User
  I want to associate a term with another term
  So that I can easily cross-reference synonymous terms
} do

  # Acceptance Criteria:
  # * When adding a new term I am given the choice to add a new synonym or
  #   define a completely new term.
  # * If I choose to add a new synonym, the associated term must already
  #   exist in the system.
  # * When I've successfully added a synonym, the term should show up in the
  #   glossary listing. And I should see the relationship in both terms.

  let(:term) { Factory(:term, name: "huge") }

  scenario "User adds a valid synonym" do
    visit new_glossary_term_path(term.glossary)
    choose "This term is a synonym for an existing term"
    fill_in "Original Term", :with => term.name
    fill_in "Name", with: "large"
    click_button "Create Term"
    page.should have_content "Term was successfully added to glossary!"
    visit glossary_term_path(term.glossary, term)
    page.should have_link "large"
  end

  scenario "user tries to add a synonym for a term that doesn't exist" do
    visit new_glossary_term_path(term.glossary)
    choose "This term is a synonym for an existing term"
    fill_in "Original Term", :with => "rhinocerous"
    fill_in "Name", with: "large"
    expect { click_button "Create Term" }.should_not change(Term, :count)
    visit glossary_term_path(term.glossary, term)
    page.should_not have_content "rhinocerous"
  end

end