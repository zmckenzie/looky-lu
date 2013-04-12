module LookyLu
  class State < ActiveRecord::Base

    attr_accessible :name, :abbreviation

    validates :name, uniqueness: {scope: :abbreviation}

  end
end