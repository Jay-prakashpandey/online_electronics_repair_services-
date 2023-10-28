<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Online Electronic Easy Repair</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
    <script src="main.js"></script>
     <script src="http://maps.google.com/maps/api/js?libraries=places&region=uk&language=en&sensor=true"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  
		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
    
</head>


<body style="background: linear-gradient(to right, rgb(198, 255, 221), rgb(251, 215, 134), rgb(247, 121, 125));">
    <!-- Main Header -->
    <header class="main-header">
        <h1>Online Electronic Easy Repair</h1>
    </header>
    <!-- Navbar -->
    <nav>
        <ul>
            <li>
                <a href="index.html">Home</a>
            </li>
             <li>
                <a href="admin.jsp" >Admin</a>
            </li>
            <li>
                <a href="technician.jsp" >Technician</a>
            </li>
            <li>
                <a href="customer.jsp" class="active">Customer</a>
            </li>
        </ul>
    </nav>
    <br><br><br>
       <div class="login" style="width: 560px; margin-top: 100px;">
        <form action="customerregact.jsp" method="post">
            <table>
                <tr>
                    <td style="padding-right: 20px">
                        <div class="input-group">
                            <input type="text" name="username" required="">
                            <span>Name</span>
                        </div>
                    </td>
                    <td>
                        <div class="input-group">
                            <input type="password" name="password" required="">
                            <span>Password</span>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <td style="padding-right: 20px">
                        <div class="input-group">
                            <select  name="gender" required="">
                            <option>Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                        </div>
                    </td>
                     <td>
                        <div class="input-group">
                            <input type="email" name="email" required="">
                            <span>Email</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 20px">
                        <div class="input-group">
                            <input type="text" name="address" required="">
                            <span>Address</span>
                        </div>
                    </td>
                    <td>
                        <div class="input-group">
                            <input type="text" name="mobile" id="" pattern="[0-9]{10}" required>
                            <span>Mobile Number</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <tr>
                     
                       <td style="padding-right: 20px" >
                           <div class="input-group">
                                <input name="latitude" class="MapLat" value="" type="text">
                                  <span>Latitude</span>
                           </div>
                      </td>
                       <td>
                           <div class="input-group">
                                <input name="longitude" class="MapLon" value="" type="text">
                                  <span>Longitude</span>
                           </div>
                      </td>
                  </tr>
                  
                   
                 
               
            </table>
            <div class="input-group">
                <button class="btn-hover color-9">Register</button>
            </div>
        </form>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <!-- Main Footer -->
    <!-- <footer class="main-footer" style="background-color: transparent; background-image: none;">
        <p>Developed & Maintained by
            <a href="https://www.1000projects.com/" target="_blank">
                <i class="fa fa-user-circle"></i> 1000 Projects
            </a>
        </p>
    </footer> -->
     <div id="map_canvas" style="height: 350px;width: 550px;margin: 0.6cm;"></div>
    <script>
         $(function () {
         var lat = 17.4375, 
             lng = 78.4483,
             latlng = new google.maps.LatLng(lat, lng),
             image = 'http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png';
         //zoomControl: true,
         //zoomControlOptions: google.maps.ZoomControlStyle.LARGE,
         var mapOptions = {
             center: new google.maps.LatLng(lat, lng),
             zoom: 13,
             mapTypeId: google.maps.MapTypeId.ROADMAP,
             panControl: true,
             panControlOptions: {
                 position: google.maps.ControlPosition.TOP_RIGHT
             },
             zoomControl: true,
             zoomControlOptions: {
                 style: google.maps.ZoomControlStyle.LARGE,
                 position: google.maps.ControlPosition.TOP_left
             }
         },
         map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions),
             marker = new google.maps.Marker({
                 position: latlng,
                 map: map,
                 icon: image
             });
         var input = document.getElementById('searchTextField');
         var autocomplete = new google.maps.places.Autocomplete(input, {
             types: ["geocode"]
         });
         autocomplete.bindTo('bounds', map);
         var infowindow = new google.maps.InfoWindow();
         google.maps.event.addListener(autocomplete, 'place_changed', function (event) {
             infowindow.close();
             var place = autocomplete.getPlace();
             if (place.geometry.viewport) {
                 map.fitBounds(place.geometry.viewport);
             } else {
                 map.setCenter(place.geometry.location);
                 map.setZoom(17);
             }
             moveMarker(place.name, place.geometry.location);
             $('.MapLat').val(place.geometry.location.lat());
             $('.MapLon').val(place.geometry.location.lng());
         });
         google.maps.event.addListener(map, 'click', function (event) {
             $('.MapLat').val(event.latLng.lat());
             $('.MapLon').val(event.latLng.lng());
             infowindow.close();
                     var geocoder = new google.maps.Geocoder();
                     geocoder.geocode({
                         "latLng":event.latLng
                     }, function (results, status) {
                         console.log(results, status);
                         if (status == google.maps.GeocoderStatus.OK) {
                             console.log(results);
                             var lat = results[0].geometry.location.lat(),
                                 lng = results[0].geometry.location.lng(),
                                 placeName = results[0].address_components[0].long_name,
                                 latlng = new google.maps.LatLng(lat, lng);
                             moveMarker(placeName, latlng);
                             $("#searchTextField").val(results[0].formatted_address);
                         }
                     });
         });
        
         function moveMarker(placeName, latlng) {
             marker.setIcon(image);
             marker.setPosition(latlng);
             infowindow.setContent(placeName);
             //infowindow.open(map, marker);
         }
     });
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAEGQITyiWHrfQlkguvuJVAywlGcUv2r8k&callback=myMap"></script>

</body>

</html>