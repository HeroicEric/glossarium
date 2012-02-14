class Glossary < ActiveRecord::Base

  validates :name, presence: true

end