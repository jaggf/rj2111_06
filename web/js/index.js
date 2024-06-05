//轮播图片动画
(function(){
    var imgArr = $("#J_rotationImgs .item");
    var nowIndex = 0;
    var nextIndex = 1;
    var priorIndex = imgArr.length - 1;
    var timer = setInterval(nextImg, 3000);
    $("#J_nextbtn").click(function(){
        clearInterval(timer);
        nextImg();
        timer = setInterval(nextImg, 3000);
    });
    $("#J_priorbtn").click(function(){
        clearInterval(timer);
        priorImg();
        timer = setInterval(nextImg, 3000);
    });
    function nextImg(){
        $(imgArr[nowIndex]).stop().animate({opacity: 0},500);
        $(imgArr[nextIndex]).stop().animate({opacity: 1},500);
        nowIndex = nextIndex;
        setIndex();
    }
    function priorImg(){
        $(imgArr[nowIndex]).stop().animate({opacity: 0},500);
        $(imgArr[priorIndex]).stop().animate({opacity: 1},500);
        nowIndex = priorIndex;
        setIndex();
    }
    function setIndex(){
        if(nowIndex <= 0){
            priorIndex = imgArr.length - 1;
        }else{
            priorIndex = nowIndex - 1;
        }
        if(nowIndex >= imgArr.length - 1){
            nextIndex = 0;
        }else{
            nextIndex = nowIndex + 1;
        }
    }
})();

//下拉菜单
(function(){
    $(".nav-ul .hasMenu").mouseenter(function(){
        $(this).find(".drop-menu").stop().slideDown();
    });
    $(".nav-ul .hasMenu").mouseleave(function(){
        $(this).find(".drop-menu").stop().slideUp();
    });
})();