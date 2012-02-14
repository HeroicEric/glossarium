require_relative "../../app/models/glossary_manager"
require 'ostruct'

describe GlossaryManager do

  before do
    @it = GlossaryManager.new
  end

  it "starts with no glossaries" do
    @it.glossaries.should == []
  end

  describe "#add_glossary" do
    it "adds the glossary to the glossaries" do
      @glossary = Factory(:glossary)
      @it.add_glossary(@glossary)
      @it.glossaries.should include(@glossary)
    end
  end

  describe "#new_glossary" do
    before(:each) do
      @new_glossary = Glossary.new
    end

    it "returns a new glossary" do
      @it.new_glossary.class.should == Glossary
    end

    it "makes a glossary using the given attributes" do
      new_glossary = @it.new_glossary(name: "foo")
      new_glossary.name.should == "foo"
    end
  end

end