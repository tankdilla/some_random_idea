module RoutesHelper
  def details_for_chart
    @details.map{ |d| 
      {
        stop: d.stop.number, 
        boardings: d.boardings.to_s, 
        alightings: d.alightings.to_s,
        capacity_diff: (d.boardings - d.alightings).to_s
      }
    }.to_json
  end
end
