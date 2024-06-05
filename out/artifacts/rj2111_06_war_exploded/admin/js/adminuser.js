(function () {
    //过渡动画
    $("#J_from_addUser .column input").focusin(function () {
        $(this).addClass("input-active");
    });
    $("#J_from_addUser .column input").focusout(function () {
        $(this).removeClass("input-active");
    });
    $("#J_from_addUser .column input").change(function () {
        $(this).removeClass("input-tips");
        $(this).parent().removeClass("showTips");
    });
    //初始化 添加删除事件
    $("#J_table .deletebtn").click(function () {
        $(this).parent().parent().parent().remove();
    });
    //表单提交事件
    $("#J_from_addUser").submit(function () {
        var userAct = $("#J_inUser_account");
        var userPwd = $("#J_inUser_password");
        var userPwdRepeat = $("#J_inUser_password_repeat");
        var flag = true;
        if ($(userAct).val() == "") {
            showTips($(userAct).parent(), "请输入管理员账号");
            flag = false;
        } else if (userAct.val().length < 3 || userAct.val().length > 8) {
            showTips($(userAct).parent(), "请输入3~8个字符管理员账号");
            flag = false;
        }
        if ($(userPwd).val() == "") {
            showTips($(userPwd).parent(), "请输入密码");
            flag = false;
        } else if ($(userPwd).val().length < 8 || $(userPwd).val().length > 15) {
            showTips($(userPwd).parent(), "请输入8-15个字符的密码");
            flag = false;
        } else if (!(/([\d+[a-zA-Z]+|[a-zA-Z]+\d+)[0-9a-zA-Z]*/.test($(userPwd).val()))) {
            showTips($(userPwd).parent(), "密码必须包含数字和字母");
            flag = false;
        }
        if ($(userPwdRepeat).val() == "") {
            showTips($(userPwdRepeat).parent(), "请输入确认密码");
            flag = false;
        } else if ($(userPwd).val() != $(userPwdRepeat).val()) {
            showTips($(userPwdRepeat).parent(), "两次密码不同");
            flag = false;
        }
        var userActArr = $("#J_table .user-account");
        if (flag) {
            //判断账户是否存在
            var hasuser = false; // 默认false不存在
            for (var i = 0; i < userActArr.length; i++) {
                if ($(userActArr[i]).text() == $(userAct).val()) {
                    hasuser = true;
                    break;
                }
            }
            if (hasuser) {
                showTips($(userAct).parent(), "账号已存在");
            } else {
                var ID_Num = 0;
                var tableArr = $("#J_table tr:not('.title')");
                console.log(tableArr + "  " + tableArr.length);
                console.log($(tableArr[tableArr.length - 1]).find(".user-ID").text());
                if(tableArr.length == 0){
                    ID_Num = 1;
                }else{
                    ID_Num = parseInt($(tableArr[tableArr.length - 1]).find(".user-ID").text()) + 1;
                }
                var userAccount = $("#J_inUser_account").val();
                var timeStr = getTimer();
                $("#J_table").append(
                    " <tr><td class='user-ID'>" +
                    ID_Num +
                    "</td><td class='user-account'>" +
                    userAccount +
                    "</td><td class='user-createTime'>" +
                    timeStr +
                    "</td><td><div class='operation-btns'><input type='button' value='查看' id='J_lookbtn' class='lookbtn'><input type='button' value='删除' id='J_delBtn' class='deletebtn'></div></td></tr>"
                );
                $("#J_table .deletebtn").click(function () {
                    $(this).parent().parent().parent().remove();
                });
            }
        }
        return false;
    });
    //设置提示消息
    function showTips(element, tipstext) {
        $(element).find(".tipstext").text(tipstext);
        $(element).addClass("showTips");
        $(element).find("input").addClass("input-tips");
    }
})();
//获取时间函数
function getTimer() {
    var date = new Date();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    var h = date.getHours();
    var M = date.getMinutes();
    var s = date.getSeconds();
    var dateArr = [m, d, h, M, s];
    for (var i = 0; i < dateArr.length; i++) {
        if (parseInt(dateArr[i]) < 10) {
            dateArr[i] = "0" + dateArr[i];
        }
    }
    return (
        date.getFullYear() +
        "-" +
        dateArr[0] +
        "-" +
        dateArr[1] +
        " " +
        dateArr[2] +
        ":" +
        dateArr[3] +
        ":" +
        dateArr[4]
    );
}