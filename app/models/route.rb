class Route < ActiveRecord::Base
  has_many :route_stops

  has_many :stops, through: :route_stops

  STANDARD_CAPACITY = 82
  LARGE_CAPACITY = 125
end
