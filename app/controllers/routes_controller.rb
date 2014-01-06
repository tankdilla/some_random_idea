class RoutesController < ApplicationController
  def index
    if params[:route_id]
      redirect_to dataset_route_path(params[:dataset_id], params[:route_id])
    end

  end

  def show
    @dataset = RidershipDataset.find(params[:dataset_id])
    @route = Route.find(params[:id])
    @details = ridership_details.page(params[:page]).per(50)

    @total_boardings = @details.inject(0) { |sum, n| sum += n.boardings }
    @avg_boardings = @total_boardings / @details.count

    @total_alightings = @details.inject(0) { |sum, n| sum += n.alightings }
    @avg_alightings = @total_alightings / @details.count
  end

  private
  def ridership_details
    details =  
      case params[:sort]
        when "boardings"
          @dataset.ridership_details.order("boardings #{params[:direction]}").by_route_id(params[:id])
        when "alightings"
          @dataset.ridership_details.order("alightings #{params[:direction]}").by_route_id(params[:id])
        else
          if params[:direction]
            @dataset.ridership_details.order("stop_id #{params[:direction]}").by_route_id(params[:id])
          else
            @dataset.ridership_details.by_route_id(params[:id])
          end
      end

    details
  end
end
