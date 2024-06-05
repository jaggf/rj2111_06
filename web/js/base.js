//公共JS

//header 头部导航栏样式切换
(function(){
    $(".nav-ul .link").mouseenter(function(){
        $(".nav-ul .link").removeClass("link-active");
        $(this).addClass("link-active");
    });
    $(".nav-ul .link").mouseleave(function(){
        $(this).removeClass("link-active");
    });
})();
//返回顶部
(function(){
    setReturnbtn(window);
    $(document).scroll(function(){
        if($(this).scrollTop() > 500){
            $("#J_returnbtn").parent().removeClass("returnTop-active");
        }else{
            $("#J_returnbtn").parent().addClass("returnTop-active");
        }
        setReturnbtn(window);
    });
    $(window).resize(function(){
        setReturnbtn(window);
    });
    $("#J_returnbtn").click(function(){
        $("html,body").stop().animate({scrollTop:0},800);
    });
    function setReturnbtn(element){
        if($(element).width() < 1100){
            $("#J_returnbtn").parent().css("opacity","0.4");
        }else{
            $("#J_returnbtn").parent().css("opacity","1");
        }
    }
})();