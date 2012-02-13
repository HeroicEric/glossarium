class Glossary
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :name, :glossary_manager

  def initialize(attrs={})
    attrs.each do |key, val|
      send("#{key}=", val)
    end
  end

  def persisted?
    false
  end

  def add_to_glossaries
    glossary_manager.add_glossary(self)
  end
end