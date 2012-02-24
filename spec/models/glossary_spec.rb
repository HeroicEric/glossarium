require 'spec_helper'

describe Glossary do
  let(:glossary) { Glossary.new(attr) }
  let(:attr) do
    { name: "foo" }
  end

  describe "validations" do
    it "creates an instance of itself when given valid attributes" do
      glossary.save.should be_true
    end

    it "requires a name" do
      attr.merge!(name: nil)
      glossary.should_not be_valid
    end

    it "has the terms attribute" do
      glossary.should respond_to(:terms)
    end

    it "starts with no terms" do
      glossary.terms.should == []
    end
  end

  describe "#new_term" do
    before(:each) do
      glossary.save
    end

    it "returns an instance of Term" do
      glossary.new_term.class.should == Term
    end

    it "accepts a hash of attributes for the Term to be made" do
      term_attr = Factory.attributes_for(:term)
      term = glossary.terms.create(term_attr)
      term_attr.each { |k, v| term.send(k.to_sym).should == v }
    end

    describe "when given valid attributes for a term" do
      it "saves newly added term to terms" do
        starting_number = glossary.terms.count
        glossary.new_term(
          Factory.attributes_for(:term).merge(definition: Factory(:definition))
        )
        glossary.terms.count.should > starting_number
      end
    end

    describe "when given invalid attributes for a term" do
      it "doesnt add a new term and raises an error" do
        starting_number = glossary.terms.count
        lambda { glossary.new_term(clowns: "acasca") }.should raise_error
        glossary.terms.count.should == starting_number
      end
    end
  end

  describe "#terms" do
    describe "orders terms alphabetically" do
      before(:each) do
        glossary.save!
      end

      it "returns terms in alphabetical order" do
        terms = %w{banana orange apple}.map do |name|
          Factory(:term, name: name, glossary: glossary)
        end
        ordered_term_names = glossary.terms.map {|term| term.name}
        ordered_term_names.should == %w{apple banana orange}
      end

      it "it treats capitals properly" do
        terms = %w{banana  Banana orange apple}.map do |name|
          Factory(:term, name: name, glossary: glossary)
        end
        ordered_term_names = glossary.terms.map { |term| term.name }
        ordered_term_names.should == %w{apple Banana banana orange}
      end
    end
  end

end
