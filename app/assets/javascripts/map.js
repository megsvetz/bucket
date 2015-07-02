$(document).ready(function(){
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([
      {
        "lat": $('#map').data('lat'),
        "lng": $('#map').data('long'),
        "picture": {
          "url": "http://commentsmeme.com/wp-content/uploads/2013/12/Star-Graphics-1-300x286.png",
          "width":  36,
          "height": 36
        },
        "infowindow": "hello!"
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(6);
  });
});