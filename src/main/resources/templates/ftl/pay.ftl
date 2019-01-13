<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1">
    <title>pay</title>

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
    var pid=getQueryString("pbId")
    $(function () {

        showpayBill(pid);
    });





    function showpayBill(id){
        $.ajax({
            url: "/api/payBills/"+id+"?projection=detailPay",
            type: "GET",
            success: function (response) {
                var json = response;
                var html = template("pbTemplate", json);
                $("#listPay").html(html);
                var html1 = template("payTemplate", json);
                $("#payView").after(html1);

            }
        });
    }

    function udatePay(id){
        $.ajax({
            url: "/api/payBills/"+id+"?projection=detailPay",
            type: "POST",
            success: function (response) {
            }
        });
    }



</script>

<script type="text/html" id="pbTemplate">
    {{each wages as value i}}

    <tr>
        <td>{{value.employee.emArchNum}}</td>
        <td>{{value.employee.emName}}</td>
        <td>{{value.employee.wageStandard.wsBaseWage}}</td>
        <td>{{value.employee.wageStandard.wsTravelAllowance}}</td>
        <td>{{value.employee.wageStandard.wsLunchAllowance}}</td>
        <td>{{value.employee.wageStandard.wsCommunicationAllowance}}</td>
        <td>{{value.employee.wageStandard.wsEndowmentInsurance}}</td>
        <td>{{value.employee.wageStandard.wsHealthInsurance}}</td>
        <td>{{value.employee.wageStandard.wsUnemployedInsurance}}</td>
        <td>{{value.employee.wageStandard.wsHousingFund}}</td>
        <td colspan="3">
            {{if pbState >= 1}}
            <fieldset disabled>
            <div class="am-u-sm-4">
                <input type="number" class="am-form-field" name="WReward" id="wreward_input" value="{{value.wreward}}">
            </div> <div class="am-u-sm-4">
            <input type="number" class="am-form-field" name="WFine" id="wfine_input" value="{{value.wfine}}">
        </div>
            <div class="am-u-sm-3">
                <input type="hidden" name="WId" value="{{value.wid}}"> <input type="hidden" name="pbId" value="{{pbId}}">
                <button type="submit" class="am-btn am-btn-primary">提交奖金/罚金(按一下生效)</button>
            </div>
            </fieldset>
            {{else}}
            <form  class="am-form" action="/wage/update" method="post">
                <div class="am-u-sm-4">
                    <input type="number" class="am-form-field" name="WReward" id="wreward_input" value="{{value.wreward}}">
                </div> <div class="am-u-sm-4">
                <input type="number" class="am-form-field" name="WFine" id="wfine_input" value="{{value.wfine}}">
            </div>
                <div class="am-u-sm-3">
                    <input type="hidden" name="WId" value="{{value.wid}}"> <input type="hidden" name="pbId" value="{{pbId}}">
                    <button type="submit" class="am-btn am-btn-primary">提交奖金/罚金(按一下生效)</button>
                </div>
            </form>

            {{/if}}

        </td>
    </tr>

    {{/each}}
</script>
<script type="text/html" id="payTemplate">
    <form  class="am-form" action="/payBills/update" method="post">

        <input type="hidden" name="pbId" value="{{pbId}}">
    <div>薪酬发放单号:{{pbId}}</div>
    <div>机构:{{org.fname}}---{{org.sname}}--{{org.tname}}</div>
    <div>总人数:{{pbEmSum}}</div>
    <div>基本薪酬总额:{{pbTotal}}</div>
    <div>实际发放薪酬总额:{{pbRealTotal}}</div>
        {{if pbState >= 1}}
        <fieldset disabled>
            <label class="am-u-sm-2 am-form-label">登记人</label>
            <div class="am-u-sm-10">
                <input type="text" class="am-form-field" name="pbRegistrant" value="{{pbRegistrant}}">
            </div>
            <button type="submit" class="am-btn am-btn-primary">已发放</button>
        </fieldset>
        {{else}}
        <label class="am-u-sm-2 am-form-label">登记人</label>
        <div class="am-u-sm-10">
            <input type="text" class="am-form-field" name="pbRegistrant" value="{{pbRegistrant}}">
        </div>
        <button type="submit" class="am-btn am-btn-primary">发放</button>

        {{/if}}
    <button type="reset" class="am-btn am-btn-default">清除</button>
    <a href="/page/listpbs" class="am-btn am-btn-default">返回</a>
    </form>
</script>
<body>
<div class="tpl-portlet-components">
    <div class="portlet-title"  id="payView">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 薪酬发放明细
        </div>
    </div>

<table class="am-table am-table-bordered am-table-striped am-table-hover">
        <thead>
        <tr>
            <th>档案编号</th>
            <th>姓名</th>
            <th>基本工资</th>
            <th>交通补贴</th>
            <th>午餐补助</th>
            <th>通信补助</th>
            <th>养老保险</th>
            <th>医疗保险</th>
            <th>失业保险</th>
            <th>住房公积金</th>
            <th>奖励奖金</th>
            <th>应扣奖金</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody id="listPay">
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
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