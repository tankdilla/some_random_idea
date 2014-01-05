class RidershipRouteDetail < ActiveRecord::Base
  belongs_to :ridership_dataset
  belongs_to :route
end
