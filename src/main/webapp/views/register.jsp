<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let register_form = {
        init: function () {
            $('#register_btn').addClass('disabled');
            $('#register_btn').click(function () {
                register_form.send();
            });
            $('#name').keyup(function () {
                var id = $('#id').val();
                var pwd = $('#pwd').val();
                var lev = $('#lev').val();
                if (id != '' && pwd != '' && lev != '') {
                    $('#register_btn').removeClass();
                }
            })
            $('#id').keyup(function () {
                var txt_id = $(this).val();
                if (txt_id.length <= 3) {
                    return;
                }
                $.ajax({
                    url: '/checkid',
                    data: {id: txt_id},
                    success: function (result) {
                        if (result == 0) {
                            $('#check_id').text('사용가능합니다.');
                            $('#pwd').focus();
                        } else {
                            $('#check_id').text('사용불가능합니다.')

                        }
                    }
                })
            });
        },
        send: function () {
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var lev = $('#lev').val();
            if (id.length <= 3) {
                $('#check_id').text('4자리 이상이어야 합니다')
                $('#id').focus();
                return;
            }

            if (pwd == '') {
                $('#pwd').focus();
                return;
            }
            if (lev == '') {
                $('#lev').focus();
                return;
            }

            $('#register_form').attr({
                'action': '/registerimpl',
                'method': 'post'
            });
            $('#register_form').submit();
        }
    };

    $(function () {
        register_form.init();
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
    <h1 class="h3 mb-2 text-gray-800">REGISTER</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">REGISTER</h6>
        </div>
        <div class="card-body">
            <div id="container"></div>
            <div class="col-sm-8 text-left">
                <div class="container">

                    <form id="register_form" class="form-horizontal text-left well">
                        <div class="form-group">
                            <label for="id">ID</label><br/>
                            <div class="col-sm-8">
                                <input type="text" id="id" name="id" placeholder="Your ID..">
                            </div>
                            <div class="col-sm-10">
                                <span id="check_id" class="bg-danger"></span>
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="pwd">Password</label><br/>
                            <div class="col-sm-8">
                                <input type="password" id="pwd" name="pwd" placeholder="Password..">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lev">Level</label><br/>
                            <div class="col-sm-8">
                                <input type="text" id="lev" name="lev" placeholder="Your Level..">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-8">
                                <button id="register_btn" type="button" class="btn btn-primary">Register</button>
                            </div>
                        </div>
                    </form>
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

                input[type=password], select {
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
                    width: 100%
                }
            </style>


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