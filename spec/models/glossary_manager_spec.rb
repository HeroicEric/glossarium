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
      @glossary = Object.new
      @it.add_glossary(@glossary)
      @it.glossaries.should include(@glossary)
    end
  end

  describe "#new_glossary" do
    before(:each) do
      @new_glossary = OpenStruct.new
      @it.glossary_maker = -> { @new_glossary }
    end

    it "returns a new glossary" do
      @it.new_glossary.should == @new_glossary
    end

    it "sets the glossary_manager reference for glossary" do
      @it.new_glossary.glossary_manager.should == @it
    end

    it "accepts an attribute hash on behalf of the glossary maker" do
      glossary_maker = mock('glossary_maker')
      glossary_maker.should_receive(:call).with({name: "foo"}).and_return(@new_glossary)
      @it.glossary_maker = glossary_maker
      @it.new_glossary(name: "foo")
    end
  end

end