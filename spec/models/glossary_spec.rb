require 'spec_helper'

describe Glossary do
  before(:each) do
    @attr = {name: "foo"}
  end

  it "creates an instance of itself when given valid attributes" do
    @it = Glossary.new(@attr)
    @it.save.should be_true
  end

  it "requires a name" do
    @it = Glossary.new(@attr.merge(name: nil))
    @it.should_not be_valid
  end

  it "has the terms attribute" do
    @it = Glossary.new(@attr)
    @it.should respond_to(:terms)
  end

  it "starts with no terms" do
    @it = Glossary.new(@attr)
    @it.terms.should == []
  end

  describe "#new_term" do
    before(:each) do
      @it = Glossary.create(@attr)
    end

    it "returns an instance of Term" do
      @it.new_term.class.should == Term
    end

    it "accepts a hash of attributes for the Term to be made" do
      term_attr = Factory.attributes_for(:term)
      term = @it.new_term(term_attr)
      term_attr.each { |k, v| term.send(k.to_sym).should == v }
    end

    describe "when given valid attributes for a term" do
      it "saves newly added term to terms" do
        starting_number = @it.terms.count
        @it.new_term(Factory.attributes_for(:term))
        @it.terms.count.should > starting_number
      end
    end

    describe "when given invalid attributes for a term" do
      it "doesnt add a new term and raises an error" do
        starting_number = @it.terms.count
        lambda { @it.new_term(clowns: "acasca") }.should raise_error
        @it.terms.count.should == starting_number
      end
    end
  end

end
