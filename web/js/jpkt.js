// tab切换
(function(){
    $(".title-box .link").click(function(){
        var index = $(this).index();
        $(".title-box .link").removeClass("link-active");
        $(this).addClass("link-active");
        if(index == 0){
            $("#J_hottest").css("display","none");
            $("#J_newest").css("display","block");
        }else if(index == 1){
            $("#J_newest").css("display","none");
            $("#J_hottest").css("display","block");
        }
    });
})();
