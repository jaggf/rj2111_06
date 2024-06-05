(function(){
    $(".input-wrapper .UP-input").focusin(function(){
        $(this).parent().addClass("active-focus");
    });
    $(".input-wrapper .UP-input").focusout(function(){
        $(this).parent().removeClass("active-focus");
    });
    $(".input-wrapper .UP-input").change(function(){
        $(this).parent().removeClass("showtips active-tips");
    });
    var inputArr = $(".input-wrapper .UP-input");
    var regPhone = /^1[3-9]\d{9}$/;
    $("#J_fromInfo").submit(function(){
        var tipstext = "";
        if(!regPhone.test($("#J_phoneInput").val())){
            $("#J_phoneInput").parent().addClass("active-tips");
            tipstext = "请输入正确的手机号码";
            setTips($("#J_phoneInput").parent(), tipstext);
        }
        for(var i = 0;i < inputArr.length; i++){
            if(inputArr[i].value == ''){
                $(inputArr[i]).parent().addClass("active-tips");
                if(i == 0){
                    tipstext = "请输入用户名";
                }else if(i == 1){
                    tipstext = "请输入密码";
                }else if(i == 2){
                    tipstext = "请输入手机号码";
                }
                setTips($(inputArr[i]).parent(),tipstext);
            }
        }
        return false;
    });
    function setTips(element, tipstext){
        $(element).find(".tipstext").text(tipstext);
        $(element).addClass("showtips");
    }
})();