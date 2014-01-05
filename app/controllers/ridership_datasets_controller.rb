class RidershipDatasetsController < ApplicationController
  def show
  	@dataset = RidershipDataset.find(params[:id])

    @routes = Route.all.sort_by { |route| route.number }

    @route_ridership_details = route_ridership_details
  end

  private
  def route_ridership_details
    if params[:sort]

      details = 
        case params[:sort]
          when "route_number"
            RidershipRouteDetail.all.sort_by { |route_detail| route_detail.route.number}
          when "stops"
            RidershipRouteDetail.all.sort_by { |route_detail| route_detail.route.stops.count}
          when "boardings"
            RidershipRouteDetail.all.sort_by(&:total_boardings)
          when "alightings"
            RidershipRouteDetail.all.sort_by(&:total_alightings)
          when "median_boardings"
            RidershipRouteDetail.all.sort_by(&:median_boardings)
          when "median_alightings"
            RidershipRouteDetail.all.sort_by(&:median_alightings)
        end

      if params[:direction] == "desc"
        details.reverse!
      end
    else
      details = RidershipRouteDetail.all.sort_by { |route_detail| route_detail.total_boardings}.reverse
    end

    details
  end

end
