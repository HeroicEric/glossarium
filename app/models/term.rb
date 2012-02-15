class Term < ActiveRecord::Base
  validates :name, :definition, presence: true

  belongs_to :glossary
end
