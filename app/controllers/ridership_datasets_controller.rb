class RidershipDatasetsController < ApplicationController
  def show
  	@dataset = RidershipDataset.find(params[:id])

    @routes = Route.all
  end
end
