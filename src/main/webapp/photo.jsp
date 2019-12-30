<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html;utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
            $("#sub_up").click(function () {
                var a = $("#sub_img")[0];
                var c = new FormData(a);
                $.ajax({
                    type: 'post',
                    contentType: false,//不需要设置头类型
                    processData: false,
                    url: '${pageContext.request.contextPath}/upload/img_up',
                    data: c,
                    dataType: 'json',
                    success: function (d) {
                        console.log(d)
                        //响应成功后,进行生成新数据
                        var div1=$('<div class="col-sm-6 col-md-4"></div>');
                        var div2=$('<div class="thumbnail"></div>');
                        var img=$('<img src='+d.photo+' alt="" style="width: 100%;height: 170px">')
                        var div3=$('<div class="caption" style="text-align: center;"></div>')
                        var a=$('<p><span hidden>'+d.id+'</span><span hidden>'+d.photo+'</span>' +
                            '<span onclick="img_dow(this)" class="btn btn-primary" role="button">下载</span>' +
                            '已下载<span>'+d.count+'</span>次</p>');
                        div3.append(a);
                        div2.append(img);
                        div2.append(div3);
                        div1.append(div2);
                        $("#img_add").append(div1);

                    },
                    error: function () {
                        console.log("图片上传错误")
                    }
                })
            })
        })
        function img_dow(d) {
            var a=$(d)
            var b=a.next();
            var a1=$(b);
            var c=a.prev();
            var a2=$(c);
            var d = a2.prev();
            var a3=$(d);
            console.log(a.text())
            console.log(a1.text())
            console.log(a2.text())
            console.log(a3.text())
            //TODO 获取数据 将数据经过后台数据加一
            location.href="${pageContext.request.contextPath}/upload/img_dow?img_name="+a2.text()+"&pid="+a3.text();
            var num = Number(a1.text());
            console.log(num+1)
            a1.html(num+1);
        }
    </script>
</head>
<div class="container">
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
    <div class="col-md-10">
        <!--推荐-->
        <div class="panel panel-default">
            <div class="container panel-heading" style="width: 100%">
                <div class="col-md-3">
                    <h3>我的相册</h3>
                </div>
                <div class="col-md-3"></div>
                <div class="col-md-4" style="top: 20px;">
                    <form id="sub_img" method="post" enctype="multipart/form-data">
                        <input type="file" name="img">
                    </form>
                </div>
                <div class="col-md-2" style="top: 20px;">
                    <button id="sub_up">上传图片</button>
                </div>
            </div>

            <div class="panel-body">
                <div class="row" id="img_add">
                    <%--图片展示区--%>
                    <c:forEach items="${requestScope.list}" var="list">
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img src="${list.photo}" alt="" style="width: 100%;height: 170px">
                                <div class="caption" style="text-align: center;">
                                    <p>
                                        <span hidden>${list.id}</span>
                                        <span hidden>${list.photo}</span>
                                        <span onclick="img_dow(this)"  class="btn btn-primary" role="button">下载</span>
                                        已下载<span>${list.count}</span>次
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
    <div class="col-md-2">
        <ul class="list-group">
            <li class="list-group-item">写回答</li>
            <li class="list-group-item">我的草稿</li>
            <li class="list-group-item">我的收藏</li>
            <li class="list-group-item">我关注的问题</li>
            <li class="list-group-item">我的邀请</li>
            <li class="list-group-item">我的相册</li>
        </ul>
    </div>
</div>

</body>
</html>
