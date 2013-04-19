class State < ActiveRecord::Base

  attr_accessible :name, :abbreviation

  validates :name, uniqueness: {scope: :abbreviation}

  scope :for_abbreviation, ->(abbrev){where(abbreviation: abbrev)}

  scope :for_name, ->(name){where(name: name)}

end