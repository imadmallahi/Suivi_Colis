<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<style>
/* Set the size of the div element that contains the map */
#map {
	height: 500px; /* The height is 400 pixels */
	width: 600px; /* The width is the width of the web page */
}
</style>
</head>
<body>


	<div id="map" style="height: 500px; width: 600px"></div>
	<br>

	<strong>address :</strong>
	<input id="address" value="" type="hidden">
	<br>
	<strong>coord :</strong>
	<input id="coords" value="">


	<script>
		// Initialize and add the map
		function initMap() {
			// The location of Uluru
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 13,
				center : new google.maps.LatLng(2.8, -187.3),
				mapTypeId : 'terrain'
			});

			// Create a <script> tag and set the USGS URL as the source.
			var script = document.createElement('script');
			// This example uses a local copy of the GeoJSON stored at
			// http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.geojsonp
			script.src = 'style.js';
			document.getElementsByTagName('head')[0].appendChild(script);

			infoWindow = new google.maps.InfoWindow;
			/***************gps****************************/
			// Try HTML5 geolocation.
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					var pos = {
						lat : position.coords.latitude,
						lng : position.coords.longitude
					};

					infoWindow.setPosition(pos);
					infoWindow.setContent('votre position');
					infoWindow.open(map);
					map.setCenter(pos);
				}, function() {
					handleLocationError(true, infoWindow, map.getCenter());
				});
			} else {
				// Browser doesn't support Geolocation
				handleLocationError(false, infoWindow, map.getCenter());
			}

			/////////////

		}

		function handleLocationError(browserHasGeolocation, infoWindow, pos) {
			infoWindow.setPosition(pos);
			infoWindow
					.setContent(browserHasGeolocation ? 'Error: The Geolocation service failed.'
							: 'Error: Your browser doesn\'t support geolocation.');
			infoWindow.open(map);
		}
		/**************************** end gps ******************************************/
		// Loop through the results array and place a marker for each
		// set of coordinates.
		window.eqfeed_callback = function(results) {
			var markers = results.features;
			Array.prototype.forEach.call(markers, function(markerElem) {
				var address = markerElem.properties.place
				var coords = markerElem.geometry.coordinates;
				var latLng = new google.maps.LatLng(coords[1], coords[0]);
				var infowincontent = document.createElement('div');
				var strong = document.createElement('strong');

				strong.textContent = address
				infowincontent.appendChild(strong);
				infowincontent.appendChild(document.createElement('br'));

				var text = document.createElement('text');
				text.textContent = address
				infowincontent.appendChild(text);

				var marker = new google.maps.Marker({
					position : latLng,
					map : map
				});
				marker.addListener('click', function() {
					document.getElementById("address").value = address;
					document.getElementById("coords").value = latLng;
					infoWindow.setContent(infowincontent);
					infoWindow.open(map, marker);
				});

			});

			var i = 0;
			var agent = [];
			google.maps.event
					.addListener(
							map,
							'click',
							function(event) {

								alert('vous avez selectionné la position de votre agence');
								var image = {
									url : 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
									// This marker is 20 pixels wide by 32 pixels high.
									size : new google.maps.Size(20, 32),
									// The origin for this image is (0, 0).
									origin : new google.maps.Point(0, 0),
									// The anchor for this image is the base of the flagpole at (0, 32).
									anchor : new google.maps.Point(0, 32)
								};
								if (i != 0) {
									agent[i - 1].setMap(null);
								}

								agent[i] = new google.maps.Marker({

									position : new google.maps.LatLng(
											event.latLng.lat(), event.latLng
													.lng()),
									icon : image,
									map : map,

									title : "votre agence"

								})
								i++;

								document.getElementById("lat_agence").value = event.latLng.lat();
								document.getElementById("long_agence").value = event.latLng.lng();

							});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBWjL8RtSL-OyHZhHlZJ6mrDYBGQrXtdIU&callback=initMap">
		
	</script>

</body>
</html>