<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let marker_detail_map = {
        map: null,
        init: function () {
            var mapContainer = document.querySelector('#map');
            mapOption = {
                center: new kakao.maps.LatLng(${marker.lat}, ${marker.lng}), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨

            };
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // 마커가 표시될 위치입니다
            var markerPosition = new kakao.maps.LatLng(${marker.lat}, ${marker.lng});

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);

            // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
            // marker.setMap(null);

            // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent = '<img src="/uimg/${marker.img}" style="width: 80px"><div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: iwContent
            });

            // 마커에 마우스오버 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseover', function () {
                // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                infowindow.open(map, marker);
            });

            // 마커에 마우스아웃 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseout', function () {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                infowindow.close();
            });
            kakao.maps.event.addListener(marker, 'click', function () {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                location.href = '${marker.target}';
            });
        }
    }
    let marker_detail = {
        init: function () {
            $('#update_btn').click(function () {
                marker_detail.send();
            });
            $('#delete_btn').click(function () {
                var c = confirm("삭제 하시겠습니까?");
                if (c == true) {
                    location.href = "/marker/deleteimpl?id=${marker.id}";
                }
            });
        },
        send: function () {
            $('#detail_form').attr({
                method: 'post',
                action: '/marker/updateimpl',
                enctype: 'multipart/form-data'
            });
            $('#detail_form').submit();
        },
    };
    $(function () {
        marker_detail.init();
        marker_detail_map.init();
    });
</script>
<style>
    #map {
        width: 400px;
        height: 400px;
        border: 2px solid red;
    }

    .medium_img {
        width: 80px;
        height: 80px;
    }
</style>
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker detail</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${marker.id}</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="detail_form" class="form-horizontal text-left well">
                    <input type="hidden" name="id" value="${marker.id}">
                    <input type="hidden" name="imgname" value="${marker.img}">

                    <div class="form-group">
                        <img src="/uimg/${marker.img}">
                        <div class="col-sm-8">
                        </div>
                        <div class="col-sm-10">
                            <span id="check_id" class="bg-danger"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="title">Title:</label><br/>
                        <div class="col-sm-8">
                            <input type="text" id="title" name="title" value="${marker.title}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="target">Target:</label><br/>
                        <div class="col-sm-8">
                            <input type="text" id="target" name="target" value="${marker.target}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="target">Lat:</label><br/>
                        <div class="col-sm-8">
                            <input type="text" id="lat" name="lat" value="${marker.lat}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="target">Lng:</label><br/>
                        <div class="col-sm-8">
                            <input type="text" id="lng" name="lng" value="${marker.lng}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="target">Loc:</label><br/>
                        <div class="col-sm-8">
                            <input type="text" id="loc" name="loc" value="${marker.loc}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="imgfile">Image:</label><br/>
                        <div class="col-sm-8">
                            <input type="file" id="imgfile" name="imgfile" placeholder="input image..">
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-8">
                            <button id="update_btn" type="button" class="btn btn-success">수정</button>
                            <button id="delete_btn" type="button" class="btn btn-success">삭제</button>
                        </div>
                    </div>
                </form>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-10" id="map">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<style>
    input[type=text], select {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type=number], select {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type=submit] {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background-color: #45a049;
    }

    /*div {*/
    /*    border-radius: 5px;*/
    /*    background-color: #f2f2f2;*/
    /*    padding: 20px;*/
    /*}*/


    .container {
        width: 60%
    }
</style>
