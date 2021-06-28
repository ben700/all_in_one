import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';

class KakaoMapView extends StatelessWidget {
  /// Map width. If width is wider than screen size, the map center can be changed
  final double width;

  /// Map height
  final double height;

  /// latitude
  final double lat;

  /// longitude
  final double lng;

  /// Kakao map key javascript key
  final String kakaoMapKey;

  /// If it's true, zoomController will be enabled
  final bool showZoomControl;

  /// If it's true, mapTypeController will be enabled. Such as normal map, sky view
  final bool showMapTypeControl;

  /// Set marker image. If it's null, default marker will be showing
  final String markerImageURL;

  /// marker tap event
  final void Function(JavascriptMessage)? onTapMarker;

  /// This is used to make your own features.
  /// Only map size and center position is set.
  /// And other optional features won't work.
  /// such as Zoom, MapType, markerImage, onTapMarker
  final String? customScript;

  /// When you want to use key for the widget to get some features
  /// such as position, size, etc you can use this
  final GlobalKey? mapWidgetKey;

  KakaoMapView(
      {required this.width,
      required this.height,
      required this.kakaoMapKey,
      required this.lat,
      required this.lng,
      this.showZoomControl = false,
      this.showMapTypeControl = false,
      this.onTapMarker,
      this.markerImageURL = '',
      this.customScript,
      this.mapWidgetKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: mapWidgetKey,
      height: height,
      width: width,
      child: WebView(
          initialUrl: (customScript == null) ? _getHTML() : _customScriptHTML(),
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: onTapMarker == null
              ? null
              : Set.from([
                  JavascriptChannel(
                      name: 'onTapMarker', onMessageReceived: onTapMarker!)
                ]),
          debuggingEnabled: true,
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            Factory(() => EagerGestureRecognizer()),
          ].toSet()),
    );
  }

  String _getHTML() {
    String iosSetting = '';
    String markerImageOption = '';

    if (Platform.isIOS) {
      iosSetting = 'min-width:${width}px;min-height:${height}px;';
    }

    if (markerImageURL.isNotEmpty) {
      markerImageOption = 'image: markerImage';
    }

    return Uri.dataFromString('''
<html>
<header>
  <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=yes\'>
</header>
<body style="padding:0; margin:0;">
	<div id='map' style="width:100%;height:100%;$iosSetting"></div>
	<script type="text/javascript" src='https://dapi.kakao.com/v2/maps/sdk.js?autoload=true&appkey=$kakaoMapKey'></script>
	<script>
		var container = document.getElementById('map');
		
		var options = {
			center: new kakao.maps.LatLng($lat, $lng),
			level: 3
		};
		var map = new kakao.maps.Map(container, options);
		
		if(${markerImageURL.isNotEmpty}){
		  var imageSrc = '$markerImageURL',
		      imageSize = new kakao.maps.Size(64, 69),
		      imageOption = {offset: new kakao.maps.Point(27, 69)},
		      markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		}
		var markerPosition  = new kakao.maps.LatLng($lat, $lng);
		
		var marker = new kakao.maps.Marker({
      position: markerPosition,
      $markerImageOption
    });
    
    marker.setMap(map);
    
    if(${onTapMarker != null}){
      kakao.maps.event.addListener(marker, 'click', function(){
        onTapMarker.postMessage('marker is tapped');
      });
    }
		
		if($showZoomControl){
		  var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    }
    
    if($showMapTypeControl){
      var mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
    }
	</script>
</body>
</html>
    ''', mimeType: 'text/html',  encoding: Encoding.getByName('utf-8')).toString();
  }

  String _customScriptHTML() {
    String iosSetting = '';
    String markerImageOption = '';

    if (Platform.isIOS) {
      iosSetting = 'min-width:${width}px;min-height:${height}px;';
    }

    if (markerImageURL.isNotEmpty) {
      markerImageOption = 'image: markerImage';
    }

    return Uri.dataFromString('''
<html>
<header>
  <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=yes\'>
</header>
<body style="padding:0; margin:0;">
	<div id='map' style="width:100%;height:100%;$iosSetting"></div>
	<script type="text/javascript" src='https://dapi.kakao.com/v2/maps/sdk.js?autoload=true&appkey=$kakaoMapKey'></script>
	<script>
var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
    MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
    OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
    OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
    OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
    OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
    OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
    OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
    SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
    SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
    SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
    SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
    markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
    overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
    overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
    spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];
    selectedMarker = null; // 클릭한 마커를 담을 변수

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도 위에 마커를 표시합니다
for (var i = 0, len = positions.length; i < len; i++) {
    var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
        originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
        overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
        normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
        clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
        overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
        
    // 마커를 생성하고 지도위에 표시합니다
    addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
}

    //지도 확대/축소
		if($showZoomControl){
		  var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    }
    
    //지도 벡터그림형식/스카이뷰 타입 순택
    if($showMapTypeControl){
      var mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
    }

// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
    var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
        clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
    
    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: position.latlng,
        title: position.title,
        image: normalImage
    });

    // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
    marker.normalImage = normalImage;

    // 마커에 mouseover 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseover', function() {

        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 오버 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(overImage);
        }
    });

    // 마커에 mouseout 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseout', function() {

        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 기본 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(normalImage);
        }
    });

    // 마커에 click 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
    
        //미리 등록된 함수를 발생.
        onTapMarker.postMessage(position.title + ' is tapped');

        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 클릭 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {

            // 클릭된 마커 객체가 null이 아니면
            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
            marker.setImage(clickImage);
        }

        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
        selectedMarker = marker;
    });
}

// MakrerImage 객체를 생성하여 반환하는 함수입니다
function createMarkerImage(markerSize, offset, spriteOrigin) {
    var markerImage = new kakao.maps.MarkerImage(
        SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
        markerSize, // 마커의 크기
        {
            offset: offset, // 마커 이미지에서의 기준 좌표
            spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
            spriteSize: spriteImageSize // 스프라이트 이미지의 크기
        }
    );
    
    return markerImage;
}
	</script>
</body>
</html>
    ''', mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString();
  }
}
