class Astronaut < ApplicationRecord

  def self.average_age
    average(:age)
  end
end
