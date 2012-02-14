require 'spec_helper'

describe Glossary do
  before(:each) do
    @attr = {name: "foo"}
  end

  it "requires a name" do
    @it = Glossary.new(@attr.merge(name: nil))
    @it.should_not be_valid
  end

end
