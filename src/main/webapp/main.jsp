<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/11/26
  Time: 20:42
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
    <title>主页</title>
    <!--引入css文件-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.css"/>
    <!--引入jQuery-->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <!--引入js文件-->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
    <script>
        $(function () {
            var dz = true;
            //点赞
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
            //进入时查看是否收藏
            $.ajax({
                url: '${pageContext.request.contextPath}/article/sc_ua_init',
                data: 'aid=${sessionScope.article.id}&uid=${sessionScope.login.id}',
                dataType: 'json',
                success: function (d) {
                    console.log(d);
                    <%--console.log(${sessionScope.article.id});--%>
                    <%--console.log(${sessionScope.login.id});--%>
                    $("#sc_user").html(d.sc_status);
                },
                error: function () {
                    console.log("收藏状态获取错误");
                }
            });
            //修改收藏
            $("#sc_user").click(function () {
                var a = $("#sc_user").text();
                console.log(a);
                $.ajax({
                    url: '${pageContext.request.contextPath}/article/sc_ua',
                    data: 'aid=${sessionScope.article.id}&uid=${sessionScope.login.id}',
                    dataType: 'json',
                    success: function (d) {
                        console.log(d)
                        $("#sc_user").html(d.sc_status);
                    },
                    error: function () {
                        console.log("错误")
                    }
                })
            });
        });

        function dz_com(d) {
            var dz = $(d);
            var x = dz.prev();
            var id = x.attr("values");
            console.log(dz.text())
            console.log(id)
            $.ajax({
                url: '${pageContext.request.contextPath}/article/dz_c',
                data: 'count='+dz.text()+"&cid="+id,
                dataType: 'json',
                success: function (d) {
                    console.log("成功返回用户点赞"+d);
                    dz.html(d);

                },
                error: function () {
                    console.log("用户点赞获取错误");
                }
            })
        }

    </script>
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
                    <li><a href="${pageContext.request.contextPath}/main.jsp">首页</a></li>
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
                    欢迎 ${requestScope.login.realname}&nbsp;<img src="${pageContext.request.contextPath}/img/pkq07.jpg"
                                                                class="img-circle" alt="" width="30px"
                                                                height="30px"></a></li>
                </div>
            </div>
        </div>
    </div>
    <!--左侧-->
    <div class="col-md-10">
        <!--推荐-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>推荐</h3>
            </div>
            <!--问题浏览-->
            <div class="panel-body">
                <c:forEach items="${requestScope.list}" var="list">
                    <div class="panel">

                        <div class="panel-heading text-danger">
                            <div class="page-header">
                                <h3>
                                    <a href="${pageContext.request.contextPath}/article/queryAll?id=${sessionScope.article.id}">
                                            ${list.title}
                                    </a>
                                    <small>精选评论（2）</small>
                                </h3>
                            </div>
                        </div>

                        <!--评论回答-->
                        <div class="panel-body">
                            <c:forEach items="${list.users}" var="user" varStatus="a">
                                <div class="panel">
                                    <div class="panel-body">
                                        <p>
                                            <img src="${pageContext.request.contextPath}/img/pkq07.jpg" alt=""
                                                 class="img-circle" width="25px"
                                                 height="25px">&nbsp;&nbsp;${user.realname}
                                        </p>
                                        <p>${user.commends.content}</p>
                                    </div>

                                    <div class="panel-footer" style="background-color: white;">
                                        <span class="glyphicon glyphicon-thumbs-up"></span>
                                        <a hidden values="${user.commends.id}">${user.commends.id}</a>
                                        <a onclick="dz_com(this)" style="color:gray;">${user.commends.dz_count}</a>赞
                                        &nbsp;&nbsp;
                                        <a href="" style="color:gray;"><span class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>
                                    </div>
                                </div>
                            </c:forEach>
                                <%--下拉框--%>
                            <div class="collapse" id="collapseExample">
                                <c:forEach items="${requestScope.users}" var="users">
                                    <div class="panel">
                                        <div class="panel-body">
                                            <p>
                                                <img src="${pageContext.request.contextPath}/img/pkq07.jpg" alt=""
                                                     class="img-circle" width="25px"
                                                     height="25px">&nbsp;&nbsp;${users.c_users.realname}
                                            </p>
                                            <p>${users.content}</p>
                                        </div>
                                        <div class="panel-footer" style="background-color: white;">
                                            <span class="glyphicon glyphicon-thumbs-up"></span>

                                            <a hidden values="${users.id}">${user.id}</a>
                                            <a onclick="dz_com(this)" style="color:gray;">${users.dz_count}</a>赞
                                            &nbsp;&nbsp;
                                            <a href="" style="color:gray;"><span
                                                    class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="panel-footer">
                            <span class="glyphicon glyphicon-thumbs-up"></span>
                            <a id="dz_article">${list.dz_count}</a>赞
                            &nbsp;&nbsp;
                            <a class="" role="button" data-toggle="collapse" href="#collapseExample"
                               aria-expanded="false" aria-controls="collapseExample">
                                <span class="glyphicon glyphicon-comment"></span>
                                &nbsp;${list.pl_count}条评论
                            </a>
                            &nbsp;&nbsp;
                            <span class="glyphicon glyphicon-star "></span><a id="sc_user"></a>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </div>
        <!--关注-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>关注</h3>
            </div>
            <!--问题浏览-->
            <div class="panel-body">
                <div class="panel">
                    <div class="panel-heading text-danger">
                        <div class="page-header">
                            <h3><a href="">如何让他（她）爱上你？</a>
                                <small>精选评论（2）</small>
                            </h3>
                        </div>
                    </div>
                    <!--评论回答-->
                    <div class="panel-body">
                        <div class="panel">
                            <div class="panel-body">
                                <p>
                                    <img src="${pageContext.request.contextPath}/img/pkq07.jpg" alt=""
                                         class="img-circle" width="25px" height="25px">&nbsp;&nbsp;有问必答
                                </p>
                                <p>多读书，多看报，少吃饭多睡觉！</p>
                            </div>
                            <div class="panel-footer" style="background-color: white;">
                                <a href="" style="color:gray;"><span
                                        class="glyphicon glyphicon-thumbs-up"></span>191赞</a>
                                &nbsp;&nbsp;
                                <a href="" style="color:gray;"><span class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-body">
                                <p>
                                    <img src="${pageContext.request.contextPath}/img/pkq02.jpg" alt=""
                                         class="img-circle" width="25px" height="25px">&nbsp;&nbsp;有问有答
                                </p>
                                <p>回想的过程就是从大脑中提取知识的过程，可以帮助我们记忆更久远、更牢固。当你发现有个知识回想不起来的时候，说明你该去复习它了！~</p>
                            </div>
                            <div class="panel-footer" style="background-color: white;">
                                <a href="" style="color:gray;"><span
                                        class="glyphicon glyphicon-thumbs-up"></span>228赞</a>
                                &nbsp;&nbsp;
                                <a href="" style="color:gray;"><span class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>
                            </div>
                        </div>

                    </div>
                    <div class="panel-footer">
                        <a href=""><span class="glyphicon glyphicon-thumbs-up"></span>2048赞</a>
                        &nbsp;&nbsp;
                        <a href=""><span class="glyphicon glyphicon-comment"></span>&nbsp;3227条评论</a>
                        &nbsp;&nbsp;
                        <a href=""><span class="glyphicon glyphicon-star"></span>&nbsp;收藏</a>
                    </div>
                </div>
            </div>
        </div>
        <!--热榜-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>热榜</h3>
            </div>
            <!--问题浏览-->
            <div class="panel-body">
                <div class="panel">
                    <div class="panel-heading text-danger">
                        <div class="page-header">
                            <h3><a href="">如何长时间高效学习？</a>
                                <small>精选评论（2）</small>
                            </h3>
                        </div>
                    </div>
                    <!--评论回答-->
                    <div class="panel-body">
                        <div class="panel">
                            <div class="panel-body">
                                <p>
                                    <img src="${pageContext.request.contextPath}/img/pkq07.jpg" alt=""
                                         class="img-circle" width="25px" height="25px">&nbsp;&nbsp;有问必答
                                </p>
                                <p>多读书，多看报，少吃饭多睡觉！</p>
                            </div>
                            <div class="panel-footer" style="background-color: white;">
                                <a href="" style="color:gray;"><span
                                        class="glyphicon glyphicon-thumbs-up"></span>191赞</a>
                                &nbsp;&nbsp;
                                <a href="" style="color:gray;"><span class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-body">
                                <p>
                                    <img src="${pageContext.request.contextPath}/img/pkq02.jpg" alt=""
                                         class="img-circle" width="25px" height="25px">&nbsp;&nbsp;有问有答
                                </p>
                                <p>回想的过程就是从大脑中提取知识的过程，可以帮助我们记忆更久远、更牢固。当你发现有个知识回想不起来的时候，说明你该去复习它了！~</p>
                            </div>
                            <div class="panel-footer" style="background-color: white;">
                                <a href="" style="color:gray;"><span
                                        class="glyphicon glyphicon-thumbs-up"></span>228赞</a>
                                &nbsp;&nbsp;
                                <a href="" style="color:gray;"><span class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>
                            </div>
                        </div>

                    </div>
                    <div class="panel-footer">
                        <a href=""><span class="glyphicon glyphicon-thumbs-up"></span>2048赞</a>
                        &nbsp;&nbsp;
                        <a href=""><span class="glyphicon glyphicon-comment"></span>&nbsp;3227条评论</a>
                        &nbsp;&nbsp;
                        <a href=""><span class="glyphicon glyphicon-star"></span>&nbsp;收藏</a>
                    </div>
                </div>
            </div>
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
            <li class="list-group-item"><a href="${pageContext.request.contextPath}/upload/query">我的相册</a></li>
        </ul>
    </div>
</div>


</body>
</html>
