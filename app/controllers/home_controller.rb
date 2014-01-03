class HomeController < ApplicationController
  def index
  	@datasets = RidershipDataset.all
  end
end
