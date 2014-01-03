class RouteStop < ActiveRecord::Base
  belongs_to :route
  belongs_to :stop

  scope :by_route, -> {select("id, route_id, count(*) as count").group("route_id")}
  scope :by_stop, -> {select("id, stop_id, count(*) as count").group("stop_id")}
  scope :descending, -> {order("count desc")}
  scope :ascending, -> {order("count asc")}

end
