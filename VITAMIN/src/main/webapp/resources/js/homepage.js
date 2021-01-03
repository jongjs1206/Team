$(document).ready(function() {
    $(window).scroll( function(){
    	$('.title_best').each( function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element/1.1 ){
                $(this).animate({'opacity':'1','margin-top':'0px'},1000);
            }
        });
    	$('.title_choise').each( function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element/1.1 ){
                $(this).animate({'opacity':'1','margin-top':'0px'},1000);
            }
        });
        $('.product_img1').each( function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element/1.1 ){
                $(this).animate({'opacity':'1','margin-left':'0px'},1000);
            }
            
        });
        $('.product_img2').each( function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element/1.1 ){
                $(this).animate({'opacity':'1','margin-left':'0px'},1200);
            }
            
        });
        $('.product_img3').each( function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element/1.1 ){
                $(this).animate({'opacity':'1','margin-left':'0px'},1400);
            }
            
        });
        $('.product_img4').each( function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element/1.1 ){
                $(this).animate({'opacity':'1','margin-left':'0px'},1600);
            }
            
        });
        
        $('.product_title1').each( function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element/1.1 ){
            	$(this).animate({'opacity':'1'},3000);
            }
            
        });
        
        $('.product_title2').each( function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element/1.1 ){
            	$(this).animate({'opacity':'1'},3000);
            }
            
        });
        $('.product_title3').each( function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element/1.1 ){
            	$(this).animate({'opacity':'1'},3000);
            }
            
        });
        $('.product_title4').each( function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element/1.1 ){
            	$(this).animate({'opacity':'1'},3000);
            }
            
        });
    });
});