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
        showFOrg();
        showPT();

        $("#emCreateTime_input").val(getNowFormatDate());

        $("#emRegistrant_input").val("admin");

        $("#tId_input").val(1);

        $("#listfirstOrg").on('click',function(){
            var  fid=$("#listfirstOrg").find("option:selected").data("id");
            showSOrg(fid);
        });

        $("#listSecondOrg").on('click',function(){
            var  sid=$("#listSecondOrg").find("option:selected").data("id");
            showTOrg(sid);
        });
        $("#listThirdOrg").on('click',function(){
            var  tid=$("#listThirdOrg").find("option:selected").data("id");
            $("#tId_input").val(tid);

        });

        $("#listPType").on('click',function(){
            var pjid = $("#listPType").find("option:selected").data("id");
            showPJ(pjid);
        });

        $("#listPJob").on('click',function(){
            var ws = $("#listPJob").find("option:selected").data("ws");
            $("#pjWageStandard_input").val(ws);
        });
    });







    function showFOrg(){
        $.ajax({
            url: "/api/firstOrg",
            type: "GET",
            success: function (response) {
                var json = response._embedded.firstOrgs;
                var html = template("firstOrgs", {
                    list: json
                });
                $("#listfirstOrg").html(html);
                var fid = $("#listfirstOrg").find("option:selected").data("id");
                showSOrg(fid);
            }
        });
    }

    function showSOrg(id){
        if (!id){
            $("#listSecondOrg").html("<option value=''>空</option>");
            return;
        }
        $.ajax({
            url: "/api/firstOrg/"+id+"/secondOrgs",
            type: "GET",
            success: function(response) {
                var json = response._embedded.secondOrgs;
                var html = template("secondOrgs", {
                    list: json
                });
                $("#listSecondOrg").html(html);

                var sid = $("#listSecondOrg").find("option:selected").data("id");
                showTOrg(sid);
            }
        });
    }

    function showTOrg(id){
        if (!id){
            $("#listThirdOrg").html(" <option value=''>空</option>");
            return;
        }
        $.ajax({
            url: "/api/secondOrg/"+id+"/thirdOrgs",
            type: "GET",
            success: function(response) {
                var json = response._embedded.thirdOrgs;
                var html = template("thirdOrgs", {
                    list: json
                });
                $("#listThirdOrg").html(html);
            }
        });
    }

    function showPT(){
        $.ajax({
            url: "/api/positionType/",
            type: "GET",
            success: function(response) {
                var json = response._embedded.positionTypes;
                var html = template("positionTypes", {
                    list: json
                });
                $("#listPType").html(html);
                var pjid = $("#listPType").find("option:selected").data("id");
                showPJ(pjid);
            }
        });
    }

    function showPJ(id){
        if (!id){
            $("#listPJob").html(" <option value=''>空</option>");
            return;
        }
        $.ajax({
            url: "/api/positionType/"+id+"/positionJobs",
            type: "GET",
            success: function(response) {
                var json = response._embedded.positionJobs;
                var html = template("positionJobs", {
                    list: json
                });
                $("#listPJob").html(html);
                $("#pjWageStandard_input").val(json[0].pjWageStandard);

            }
        });
    }



</script>

<script type="text/html" id="firstOrgs">
    {{each list as value i}}
    {{if i==0}}
    <option value="{{value.fname}}" selected data-id="{{value.fid}}">{{value.fname}}</option>
    {{else}}
    <option value="{{value.fname}}" data-id="{{value.fid}}">{{value.fname}}</option>
    {{/if}}

    {{/each}}
</script>
<script type="text/html" id="secondOrgs">
    {{each list as value i}}
    {{if i==0}}
    <option value="{{value.sname}}" selected data-id="{{value.sid}}">{{value.sname}}</option>
    {{else}}
    <option value="{{value.sname}}" data-id="{{value.sid}}">{{value.sname}}</option>
    {{/if}}
    {{/each}}
</script>
<script type="text/html" id="thirdOrgs">
    {{each list as value i}}
    {{if i==0}}
    <option value="{{value.tname}}" selected data-id="{{value.tid}}">{{value.tname}}</option>
    {{else}}
    <option value="{{value.tname}}" data-id="{{value.tid}}">{{value.tname}}</option>
    {{/if}}
    {{/each}}
</script>
<script type="text/html" id="positionTypes">
    {{each list as value i}}
    {{if i==0}}
    <option value="{{value.ptName}}" selected data-id="{{value.ptId}}">{{value.ptName}}</option>
    {{else}}
    <option value="{{value.ptName}}" data-id="{{value.ptId}}">{{value.ptName}}</option>
    {{/if}}

    {{/each}}
</script>
<script type="text/html" id="positionJobs">
    {{each list as value i}}
    {{if i==0}}
    <option value="{{value.pjName}}" selected data-ws="{{value.pjWageStandard}}">{{value.pjName}}</option>
    {{else}}
    <option value="{{value.pjName}}" data-ws="{{value.pjWageStandard}}">{{value.pjName}}</option>
    {{/if}}

    {{/each}}
</script>
<body>
<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 人力资源档案登记
        </div>
    </div>
    <div class="tpl-block ">
        <div class="am-g tpl-amazeui-form">
            <form class="am-form" method="post" action="/employee/add">
                <fieldset>
                    <div class="am-form-group">
                        <table class="am-table  am-table-centered">
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th>
                                    <button type="submit" class="am-btn am-btn-primary">提交</button>
                                    <button type="reset" class="am-btn am-btn-default">清除</button>
                                    <a href="/page/archlist" class="am-btn am-btn-default">返回</a>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2">I级机构</label>
                                    <div class="am-u-sm-10">
                                        <select name="FName"  id="listfirstOrg">
                                        <option value="option1">选项一...</option>
                                        <option value="option2">选项二.....</option>
                                        <option value="option3">选项三........</option>
                                    </select>
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2">II级机构</label>
                                    <div class="am-u-sm-10">
                                        <select name="SName" id="listSecondOrg">
                                        <option value="option1">选项一...</option>
                                        <option value="option2">选项二.....</option>
                                        <option value="option3">选项三........</option>
                                    </select>
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2">III级机构</label>
                                    <div class="am-u-sm-10">
                                        <select name="TName" id="listThirdOrg">
                                        <option value="option1">选项一...</option>
                                        <option value="option2">选项二.....</option>
                                        <option value="option3">选项三........</option>
                                    </select>
                                    </div>
                                    <input hidden type="hidden" name="tId" id="tId_input"/>
                                </td>
                                <td rowspan="5" class="am-text-middle" >
                                    <div class="am-form-file" >
                                        <button type="button" class="am-btn am-btn-default am-btn-sm">
                                            <i class="am-icon-cloud-upload"></i> 选择要上传的头像
                                        </button>
                                        <input type="file" id="Imgfile" >
                                        <div id="img_head"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2">职位分类</label>
                                    <div class="am-u-sm-10">
                                        <select name="PType" id="listPType">
                                        <option value="option1">选项一...</option>
                                        <option value="option2">选项二.....</option>
                                        <option value="option3">选项三........</option>
                                    </select>
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2">职位名称</label>
                                    <div class="am-u-sm-10">
                                        <select  name="PJob" id="listPJob">
                                        <option value="option1">选项一...</option>
                                        <option value="option2">选项二.....</option>
                                        <option value="option3">选项三........</option>
                                    </select>
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">职称</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" placeholder="职称" name="PTitle" >
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">姓名</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emName" placeholder="姓名">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">性别</label>
                                    <div class="am-u-sm-10">
                                        <select name="emGender">
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">EMAIL</label>
                                    <div class="am-u-sm-10">
                                        <input type="email" class="am-form-field" name="emEmail" placeholder="123@qq.com">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">电话</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emPhone" placeholder="0000000">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">QQ</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emQQ" placeholder="00000000000">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">手机</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="empTelphone" placeholder="00000000000">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="am-text-middle">
                                    <label class="am-u-sm-1 am-form-label">住址</label>
                                    <div class="am-u-sm-11">
                                        <input type="text" class="am-form-field" name="emAddress" placeholder="广东广州">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">邮编</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emPostCode" placeholder="0000">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">国籍</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emNationality" placeholder="中国">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">出生地</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emBirthPlace" placeholder="广东">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">生日</label>
                                    <div class="am-u-sm-8 am-u-md-10">
                                        <div action="" class="am-form am-form-inline">
                                            <div class="am-form-group am-form-icon">
                                                <i class="am-icon-calendar"></i>
                                                <input type="date" class="am-form-field am-input-sm" placeholder="日期" name="emBirthday">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2">民族</label>
                                    <div class="am-u-sm-10">
                                        <select name="emNation">
                                        <option value="汉族">汉族</option>
                                        <option value="少数民族">少数民族</option>
                                    </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">宗教信仰</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emFaith" placeholder="伊斯兰教">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">政治面貌</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emPoliticalStatus" placeholder="群众">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">身份证号</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emIdCard" placeholder="00000000000">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">社会保障号码</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emSSN" placeholder="00000000000">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">年龄</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emAge" placeholder="18">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">学历</label>
                                    <div class="am-u-sm-10">
                                        <select name="emEduBg">
                                        <option selected value="无">无</option>
                                        <option value="小学">小学</option>
                                        <option value="初中">初中</option>
                                        <option value="高中">高中</option>
                                        <option value="大专">大专</option>
                                        <option value="本科">本科</option>
                                        <option value="研究生">研究生</option>
                                        <option value="硕士">硕士</option>
                                        <option value="博士">博士</option>
                                        <option value="博士后">博士后</option>
                                    </select>
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">教育年限</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emYearsOfEdu" placeholder="18">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">学历专业</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emMajor" placeholder="计算机科学">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                        <label class="am-u-sm-2 am-form-label">薪酬标准</label>
                                        <div class="am-u-sm-10">
                                            <input type="number" class="am-form-field am-disabled" name="pWageStandard" id="pjWageStandard_input">
                                        </div>

                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">开户行</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emBank" placeholder="建设银行">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">银行账号</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emBankAccount" placeholder="0000000000">
                                </td>
                                <td>
                                        <label class="am-u-sm-2 am-form-label">登记人</label>
                                        <div class="am-u-sm-10">
                                            <input type="text" class="am-form-field am-disabled" name="emRegistrant" id="emRegistrant_input">
                                        </div>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                <fieldset disabled>
                                    <label class="am-u-sm-2 am-form-label">建档时间</label>
                                    <div class="am-form-group am-form-icon am-u-sm-10">
                                        <i class="am-icon-calendar"></i>
                                        <input type="text" class="am-form-field am-input-sm" id="emCreateTime_input" name="emCreateTime" placeholder="时间">
                                    </div>
                                    </fieldset>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">特长</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emSkill" placeholder="特长">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">爱好</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emHobby" placeholder="爱好">
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <label class="am-u-sm-1 am-form-label">个人履历</label>
                                    <div class="am-u-sm-11">
                                        <textarea class="am-form-field" rows="4" name="emResume" placeholder="个人履历"></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <label class="am-u-sm-1 am-form-label">家庭关系</label>
                                    <div class="am-u-sm-11">
                                        <textarea class="am-form-field" rows="4" name="emFamilyRelation" placeholder="家庭关系"></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <label class="am-u-sm-1 am-form-label">备注</label>
                                    <div class="am-u-sm-11">
                                        <textarea class="am-form-field" rows="4" name="emRemark" placeholder="备注"></textarea>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>


                </fieldset>
            </form>
        </div>
    </div>
</div>

</body>
</html>