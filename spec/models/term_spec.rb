require 'spec_helper'

describe Term do

  before(:each) do
    @attr = {
      name: "foo",
      definition: "a foo is a bar with baz"
    }
  end

  it "creates an instance of itself when given valid attributes" do
    @it = Term.new(@attr)
    @it.save.should be_true
  end

  it "requires a name" do
    @it = Term.new(@attr.merge(name: ""))
    @it.should_not be_valid
  end

  it "requires a definition" do
    @it = Term.new(@attr.merge(definition: ""))
    @it.should_not be_valid
  end

  it "has a glossary attribute" do
    @it = Term.new(@attr)
    @it.should respond_to(:glossary)
  end
end