class RoutesController < ApplicationController
  def index
    if params[:route_id]
      redirect_to dataset_route_path(params[:dataset_id], params[:route_id])
    end

  end

  def show
    @dataset = RidershipDataset.find(params[:dataset_id])
    @route = Route.find(params[:id])
    @details = @dataset.ridership_details.by_route_id(params[:id]).page(params[:page]).per(50)

    @total_boardings = @details.inject(0) { |sum, n| sum += n.boardings }
    @avg_boardings = @total_boardings / @details.count

    @total_alightings = @details.inject(0) { |sum, n| sum += n.alightings }
    @avg_alightings = @total_alightings / @details.count
  end
end
