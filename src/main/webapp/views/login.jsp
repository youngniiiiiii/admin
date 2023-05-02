<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let login_form = {
        init: function () {
            $('#login_btn').click(function () {
                login_form.send();
            });
        },
        send: function () {
            $('#login_form').attr({
                'action': '/loginimpl',
                'method': 'post'
            });
            $('#login_form').submit();
        }
    };
    
    $(function () {
        login_form.init();
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
    <h1 class="h3 mb-2 text-gray-800">LOGIN</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">LOGIN</h6>
        </div>
        <div class="card-body">
            <div id="container"></div>
            <form id="login_form" class="form-horizontal text-left well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="id">ID:</label>
                    <div class="col-sm-8">
                        <input type="text" name="id" class="form-control" id="id" placeholder="Enter ID">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-8">
                        <input type="password" name="pwd" class="form-control" id="pwd" placeholder="Enter password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-8">
                        <div class="checkbox">
                            <label><input type="checkbox"> Remember me</label>
                        </div>
                    </div>
                </div>
            </form>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button id="login_btn" class="btn btn-primary">Login</button>
                </div>
            </div>

        </div>
    </div>

</div>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/datatables-demo.js"></script>