$(function(){
   //이메일
   $("#join_email_sel").change(function(){
      var val = $(this).val();

      if(val == 'etc'){
         $("input[name=join_email1]").focus();
      }else{
         $("input[name=join_email1]").val(val);
      }

      checkemail();
   });
   //이메일 한글입력 안되게 처리
   $("input[name=join_email0],input[name=join_email1]").keyup(function(event){
   if (!(event.keyCode >=37 && event.keyCode<=40)) {
      var inputVal = $(this).val();
      $(this).val(inputVal.replace(/[^a-z0-9@_.-]/gi,''));
      }
   });      

});


$(function(){ //이 안에 함수 넣기
   
   //폰번호 검사
   function checkphone(){
      $('#phonecheck').val('N');
      var e1 = document.joinform.u_tel1.value;
      var e2 = document.joinform.u_tel2.value;
      var e3 = document.joinform.u_tel3.value;

      $.ajax({
         url:'/join_step2.do',
         type:'post',
         async:false,
         data: {
            mode: 'phone_chk',
            e1: e1,
            e2: e2,
            e3: e3
         },
         success:function(data){
            eval(data);
         }
      });
   }
   
   //이메일 검사
   function checkemail(){
      $('#emailcheck').val('N');
      var e1 = document.joinform.join_email0.value;
      var e2 = document.joinform.join_email1.value;

      $.ajax({
         url:'/join_step2.do',
         type:'post',
         async:false,
         data: {
            mode: 'email_chk',
            e1: e1,
            e2: e2
         },
         success:function(data){
            eval(data);
         
         },
         error : function(err){
          console.log(err);
         }
      });
   }
   
   //아이디 함수
   function IsID(strvalue)
   {
      if(strvalue.length < 4 || strvalue.length > 20)
      {   return false;   }
      for(var i = 0; i < strvalue.length; i++)
      {
         var chr = strvalue.substr(i,1);
         if((chr < '0' || chr > '9') && (chr < 'a' || chr > 'z'))
         {   return false;   }
      }
      return true;
   }
   
   //비번 함수
   function IsPASSWD(strvalue){
      var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
      if(check.test(strvalue)){
         return false;
      }
      return true;
   }
   
   //아이디 검사
   function checkid(){
      var getId= RegExp(/^[a-zA-Z0-9]{4,12}$/);
      var id_ch = $('#user_id').val();
      alert('아이디 확인' + id_ch);
      
      //var han = /[ㄱ-힣]/g;

      //$('#idcheck').val('N');
      
      //아이디 유효성검사 
      if(!getId.test($("#user_id").val())){
          $('.alert').text('아이디는 4~20자리 영문 소문자,숫자 이어야 합니다.').show();
          $("#user_id").val(""); 
          $("#user_id").focus(); 
       return false; 
       }else{
          $('.alert').text().hide();
       }
      

      $.ajax({
         url:'/join_step2.do',
         type:'post',
         data: {
            id_ch = id_ch
         },
         success:function(data){
            eval(data);
         }
      });

   }
      $('input[name="u_id"]').focusout(function(){
         checkid();
      });

      $('input[name="join_email1"]').focusout(function(){
         checkemail();
      });

      $("input[name='u_tel2'],input[name='u_tel3']").focusout(function(){
         checkphone();
      });




   //회원가입 유효성 검사
   function join_chk() {
      if($('input[name="u_id"]').val() == '') {
         alert("아이디를 입력해주세요.");
         $('input[name="u_id"]').focus();
         return false;
      }

      if($('#idcheck').val() == 'N') {
         alert("아이디 중복확인을 해주세요.");
         $('input[name="u_id"]').focus();
         return false;
      }

      if($('input[name="u_pass"]').val() == '') {
         alert("비밀번호를 입력해주세요.");
         $('input[name="u_pass"]').focus();
         return false;
      }

      if($('input[name="u_pass"]').val().length < 6 || $('input[name="u_pass"]').val().length > 20)
      {
         alert("비밀번호는 6~20자리 이어야 합니다.");
         $('input[name="u_pass"]').focus();
         return false;
      }

      if(!IsPASSWD($('input[name="u_pass"]').val()))
      {
         alert('비밀번호는 한글 입력이 불가합니다.');
         $('input[name="u_pass"]').focus();
         return;;
      }

      if($('input[name="u_passCk"]').val() == '') {
         alert("비밀번호 확인을 입력해주세요.");
         $('input[name="u_passCk"]').focus();
         return false;
      }

      if($('input[name="u_pass"]').val() != $('input[name="u_passCk"]').val()) {
         alert("비밀번호가 일치하지 않습니다.");
         $('input[name="u_pass"]').val("");
         $('input[name="u_passCk"]').val("");
         return false;
      }

      if($('input[name="u_name"]').val() == '') {
         alert("이름을 입력해주세요.");
         $('input[name="u_name"]').focus();
         return false;
      }

      if($('input[name="u_tel2"]').val() == '') {
         alert("휴대폰번호를 입력해주세요.");
         $('input[name="u_tel2"]').focus();
         return false;
      }

      if($('input[name="u_tel3"]').val() == '') {
         alert("휴대폰번호를 입력해주세요.");
         $('input[name="u_tel3"]').focus();
         return false;
      }

      if($('input[name="join_email0"]').val() == '') {
         alert("이메일을 입력해주세요.");
         $('input[name="join_email0"]').focus();
         return false;
      }

      if(!$('input[name="join_email1"]').val()) {
         alert("이메일을 입력해주세요.");
         $('input[name="join_email1"]').focus();
         return false;
      }

      if($('#emailcheck').val() == 'N') {
         alert("이메일 중복확인을 해주세요.");
         $('input[name="join_email0"]').focus();
         return false;
      }

      return true;
}





}); //$(function(){의 끝


