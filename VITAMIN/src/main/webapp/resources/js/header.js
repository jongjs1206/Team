$(function(){
   $('.submenu').hide();//기본으로 ul태그를 숨긴다
   
    /*$('#myMenu').on('click',function(e){//마이메뉴를 클릭하면
       e.preventDefault();
       className = $(this).attr('class');//클래스 이름을 가져온다
       if(className == "off"){
          $('.submenu').show();//보이기
          $(this).attr('class','on');//생성 후 class이름을 on으로 바꿈
       }else if(className == "on"){
          $('.submenu').hide();//숨기기
          $(this).attr('class','off');//다시 클래스 이름을 off로 설정
       };
       
    });*/

   $('.h_product1').hover(function() {
        $('.h_health').css("top","165px");
      $('.h_product1').css({"color":"#ff7d92",'cursor':'pointer'});
      }, function(){
      $('.h_product1').css("color","black");
        $('.h_health').css("top","-300px");
   });
   $('.h_health').hover(function() {
      $('.h_product1').css("color","#ff7d92");
        $('.h_health').css("top","165px");
      }, function(){
      $('.h_product1').css("color","black");
        $('.h_health').css("top","-300px");
   });
   $('.h_product2').hover(function() {
        $('.h_yoga').css("top","165px");
      $('.h_product2').css({"color":"#ff7d92",'cursor':'pointer'});
      }, function(){
      $('.h_product2').css("color","black");
        $('.h_yoga').css("top","-300px");
   });
   $('.h_yoga').hover(function() {
      $('.h_product2').css("color","#ff7d92");
        $('.h_yoga').css("top","165px");
      }, function(){
      $('.h_product2').css("color","black");
        $('.h_yoga').css("top","-300px");
   });
   $('.h_product3').hover(function() {
        $('.h_dress').css("top","165px");
      $('.h_product3').css({"color":"#ff7d92",'cursor':'pointer'});
      }, function(){
      $('.h_product3').css("color","black");
        $('.h_dress').css("top","-300px");
   });
   $('.h_dress').hover(function() {
      $('.h_product3').css("color","#ff7d92");
        $('.h_dress').css("top","165px");
      }, function(){
      $('.h_product3').css("color","black");
        $('.h_dress').css("top","-300px");
   });
   $('.h_product4').hover(function() {
        $('.h_food').css("top","165px");
      $('.h_product4').css({"color":"#ff7d92",'cursor':'pointer'});
      }, function(){
      $('.h_product4').css("color","black");
        $('.h_food').css("top","-300px");
   });
   $('.h_food').hover(function() {
      $('.h_product4').css("color","#ff7d92");
        $('.h_food').css("top","165px");
      }, function(){
      $('.h_product4').css("color","black");
        $('.h_food').css("top","-300px");
   });
   //------------------------------------------------------------------------------------
   $('#myMenu').hover(function() {
      $('.h_healthCare').css("top","165px");
      $('#myMenu').css({"color":"black",'cursor':'pointer'});
   }, function(){
      $('#myMenu').css("color","black");
      $('.h_healthCare').css("top","-300px");
   });
   $('.h_healthCare').hover(function() {
      $('#myMenu').css("color","black");
      $('.h_healthCare').css("top","165px");
   }, function(){
      $('#myMenu').css("color","black");
      $('.h_healthCare').css("top","-300px");
   });
   
   $('.h_glass').click(function(){
   		$('#frm').submit();
   });
   
});