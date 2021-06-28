

class MultiMarkerScript {

  static String script = '''
  var mapContainer = document.getElementById('map'),
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), 
        level: 3
    };

var map = new kakao.maps.Map(mapContainer, mapOption); 
 
var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: 'B', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: 'C', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: 'D',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
    var imageSize = new kakao.maps.Size(24, 35); 
    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
for (var i = 0; i < positions.length; i ++) {
    
    
    var marker = new kakao.maps.Marker({
        map: map, 
        position: positions[i].latlng, 
        title : positions[i].title, 
        image : markerImage 
    });
}
  ''';
}