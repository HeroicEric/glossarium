class Glossary < ActiveRecord::Base
  validates :name, presence: true

  has_many :terms, order: 'LOWER(name) ASC'

  def new_term(*args)
    self.terms.create(*args)
  end

end