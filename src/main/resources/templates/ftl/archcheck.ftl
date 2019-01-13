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
        var emid=getQueryString("emId");
        showForm(emid);


        $("#emCreateTime_input").val(getNowFormatDate());

        $("#emRegistrant_input").val("admin");

        $("#tId_input").val(emid);

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


    function showForm(id){
        $.ajax({
            url: "/api/employee/"+id,
            type: "GET",
            success: function (response) {
                var json = response;
                var html = template("formTemplate", json);
                $("#bodyHtml").html(html);

                showOrg(1);
                showPosition(1);
            }
        });
    }


    function showPosition(id){
        if (!id){
            return;
        }
        $.ajax({
            url: "/api/employee/"+id+"/position",
            type: "GET",
            success: function(response) {
                var json = response;
                var html = template("positionTemplate", json);
                var htmlWs = template("emWsTemplate", json);
                $("#positionView").html(html);
                $("#pjWageStandardView").html(htmlWs);
            }
        });
    }

    function showOrg(id){
        if (!id){
            return;
        }
        $.ajax({
            url: "/api/employee/"+id+"/org",
            type: "GET",
            success: function(response) {
                var json = response;
                var html = template("orgTemplate", json);
                $("#orgView").before(html);
            }
        });
    }




</script>


<script type="text/html" id="orgTemplate">
    <td>
    <fieldset disabled>
    <label class="am-u-sm-2">I级机构</label>
            <div class="am-u-sm-10">
            <input type="text" class="am-form-field"  name="FName" value="{{fname}}">
            </div>
            </fieldset>
            </td>
            <td>
            <fieldset disabled>
    <label class="am-u-sm-2">II级机构</label>
            <div class="am-u-sm-10">
            <input type="text" class="am-form-field"  name="SName" value="{{sname}}">
            </div>
            </fieldset>
            </td>
            <td>
            <fieldset disabled>
    <label class="am-u-sm-2">III级机构</label>
            <div class="am-u-sm-10">
            <input type="text" class="am-form-field"  name="TName" value="{{tname}}">
            </div>
            <input hidden type="hidden" name="tId" id="tId_input"/>
            </fieldset>
            </td>
</script>

<script type="text/html" id="positionTemplate">
    <td>
        <fieldset disabled>
            <label class="am-u-sm-2">职位分类</label>
            <div class="am-u-sm-10">
                <input type="text" class="am-form-field"  name="PType" value="{{ptype}}">
            </div>
        </fieldset>
    </td>
    <td>
        <fieldset disabled>
            <label class="am-u-sm-2">职位名称</label>
            <div class="am-u-sm-10">
                <input type="text" class="am-form-field"  name="PJob" value="{{pjob}}">
            </div>

    </td>
    <td>
        <fieldset disabled>
            <label class="am-u-sm-2 am-form-label">职称</label>
            <div class="am-u-sm-10">
                <input type="text" class="am-form-field"  name="PTitle" value="{{ptitle}}">
            </div>
        </fieldset>
    </td>

</script>

<script type="text/html" id="emWsTemplate">
<fieldset disabled>
    <label class="am-u-sm-2 am-form-label" >薪酬标准</label>
    <div class="am-u-sm-10">
        <input type="number" class="am-form-field am-disabled" name="pWageStandard"  value="{{pwageStandard}}">
    </div>
</fieldset>
</script>



<script type="text/html" id="formTemplate">
<div class="tpl-portlet-components">
    <div class="portlet-title">
        <div class="caption font-green bold">
            <span class="am-icon-code"></span> 人力资源档案登记
        </div>
    </div>
    <div class="tpl-block ">
        <div class="am-g tpl-amazeui-form">
            <form class="am-form" method="post" action="/employee/update">
                <fieldset>
                    <div class="am-form-group">
                        <table class="am-table  am-table-centered">
                            <tr>
                                <th colspan="3">
                                    <fieldset disabled>
                                    <label class="am-u-sm-2 am-form-label">档案编号</label>
                                    <div class=" am-u-sm-10">
                                        <input type="text" class="am-form-field am-input-sm"  name="emArchId" value="{{emArchNum}}">
                                    </div>
                                </fieldset>
                                </th>

                                <th>
                                    {{if emState == 1}}
                                    <button type="submit" class="am-btn am-btn-primary am-disabled">已复核</button>
                                    <button type="submit" class="am-btn am-btn-primary ">更新</button>
                                    {{else}}
                                    <button type="submit" class="am-btn am-btn-primary">复核</button>
                                    {{/if}}
                                    <button onclick="deleteEm({{emId}})" class="am-btn am-btn-danger">删除</button>
                                    <a href="/page/archlist" class="am-btn am-btn-default">返回</a>
                                    <input type="hidden"   name="emId" value="{{emId}}">
                                </th>
                            </tr>
                            <tr >



                                <td rowspan="5" class="am-text-middle" id="orgView">
                                    <div class="am-form-file" >
                                        <button type="button" class="am-btn am-btn-default am-btn-sm">
                                            <i class="am-icon-cloud-upload"></i> 选择要上传的头像
                                        </button>
                                        <input type="file" id="Imgfile" >
                                        <div id="img_head">
                                            <img src="{{emImgPath}}">
                                        </div>
                                    </div>
                                </td>

                            </tr>
                            <tr id="positionView">

                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">姓名</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emName"  value="{{emName}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">性别</label>
                                    <div class="am-u-sm-10">
                                        <select name="emGender">
                                            {{if emGender=='女'}}
                                            <option value="男">男</option>
                                            <option selected value="女">女</option>
                                            {{else}}
                                            <option selected value="男">男</option>
                                            <option value="女">女</option>
                                            {{/if}}
                                    </select>
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">EMAIL</label>
                                    <div class="am-u-sm-10">
                                        <input type="email" class="am-form-field" name="emEmail" value="{{emEmail}}">
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">电话</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emPhone" value="{{emPhone}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">QQ</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emQQ" value="{{emQQ}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">手机</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="empTelphone" value="{{empTelphone}}">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="am-text-middle">
                                    <label class="am-u-sm-1 am-form-label">住址</label>
                                    <div class="am-u-sm-11">
                                        <input type="text" class="am-form-field" name="emAddress" value="{{emAddress}}">
                                    </div>
                                </td>
                                <td><label class="am-u-sm-2 am-form-label">邮编</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emPostCode" value="{{emPostCode}}">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">国籍</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emNationality" value="{{emNationality}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">出生地</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emBirthPlace" value="{{emBirthPlace}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">生日</label>
                                    <div class="am-u-sm-8 am-u-md-10">
                                        <div action="" class="am-form am-form-inline">
                                            <div class="am-form-group am-form-icon">
                                                <i class="am-icon-calendar"></i>
                                                <input type="date" class="am-form-field am-input-sm" value="{{emBirthday}}" name="emBirthday">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2">民族</label>
                                    <div class="am-u-sm-10">
                                        <select name="emNation">
                                            {{if emNation=='汉族'}}
                                            <option selected value="汉族">汉族</option>
                                            <option value="少数民族">少数民族</option>
                                            {{else}}
                                            <option  value="汉族">汉族</option>
                                            <option selected value="少数民族">少数民族</option>
                                            {{/if}}

                                    </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">宗教信仰</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emFaith" value="{{emFaith}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">政治面貌</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emPoliticalStatus" value="{{emPoliticalStatus}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">身份证号</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emIdCard" value="{{emIdCard}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">社会保障号码</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emSSN" value="{{emSSN}}">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">年龄</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emAge" value="{{emAge}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">学历</label>
                                    <div class="am-u-sm-10">
                                        <select name="emEduBg" id="emEduBg_select">
                                        <option value="无">无</option>
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
                                        <input type="number" class="am-form-field" name="emYearsOfEdu" value="{{emYearsOfEdu}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">学历专业</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emMajor" value="{{emMajor}}">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td id="pjWageStandardView">




                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">开户行</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emBank" value="{{emBank}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">银行账号</label>
                                    <div class="am-u-sm-10">
                                        <input type="number" class="am-form-field" name="emBankAccount" value="{{emBankAccount}}">
                                </td>
                                <td>
                                        <label class="am-u-sm-2 am-form-label">登记人</label>
                                        <div class="am-u-sm-10">
                                            <input type="text" class="am-form-field am-disabled" name="emRegistrant" value="{{emRegistrant}}">
                                        </div>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                <fieldset disabled>
                                    <label class="am-u-sm-2 am-form-label">建档时间</label>
                                    <div class="am-form-group am-form-icon am-u-sm-10">
                                        <i class="am-icon-calendar"></i>
                                        <input type="text" class="am-form-field am-input-sm" id="emCreateTime_input" name="emCreateTime"  value="{{emCreateTime}}">
                                    </div>
                                    </fieldset>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">特长</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emSkill" value="{{emSkill}}">
                                    </div>
                                </td>
                                <td>
                                    <label class="am-u-sm-2 am-form-label">爱好</label>
                                    <div class="am-u-sm-10">
                                        <input type="text" class="am-form-field" name="emHobby" value="{{emHobby}}">
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <label class="am-u-sm-1 am-form-label">个人履历</label>
                                    <div class="am-u-sm-11">
                                        <textarea class="am-form-field" rows="4" name="emResume">{{emResume}}</textarea>
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
                                        <textarea class="am-form-field" rows="4" name="emFamilyRelation" >{{emFamilyRelation}}</textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <label class="am-u-sm-1 am-form-label">备注</label>
                                    <div class="am-u-sm-11">
                                        <textarea class="am-form-field" rows="4" name="emRemark" >{{emRemark}}</textarea>
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
    <script type="text/javascript">
        $("#emEduBg_select").val("{{emEduBg}}");
        $('#Imgfile').on('change',function(){
            upload();
        });

    </script>
</script>
<body id="bodyHtml">
</body>
</html>