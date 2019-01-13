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
        bind();
        showpayBills();
    });





    function showpayBills(){
        $.ajax({
            url: "/api/payBills?projection=payBillsList",
            type: "GET",
            success: function (response) {
                var json = response._embedded.payBillses;
                var html = template("pbTemplate", {
                    list: json
                });
                $("#listPb").html(html);

            }
        });
    }


    function bind(){
        $.ajax({
            url: "/wageStandard/bind",
            type: "GET"
        });
    }

</script>

<script type="text/html" id="pbTemplate">
    {{each list as value i}}
    <tr>
        <td>{{value.pbId}}</td>
        <td>{{value.pbEmSum}}</td>
        <td>{{value.pbTotal}}</td>
        {{if value.pbState ==0 }}
        <td id="{{value.pbId}}">未支付</td>
        {{else}}
        <td id="{{value.pbId}}">已支付</td>
        {{/if}}
        <td>{{value.org.fname}}</td>
        <td>{{value.org.sname}}</td>
        <td>{{value.org.tname}}</td>
        <td>
            {{if value.pbState ==0 }}
            <a href="/page/pay?pbId={{value.pbId}}">发放</a>
        {{else}}
            <a href="/page/pay?pbId={{value.pbId}}">无需发放</a>
        {{/if}}

        </td>
    </tr>
    {{/each}}
</script>

<body>
<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 薪酬标准档案查询
        </div>
    </div>
    <a href="/page/wagestandard" class="am-btn am-btn-primary">登记薪酬标准</a>
    <a href="/page/archlist" class="am-btn am-btn-primary">查询人力档案</a>
    <a href="/page/listwagestandard" class="am-btn am-btn-primary">查看薪酬标准</a>
<table class="am-table am-table-bordered am-table-striped am-table-hover">
    <thead>
    <tr>
        <th>薪酬发放编号</th>
        <th>人数</th>
        <th>总额</th>
        <th>发放状态</th>
        <th>一级结构</th>
        <th>二级结构</th>
        <th>三级结构</th>
        <th>发放</th>

    </tr>
    </thead>
    <tbody id="listPb">
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