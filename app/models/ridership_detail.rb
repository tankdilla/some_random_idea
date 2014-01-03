class RidershipDetail < ActiveRecord::Base
  belongs_to :ridership_dataset
  belongs_to :stop

  scope :by_route_number, ->(route_number) {joins(stop: {route_stops: :route}).where('routes.number' => route_number)}
  scope :by_route_id, ->(route_id) {joins(stop: :route_stops).where('route_stops.route_id' => route_id)}

end
