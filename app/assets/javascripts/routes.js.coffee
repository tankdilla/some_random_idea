$(document).on 'ready page:load', ->
  Morris.Line
    element: 'route-chart'
    data: $('#route-chart').data('stops')
    xkey: 'stop'
    ykeys: ['boardings', 'alightings', 'capacity_diff']
    labels: ['Boardings', 'Alightings', 'Capacity Difference']
    parseTime: false
