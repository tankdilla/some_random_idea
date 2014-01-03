class RoutesController < ApplicationController
  def show
    @dataset = RidershipDataset.find(params[:dataset_id])
    @route = Route.find(params[:id])
    @details = @dataset.ridership_details.by_route_id(params[:id]).page(params[:page])
  end
end
