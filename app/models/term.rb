class Term < ActiveRecord::Base
  validates :name, presence: true
  validates :definition, presence: true
  validates :glossary, presence: true

  belongs_to :glossary
  belongs_to :definition

  #constraints from Rails core require we only call this in
  #context to when a record where persisted? => true
  has_many :synonyms,
    source: :terms,
    through: :definition,
    conditions: proc{ persisted? ? ["terms.id <> ?", id] : ""}

  accepts_nested_attributes_for :definition

  validate :original_term_exists

  def self.not(term)
    where("terms.id <> :term_id", term_id: term.id)
  end

  def original_term=(term)
    term_obj = Term.find_by_name(term)
    @original_term = term
    if term_obj
      self.definition = term_obj.definition
    end
  end

  def original_term
    @original_term
  end
  # def synonyms
  #   synonyms = glossary.terms.where(definition_id: definition.id)
  #   synonyms.select { |s| s != self }
  # end

  protected
  def original_term_exists
    if @original_term.present? && definition.nil?
      errors.add(:original_term, "is invalid or does not exist")
    end
  end
end
