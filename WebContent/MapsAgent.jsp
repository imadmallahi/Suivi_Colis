<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
 
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
    
  </head>
  <body>
    
    <div id="map"></div>
    <script>
      if ('geolocation' in navigator) {
        console.log('geolocation available');
        navigator.geolocation.getCurrentPosition(position => {
        	
        	///for add all markers agent
        	var planes =[
        		
        		  <c:forEach var="marker" items="${agences}">
                  [' Agence de ${marker.getZone()} ',  ${marker.getLat_agence()}, ${marker.getLong_agence()} ],
                 </c:forEach>
        	  ];
        	///
          lat = position.coords.latitude;
          lon = position.coords.longitude;
          console.log(lat, lon);
         
          const map = L.map('map').setView([lat, lon], 15);
          const attribution =
            '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors';
          const tileUrl = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
          const tiles = L.tileLayer(tileUrl, { attribution });
          tiles.addTo(map);
          const marker = L.circleMarker([lat, lon]).addTo(map);
          marker.bindPopup('Your position');

        ///for add all markers agent
  		for (var i = 0; i < planes.length; i++) {
  			markers = new L.marker([planes[i][1],planes[i][2]])
  				.bindPopup(planes[i][0])
  				.addTo(map);
  		}
  	///         
       
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
    	  alert(this.getLatLng());
      }
      
    

         
         
    </script>
  </body>
</html>
