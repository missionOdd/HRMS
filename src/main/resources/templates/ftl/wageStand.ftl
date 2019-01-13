<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1">
    <title>WageStandard</title>

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
<body>
<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 薪酬标准登记
        </div>
    </div>
    <div class="tpl-block ">
        <div class="am-g tpl-amazeui-form">
            <form class="am-form" method="post" action="/wageStandard/add">
                <fieldset>
                    <div class="am-form-group">
                        <table class="am-table  am-table-centered">
                            <tr>
                                <th></th>
                                <th></th>
                                <th>
                                    <button type="submit" class="am-btn am-btn-primary">提交</button>
                                    <button type="reset" class="am-btn am-btn-default">清除</button>
                                    <a href="/page/listwagestandard" class="am-btn am-btn-default">返回</a>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">薪酬标准编号</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="wsNum" >
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">薪酬标准名</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="wsName" >
                                    </div>
                                </td>
                                <td>
                                    <fieldset disabled>
                                    <label class="am-u-sm-2 am-form-label">薪酬总额</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" id="toTal_input" name="wsTotal" >
                                    </div>
                                    </fieldset>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">制定人</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="wsProducer" >
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">登记人</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="wsRegistrant" >
                                    </div>
                                </td>
                                <td>
                                    <fieldset disabled>
                                    <label class="am-u-sm-2 am-form-label">登记时间</label>
                                    <div class="am-form-group am-form-icon am-u-sm-10">
                                        <i class="am-icon-calendar"></i>
                                        <input type="text" class="am-form-field am-input-sm" id="wsCreateTime_input" name="wsCreateTime" placeholder="时间">
                                    </div>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>

                        <table class="am-table am-table-bordered am-table-striped am-table-hover">
                            <thead>
                            <tr>
                                <th>基本工资</th>
                                <th>交通补贴</th>
                                <th>午餐补助</th>
                                <th>通信补助</th>
                                <th>养老保险</th>
                                <th>医疗保险</th>
                                <th>失业保险</th>
                                <th>住房公积金</th>
                            </tr>
                            </thead>
                            <tbody id="listAllowance">
                            <tr>
                                <td><input type="number" class="am-form-field" name="wsBaseWage"  id="wsBaseWage_input" value="0"   ></td>
                                <td><input type="number" class="am-form-field" name="wsTravelAllowance" id="wsTravelAllowance_input" value="0"></td>
                                <td><input type="number" class="am-form-field" name="wsLunchAllowance" id="wsLunchAllowance_input" value="0"></td>
                                <td><input type="number" class="am-form-field" name="wsCommunicationAllowance" id="wsCommunicationAllowance_input" value="0"></td>

                                <td><fieldset disabled><input type="number" class="am-form-field" name="wsEndowmentInsurance" value="0" id="wsEndowmentInsurance_input"></fieldset></td>

                                <td><fieldset disabled><input type="number" class="am-form-field" name="wsHealthInsurance" value="0" id="wsHealthInsurance_input"></fieldset></td>
                                <td><fieldset disabled><input type="number" class="am-form-field" name="wsUnemployedInsurance" value="0" id="wsUnemployedInsurance_input"></fieldset></td>
                                <td><fieldset disabled><input type="number" class="am-form-field" name="wsHousingFund" value="0" id="wsHousingFund_input"></fieldset></td>

                            </tr>

                            </tbody>
                        </table>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</body>
<script type="text/javascript">

    $(function () {
        $("#wsCreateTime_input").val(new Date());

        $("#wsBaseWage_input").bind("input propertychange",function () {

            var baseWage=$("#wsBaseWage_input").val()
            $("#wsEndowmentInsurance_input").val( baseWage*0.08);
            $("#wsHealthInsurance_input").val( baseWage*0.02+3);
            $("#wsUnemployedInsurance_input").val( baseWage*0.005);
            $("#wsHousingFund_input").val( baseWage*0.08);
            var toTal=Number(baseWage)-Number($("#wsEndowmentInsurance_input").val())-Number($("#wsHealthInsurance_input").val()) -Number($("#wsUnemployedInsurance_input").val())- Number($("#wsHousingFund_input").val())+Number($("#wsTravelAllowance_input").val())+Number($("#wsLunchAllowance_input").val())+Number($("#wsCommunicationAllowance_input").val())
            $("#toTal_input").val(getDec(toTal));

        });

        $("#wsTravelAllowance_input").bind("input propertychange",function () {

                var toTal=Number($("#wsBaseWage_input").val())-Number($("#wsEndowmentInsurance_input").val())-Number($("#wsHealthInsurance_input").val()) -Number($("#wsUnemployedInsurance_input").val())- Number($("#wsHousingFund_input").val())+Number($("#wsTravelAllowance_input").val())+Number($("#wsLunchAllowance_input").val())+Number($("#wsCommunicationAllowance_input").val())
                $("#toTal_input").val(getDec(toTal));


        });

        $("#wsLunchAllowance_input").bind("input propertychange",function () {

                var toTal=Number($("#wsBaseWage_input").val())-Number($("#wsEndowmentInsurance_input").val())-Number($("#wsHealthInsurance_input").val()) -Number($("#wsUnemployedInsurance_input").val())- Number($("#wsHousingFund_input").val())+Number($("#wsTravelAllowance_input").val())+Number($("#wsLunchAllowance_input").val())+Number($("#wsCommunicationAllowance_input").val())
            $("#toTal_input").val(getDec(toTal));

        });
        $("#wsCommunicationAllowance_input").bind("input propertychange",function () {

                var toTal=Number($("#wsBaseWage_input").val())-Number($("#wsEndowmentInsurance_input").val())-Number($("#wsHealthInsurance_input").val()) -Number($("#wsUnemployedInsurance_input").val())- Number($("#wsHousingFund_input").val())+Number($("#wsTravelAllowance_input").val())+Number($("#wsLunchAllowance_input").val())+Number($("#wsCommunicationAllowance_input").val())
            $("#toTal_input").val(getDec(toTal));

        });
    });
</script>
</html>