$(document).on 'ready page:load', ->
  Morris.Line
    element: 'route-chart'
    data: $('#route-chart').data('stops')
    xkey: 'stop'
    ykeys: ['boardings', 'alightings']
    labels: ['Boardings', 'Alightings']
    parseTime: false
