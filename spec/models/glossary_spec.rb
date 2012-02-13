require_relative '../spec_helper_lite'

stub_module 'ActiveModel::Conversion'
stub_module 'ActiveModel::Naming'

require_relative '../../app/models/glossary'

describe Glossary do
  before(:each) do
    @it = Glossary.new
  end

  it "starts with blank attributes" do
    @it.name.should == nil
  end

  it "supports reading and writing a name" do
    @it.name = "Foo"
    @it.name.should == "Foo"
  end

  it "supports reading and writing the glossary manager reference" do
    @glossary_manager = Object.new
    @it.glossary_manager = @glossary_manager
    @it.glossary_manager.should == @glossary_manager
  end

  it "accepts attributes in the initializer" do
    @it = Glossary.new(name: "foo")
    @it.name.should == "foo"
  end

  describe "#add_to_glossaries" do
    it "adds the glossary to the glossary manager" do
      @gm = mock('glossary_manager')
      @it.glossary_manager = @gm
      @gm.should_receive(:add_glossary).with(@it) { nil }
      @it.add_to_glossaries
    end
  end

end
