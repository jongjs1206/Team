//모두 동의, 해제 버튼
$(document).ready(function(){
        $( '#agree1' ).click( function(){
          $( '#agree2-1' ).prop( 'checked', this.checked );
          $( '#agree2-2' ).prop( 'checked', this.checked );
          $( '#agree2-3' ).prop( 'checked', this.checked );
        });
      });
      
	
//미동의 시			
function join_step(){
		if($("input:checkbox[name=agree2-1]").is(":checked")== false){
			alert("이용약관에 동의해주세요.");
			return false;
		}

		if($("input:checkbox[name=agree2-2]").is(":checked")== false){
			alert("개인정보수집 및 이용에 동의해주세요.");
			return false;
		}
		

// 이메일 수신 동의 여부
		var emailChk = $('input[name=agree2-3]').is(':checked');

		if(emailChk){
			var emailyn = "?email_agree=Y";
		}else{
			var emailyn = "?email_agree=N";
		}
		location.href="join_step2.do"+emailyn;

}		
		
			
	