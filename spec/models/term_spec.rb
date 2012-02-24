require 'spec_helper'

describe Term do

  it { should belong_to :glossary }
  it { should belong_to :definition }

  let(:term) { Term.new(attr) }
  let(:attr) do
    {
      name: "foo",
      definition_attributes: Factory.attributes_for(:definition)
    }
  end

  it "requires a name" do
    attr.merge!(name: "")
    term.should_not be_valid
  end

  it "requires a definition" do
    term.definition = nil
    term.should_not be_valid
  end

  it "accepts nested attributes for definition" do
  end
end