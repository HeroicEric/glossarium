class Term < ActiveRecord::Base
  validates :name, presence: true
  validates :definition, presence: true
  validates :glossary, presence: true

  belongs_to :glossary
  belongs_to :definition

  accepts_nested_attributes_for :definition

  def synonyms
    synonyms = glossary.terms.where(definition_id: definition.id)
    synonyms.select { |s| s != self }
  end
end
