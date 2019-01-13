<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1">
    <title>archive</title>

    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">

    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="icon" type="image/png" href="assets/i/favicon.png">

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">

    <link rel="stylesheet" href="assets/css/amazeui.min.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <script src="js/plugins/template-web.js"></script>
    <!--[if (gte IE 9)|!(IE)]><!-->
    <script src="assets/js/jquery.min.js"></script>
    <!--<![endif]
    <!--[if lte IE 8 ]>
    <script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
    <script src="assets/js/amazeui.ie8polyfill.min.js"></script>
    <![endif]-->
    <script src="assets/js/amazeui.min.js"></script>
    <script src="js/utils.js"></script>
</head>


<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "/wageStandard/bind",
            type: "GET"
        });
        showArchs();

    });





    function showArchs(){
        $.ajax({
            url: "/api/employee?projection=simpleArch",
            type: "GET",
            success: function (response) {
                var json = response._embedded.employees;
                var html = template("ArchsTemplate", {
                    list: json
                });
                $("#listArch").html(html);
            }
        });
    }


</script>

<script type="text/html" id="ArchsTemplate">
    {{each list as value i}}
    <tr>
        <td>{{value.emArchNum}}</td>
        <td>{{value.emName}}</td>
        <td>{{value.emGender}}</td>
        <td>{{value.org.fname}}</td>
        <td>{{value.org.sname}}</td>
        <td>{{value.org.tname}}</td>
        <td>{{value.position.ptitle}}</td>
        <td><a href="/page/archcheck?emId={{value.emId}}">查询明细</a></td>
    </tr>

    {{/each}}
</script>
<body>
<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 人力资源档案查询
        </div>
    </div>
    <a href="/page/arch" class="am-btn am-btn-primary">登记人力档案</a>
    <a href="/page/listwagestandard" class="am-btn am-btn-primary">查看薪酬标准</a>
    <a href="/page/listpbs" class="am-btn am-btn-primary">查看薪酬发放</a>
<table class="am-table am-table-bordered am-table-striped am-table-hover">
    <thead>
    <tr>
        <th>档案编号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>一级结构</th>
        <th>二级结构</th>
        <th>三级结构</th>
        <th>职位名称</th>
        <th>查询</th>
    </tr>
    </thead>
    <tbody id="listArch">
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>

    </tbody>
</table>
</div>
</body>
</html>