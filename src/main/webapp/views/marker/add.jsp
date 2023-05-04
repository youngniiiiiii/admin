<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let marker_add = {
        init: function () {
            $('#register_btn').click(function () {
                marker_add.send();
            });
        },
        send: function () {
            $('#register_form').attr({
                method: 'post',
                action: '/marker/addimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };
    $(function () {
        marker_add.init();
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
    <h1 class="h3 mb-2 text-gray-800">MARKER</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">MARKER ADD</h6>
        </div>
        <div class="card-body">
            <div id="container"></div>
            <form id="register_form" class="form-horizontal text-left well">

                <div class="form-group">
                    <label for="title">Title:</label><br/>
                    <div class="col-sm-8">
                        <input type="text" id="title" name="title" placeholder="맛집 이름..">
                    </div>
                </div>

                <div class="form-group">
                    <label for="title">Target:</label><br/>
                    <div class="col-sm-8">
                        <input type="text" id="target" name="target" placeholder="맛집 홈페이지 주소..">
                    </div>
                </div>

                <div class="form-group">
                    <label for="lat">Lat:</label><br/>
                    <div class="col-sm-8">
                        <input type="text" id="lat" name="lat" placeholder="맛집 위치1">
                    </div>
                    <label for="lng">Lng:</label><br/>
                    <div class="col-sm-8">
                        <input type="text" id="lng" name="lng" placeholder="맛집 위치2">
                    </div>
                </div>

                <div class="form-group">
                    <label for="imgfile">Image:</label><br/>
                    <div class="col-sm-8">
                        <input type="file" id="imgfile" name="imgfile" placeholder="Input image..">
                    </div>
                </div>

                <div class="form-group">
                    <label for="loc">Loc:</label><br/>
                    <div class="col-sm-8">
                        <input type="text" id="loc" name="loc" placeholder="맛집 그룹..">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-8">
                        <button id="register_btn" type="button" class="btn btn-success">Register</button>
                    </div>
                </div>
            </form>
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
