class Glossary < ActiveRecord::Base
  validates :name, presence: true

  has_many :terms

  def new_term(*args)
    self.terms.create(*args)
  end
end