require 'spec_helper'

describe Term do

  it { should belong_to :glossary }
  it { should belong_to :definition }
  it { should have_many :synonyms }

  let(:term) { Term.new(attrs) }
  let(:glossary) { Factory(:glossary) }
  let(:attrs) do
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
    attrs.merge!(name: "")
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
      term.save!
      term.synonyms.should include(synonym1)
      term.synonyms.should include(synonym2)
    end

    it "does not return itself" do
      term.save!
      term.synonyms.should_not include(term)
    end
  end

  describe "setting an original term" do
    let!(:synonym) do
      Factory(:term,
        glossary: glossary)
    end

    it "sets the synonym when an existing term is set" do
      term.original_term = synonym.name
      term.definition.should_not be_nil
      term.save!
      term.synonyms.count.should eql(1)
    end

    it "sets the synonym to nil when the existing term is invalid" do
      term.definition = nil
      term.original_term = "bar"
      term.save.should be_false
      term.errors[:original_term].should_not be_blank
    end
  end
end