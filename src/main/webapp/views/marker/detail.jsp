<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
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
    });
</script>
<style>
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
