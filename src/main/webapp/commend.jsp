<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/11/27
  Time: 21:25
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
    <title>回答问题</title>
    <!--引入css文件-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.css"/>
    <style type="text/css">


    </style>
</head>
<body>
<div class="container">
    <!--顶部导航-->
    <div class="navbar navbar-default " id="navbar-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="" class="navbar-brand"><span class="glyphicon glyphicon-th-large"></span></a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu-1">
                    <span class="caret"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse" id="menu-1">

                <ul class="nav navbar-nav">
                    <li><a href="">关于小知</a></li>
                    <li><a href="main.html">首页</a></li>
                    <li><a href="">等你来答</a></li>
                </ul>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="   btn btn-default">搜索</button>
                </form>
                <button type="button" class="navbar-btn btn btn-primary">提问</button>
                <div class="navbar-btn navbar-right" style="background-color: transparent">
                    欢迎 小知&nbsp;<img src="img/pkq07.jpg" class="img-circle" alt="" width="30px" height="30px"></a></li>
                </div>

            </div>
        </div>
    </div>
    <!--左侧-->
    <div class="col-md-10">

        <div class="panel">
            <c:forEach items="${requestScope.list}" var="list">
                <div class="panel-heading text-danger">
                    <h3>${list.title}</h3>
                    <button type="button" class="btn btn-primary">关注问题</button>
                    <div class="page-header">
                            ${list.pl_count}条评论
                    </div>
                </div>
                <div class="panel-body">
                    <c:forEach items="${list.commends}" var="c">
                        <%--TODO--%>
                        <div class="panel">
                            <div class="panel-body">
                                <p>
                                    <img src="img/pkq04.jpg" alt="" class="img-circle" width="25px" height="25px">&nbsp;&nbsp;
                                        ${c.c_users.realname}
                                </p>
                                <p>${c.content}</p>
                            </div>
                            <div class="panel-footer" style="background-color: white;">
                                <span class="glyphicon glyphicon-thumbs-up"></span>
                                <a id="" style="color:gray;">${c.dz_count}</a>赞
                                &nbsp;&nbsp;
                                <a href="" style="color:gray;"><span class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="panel-footer">
                    <span class="glyphicon glyphicon-thumbs-up"></span><a id="dz_article">${list.dz_count}</a>赞
                    &nbsp;&nbsp;
                    <span class="glyphicon glyphicon-star "></span><a id="sc_user"></a>
                </div>
            </c:forEach>
        </div>

        <!--回答区-->
        <div class="panel">
            <!---写回答------>
            <a name="comment"></a>
            <form role="form">
                <div class="form-group">
                    写回答<br>
                    <input aria-inval type="text" id="pl_user" class="form-control" placeholder="写下您的回答....">
                </div>
                <button type="button" id="pl_user2" class="btn btn-primary block full-width m-b">提交回答</button>
            </form>
        </div>
    </div>
    <!--右侧-->
    <div class="col-md-2">
        <ul class="list-group">
            <li class="list-group-item">写回答</li>
            <li class="list-group-item">我的草稿</li>
            <li class="list-group-item">我的收藏</li>
            <li class="list-group-item">我关注的问题</li>
            <li class="list-group-item">我的邀请</li>
        </ul>
    </div>
</div>


<!--引入jQuery-->
<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<!--引入js文件-->
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(function () {
        var dz = true;
        $("#dz_article").click(function () {
            var a = $("#dz_article").text();
            $.ajax({
                url: '${pageContext.request.contextPath}/article/dz_a',
                data: 'count=' + a + "&id=${requestScope.article.id}" + "&dz=" + dz,
                dataType: 'json',
                success: function (e) {
                    $("#dz_article").text(e);
                    if (dz == true) {
                        dz = false;
                    } else {
                        dz = true;
                    }
                },
                error: function () {
                    console.log("错误");
                }
            })
        });
        $("#pl_user2").click(function () {
            var a=$("#pl_user").val();
            console.log(a);
            location.href="${pageContext.request.contextPath}/article/pl_user?pl="+a+"&id=${sessionScope.login.id}"+"&aid=${requestScope.article.id}";

        });
        //进入时查看是否收藏
        $.ajax({
            url:'${pageContext.request.contextPath}/article/sc_ua_init',
            data:'aid=${sessionScope.article.id}&uid=${sessionScope.login.id}',
            dataType:'json',
            success:function (d) {
                console.log(d);
                <%--console.log(${sessionScope.article.id});--%>
                <%--console.log(${sessionScope.login.id});--%>
                $("#sc_user").html(d.sc_status);
            },
            error:function () {
                console.log("收藏状态获取错误");
            }
        });
        //修改收藏
        $("#sc_user").click(function () {
            var a=$("#sc_user").text();
            console.log(a);
            $.ajax({
                url:'${pageContext.request.contextPath}/article/sc_ua',
                data:'aid=${sessionScope.article.id}&uid=${sessionScope.login.id}',
                dataType: 'json',
                success:function (d) {
                    console.log(d)
                    $("#sc_user").html(d.sc_status);
                },
                error:function () {
                    console.log("错误")
                }
            })
        });
    })
</script>
</body>
</html>