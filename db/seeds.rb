# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

ridership_lines = CSV.read("#{Rails.root}/app/assets/data/cta_ridership_avg_boardings_october_2012.csv", headers: true)

begin
	ridership_dataset = RidershipDataset.create!(
		description: 'Average Weekday Bus Stop Boardings October 2012',
		as_on: Date.new(2012, 10, 1)
	)
rescue Exception => e
	puts "at dataset, #{e.message}"
end

ridership_lines.flat_map{ |line| [line.field("on_street"), line.field("cross_street")] }.uniq.each do |street|
	begin
		if Street.where(name: street).first.nil?
			Street.create!(name: street)
		end
	rescue Exception => e
		puts "at street, #{e.message}"
	end
end

ridership_lines.flat_map{ |line| line.field('routes').try(:split, ',')}.compact.uniq.each do |route|
	route = route.strip

	begin	
		if Route.where(number: route).first.nil?
			Route.create!(number: route)
		end
	rescue Exception => e
		puts "at route, #{e.message}"
	end
end

ridership_lines.each do |line|
	line = line.to_hash.symbolize_keys

	if Stop.where(number: line[:stop_id]).first.nil?
		begin
			longitude, latitude = line[:location].gsub(/[()]/, '').split(',').map(&:strip)

			stop = Stop.create!(
				number: line[:stop_id],
				on_street_id: 		Street.where(name: line[:on_street]).first.id,
				cross_street_id: Street.where(name: line[:cross_street]).first.id,
				daytype: 	line[:daytype],
				longitude: longitude,
				latitude:  latitude
			)

			routes = (line[:routes].present? ? line[:routes].split(','): []).compact
		rescue Exception => e
			puts "at stop, #{e.message}"
		end

		begin
			routes.try(:each) do |route|
				route = route.strip
				
				RouteStop.create!(
					route_id: Route.where(number: route).first.id,
					stop_id:  stop.id
				)
			end
		rescue Exception => e
			puts "at routestop, #{e.message}"
		end
	end

	begin
		RidershipDetail.create!(
			ridership_dataset_id: ridership_dataset.id,
			stop_id: stop.id,
			boardings: line[:boardings],
			alightings: line[:alightings]
		)
	rescue Exception => e
		"at details, #{e.message}"
	end

end

puts "Ridership Datasets: #{RidershipDataset.count}"
puts "Ridership Details: #{RidershipDetail.count}"
puts "Streets: #{Street.count}"
puts "Routes: #{Route.count}" 
puts "Stops: #{Stop.count}"
puts "RouteStops: #{RouteStop.count}"