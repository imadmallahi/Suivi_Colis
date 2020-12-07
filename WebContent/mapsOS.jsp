<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      rel="stylesheet"
      href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css"
      integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
      crossorigin=""
    />
    <script
      src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js"
      integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg=="
      crossorigin=""
    ></script>
    <style>
      #map {
        height: 580px;
        width: 100%;
      }
    </style>
    <title>Document</title>
  </head>
<body>
    
    <p>
      latitude: <span id="latitude"></span><br />
      longitude: <span id="longitude"></span>
    </p>
    <div id="map"></div>
    <script>
      if ('geolocation' in navigator) {
        console.log('geolocation available');
        navigator.geolocation.getCurrentPosition(position => {
          lat = position.coords.latitude;
          lon = position.coords.longitude;
          console.log(lat, lon);
          document.getElementById('latitude').textContent = lat;
          document.getElementById('longitude').textContent = lon;

          const map = L.map('map').setView([lat, lon], 15);
          const attribution =
            '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors';
          const tileUrl = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
          const tiles = L.tileLayer(tileUrl, { attribution });
          tiles.addTo(map);
          const marker = L.circleMarker([lat, lon]).addTo(map);
          marker.bindPopup('Your position');

          ///for add a listener marker
          var theMarker = {};

          map.on('click',function(e){
            lat = e.latlng.lat;
            lon = e.latlng.lng;
            document.getElementById('latitude').textContent = lat;
            document.getElementById('longitude').textContent = lon;

            alert("You clicked the map at LAT: "+ lat+" and LONG: "+lon );
                //Clear existing marker, 

                if (theMarker != undefined) {
                      map.removeLayer(theMarker);
                };

            //Add a marker to show where you clicked.
             theMarker = L.marker([lat,lon]).addTo(map);  
             theMarker.bindPopup('<p>Your agence</p>').openPopup();
        }); 
        });
      } else {
        console.log('geolocation not available');
      }
    </script>
  </body>
</html>