class Definition < ActiveRecord::Base
  has_many :terms

  validates_presence_of :text
end
