require 'spec_helper'

describe Term do

  it { should belong_to :glossary }
  it { should belong_to :definition }

  let(:term) { Term.new(attr) }
  let(:glossary) { Factory(:glossary) }
  let(:attr) do
    {
      name: "foo",
      definition_attributes: Factory.attributes_for(:definition),
      glossary: glossary
    }
  end

  it "creates an instance of Term when given valid attributes" do
    term.save!
  end

  it "requires a name" do
    attr.merge!(name: "")
    term.should_not be_valid
  end

  it "requires a definition" do
    term.definition = nil
    term.should_not be_valid
  end

  it "requires a glossary" do
    term.glossary = nil
    term.should_not be_valid
  end

  it "accepts nested attributes for definition" do
    pending
  end

  describe "#synonyms" do
    let!(:definition) { term.definition }
    let!(:synonym1) { Factory(:term, definition: definition, glossary: glossary) }
    let!(:synonym2) { Factory(:term, definition: definition, glossary: glossary) }

    it "returns all other terms for the same definition" do
      term.synonyms.should include(synonym1)
      term.synonyms.should include(synonym2)
    end

    it "does not return itself" do
      term.save!
      term.synonyms.should_not include(term)
    end
  end
end