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
        showArchs();
    });





    function showArchs(){
        $.ajax({
            url: "/api/wageStandard",
            type: "GET",
            success: function (response) {
                var json = response._embedded.wageStandards;
                var html = template("wsArchTemplate", {
                    list: json
                });
                $("#listArch").html(html);
            }
        });
    }


</script>

<script type="text/html" id="wsArchTemplate">
    {{each list as value i}}
    <tr>
        <td>{{value.wsNum}}</td>
        <td>{{value.wsName}}</td>
        <td>{{value.wsBaseWage}}</td>
        <td>{{value.wsTravelAllowance}}</td>
        <td>{{value.wsLunchAllowance}}</td>
        <td>{{value.wsCommunicationAllowance}}</td>
        <td>{{value.wsEndowmentInsurance}}</td>
        <td>{{value.wsHealthInsurance}}</td>
        <td>{{value.wsUnemployedInsurance}}</td>
        <td>{{value.wsHousingFund}}</td>
        <td>{{value.wsProducer}}</td>
        <td>{{value.wsRegistrant}}</td>

    </tr>

    {{/each}}
</script>
<body>
<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 薪酬标准案查询
        </div>
    </div>
    <a href="/page/wagestandard" class="am-btn am-btn-primary">登记薪酬标准</a>
    <a href="/page/archlist" class="am-btn am-btn-primary">查询人力档案</a>
    <a href="/page/listpbs" class="am-btn am-btn-primary">查看薪酬发放</a>
<table class="am-table am-table-bordered am-table-striped am-table-hover">
    <thead>
    <tr>
        <th>薪酬标准编号</th>
        <th>薪酬标准名</th>
        <th>基本工资</th>
        <th>交通补贴</th>
        <th>午餐补助</th>
        <th>通信补助</th>
        <th>养老保险</th>
        <th>医疗保险</th>
        <th>失业保险</th>
        <th>住房公积金</th>
        <th>制定人</th>
        <th>登记人</th>
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