class Term < ActiveRecord::Base
  validates :name, :definition, presence: true

  belongs_to :glossary
  belongs_to :definition

  accepts_nested_attributes_for :definition
end
