class Stop < ActiveRecord::Base
  has_many :route_stops

  has_many :routes, through: :route_stops 

  belongs_to :on_street, class_name: "Street", foreign_key: "on_street_id"
  belongs_to :cross_street, class_name: "Street", foreign_key: "cross_street_id"
end
