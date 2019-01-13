$(function () {
    $('#Imgfile').on('change',function(){
        upload();
    });
});

function deleteEm(id){
    $.ajax({
        url: "/api/employee/" + id,
        type: "DELETE",
        success: function () {
            alert("删除成功");

        }
    });
}

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + date.getHours() + seperator2 + date.getMinutes()
        + seperator2 + date.getSeconds();
    return currentdate;
}


function upload() {
    var file = $('#Imgfile')[0].files[0];
    if (file){
        var formData =new FormData();
    formData.append('file',file);
    $.ajax({
        url: "/api/uploadpic",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        dataType:"json",
        success: function (data) {
            if (data.state==200) {
               var url=data.data;
                $('#img_head').html(
                     '<img src="'+url+'">'
                    + '<input hidden type="hidden" name="emImgPath" value="'+url+'"/>'
                    );
            }
        }
    });
    }
}


function getQueryString(name) {
    var reg=new RegExp("(^|&)"+name+"=([^&]*)(&|$)");
    var r=window.location.search.substr(1).match(reg);
    if (r!=null) {
        return decodeURIComponent(r[2]);
    }
    return "";
}

function getDec(num) {
    return num.toString().match(/^\d+(?:\.\d{0,2})?/);
}