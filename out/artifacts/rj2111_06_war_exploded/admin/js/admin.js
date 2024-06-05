//导航栏动画
(function(){
    $("#J_headNav .nav-link").mouseenter(function(){
        $(this).addClass("link-active");
    });
    $("#J_headNav .nav-link").mouseleave(function(){
        $(this).removeClass("link-active");
    });
})();
//下拉菜单动画
(function(){
    $("#J_contain_left_menu .menu-line .title").click(function(){
        if($(this).parent().attr("slide") == "true"){
            $(this).parent().attr("slide","false").find(".mini-menu").stop().slideUp();
            $(this).parent().find(".fas").css("transform", "rotate(0deg)");
            
        }else{
            $(this).parent().attr("slide","true").find(".mini-menu").stop().slideDown();
            $(this).parent().find(".fas").css("transform", "rotate(-90deg)");
        }
    });
})();
//左侧菜单动画
(function(){
    $("#J_contain_left_menu .menu-line").mouseenter(function(){
        $(this).find(".title").addClass("title-active");
    });
    $("#J_contain_left_menu .menu-line").mouseleave(function(){
        $(this).find(".title").removeClass("title-active");
    });
})();
//左侧小菜单动画
(function(){
    $("#J_contain_left_menu .menu-line .mini-menu .menu-ul .link").mouseenter(function(){
        $(this).addClass("link-active");
    });
    $("#J_contain_left_menu .menu-line .mini-menu .menu-ul .link").mouseleave(function(){
        $(this).removeClass("link-active");
    });
})();

