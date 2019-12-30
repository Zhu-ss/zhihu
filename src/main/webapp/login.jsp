<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/11/26
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8"/>
    <!--在手机网站，都需要加上视口约束！！！-->
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <!--以最新的内核渲染页面-->
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>登录</title>
    <!--引入css文件-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.css"/>
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.min.css"/>--%>
    <style type="text/css">

    </style>
</head>
<body class="container">
<div class="col-md-4 col-md-offset-4">
    <div class="panel" style="width: 300px;">
        <div class="middle-box text-center loginscreen  animated fadeInDown">
            <div>
                <div>
                    <h1 class="logo-name"><img src="${pageContext.request.contextPath}/img/logo.png"></h1>
                </div>
                <h3>欢迎使用 小知</h3>
                <form class="" role="form" action="${pageContext.request.contextPath}/user/login">
                    <div class="form-group">
                        <input type="text" id="email" class="form-control" placeholder="用户名/手机号/邮箱" required="">
                    </div>
                    <div class="form-group">
                        <input type="password" id="pass" class="form-control" placeholder="密码" required="">
                    </div>
                    <button type="button" id="sub" class="btn btn-primary block full-width m-b">登 录</button>
                    <p class="text-muted text-center"><a href="login.html#">
                        <small>忘记密码了？</small>
                    </a> | <a data-backdrop="static" data-toggle="modal" data-target=".bs-example-modal-sm" >注册一个新账号</a>
                    </p>
                </form>
                <span id="login_error" style="color:red;font-size: 20px"></span><br>
                <c:if test="${requestScope.message !=null}">
                    <span id="" style="color:red;font-size: 20px">${requestScope.message}</span><br>
                </c:if>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content " style="text-align: center">
            <p style="font-size:20px;color: #2aabd2">注册</p>
            <form method="post" onsubmit="return sub()" action="${pageContext.request.contextPath}/user/regist" enctype="multipart/form-data" >
                网名<input type="text"  id="user_name" name="realname" /><br>
                电话<input type="text" id="user_tel" name="tel" /><br>
                邮箱<input type="text" id="user_email" name="email" /><br>
                密码<input type="password" id="user_password" name="password" /><br>
                头像<input type="file" name="imgfile"><br>
                <input type="submit" class="btn btn-success" value="注册"></input>
                <span style="color: red" id="user_re"></span>
            </form>
        </div>
    </div>
</div>
<!--引入jQuery-->
<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<!--引入js文件-->
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(function () {
        $("#sub").click(function () {
            var a=$("#email").val();
            var b=$("#pass").val();
            console.log(a+""+b)
            $.ajax({
                url:'${pageContext.request.contextPath}/user/login',
                data:'email='+a+"&password="+b,
                dataType:'json',
                success:function (d) {
                    console.log(d);
                    if (d != null) {
                        location.href='${pageContext.request.contextPath}/article/query'
                    }
                },
                error:function () {
                    console.log("error")
                    $("#login_error").html("登陆错误,请检查")
                }
            })
        })
    })
    function sub() {
        var a=$("#user_email").val()
        var b=$("#user_password").val()
        var c=$("#user_name").val()
        var d=$("#user_tel").val()
        console.log(a+""+b.length)
        if (a.length > 0 && b.length > 0&&c.length>0&&d.length>0) {
            return true;
        } else {
            $("#user_re").html("注册错误,请检查");
        }
        return false;

    }
</script>
</body>
</html>