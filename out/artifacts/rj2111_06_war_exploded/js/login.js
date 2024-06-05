var captchaUrls = [
  "./images/captcha/captcha1.png",
  "./images/captcha/captcha2.png",
  "./images/captcha/captcha3.png",
];
var captchaNum = ["0413", "0480", "7364"];
var index;
$(function () {
  flushCaptcha();
  $("#J_captchaImg").click(function () {
    flushCaptcha();
  });
});
$(".input-wrapper .UP-input").focusin(function () {
  $(this).parent().addClass("active-focus");
});
$(".input-wrapper .UP-input").focusout(function () {
  $(this).parent().removeClass("active-focus");
});
$(".input-wrapper .UP-input").change(function () {
  $(this).parent().removeClass("showtips active-tips");
});
var inputArr = $(".input-wrapper .UP-input");
$("#J_fromInfo").submit(function () {
  var flag = true;
  var tipstext = "";
  if ($("#J_captchaInput").val() != captchaNum[index]) {
    $("#J_captchaInput").parent().addClass("active-tips");
    tipstext = "验证码错误";
    setTips($("#J_captchaInput").parent(), tipstext);
    flushCaptcha();
    flag = false;
  }
  for (var i = 0; i < inputArr.length; i++) {
    if (inputArr[i].value == "") {
      $(inputArr[i]).parent().addClass("active-tips");
      if (i == 0) {
        tipstext = "请输入用户名";
      } else if (i == 1) {
        tipstext = "请输入密码";
      } else if (i == 2) {
        tipstext = "请输入验证码";
      }
      flag = false;
      setTips($(inputArr[i]).parent(), tipstext);
    }
  }
  if (flag) {
    window.open("./admin/admin.jsp", "_self");
  }
  return false;
});
function setTips(element, tipstext) {
  $(element).find(".tipstext").text(tipstext);
  $(element).addClass("showtips");
}
function flushCaptcha() {
  index = Math.floor(Math.random() * captchaUrls.length);
  $("#J_captchaImg").find("img").attr("src", captchaUrls[index]);
}
