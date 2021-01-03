$(function(){
		
		
		$('.orderupdate').click(function(){
//				alert($(this).parent().parent().find('.ordernum').text()); 
		var orderstate = $(this).parent().parent().find('.orderstate').text();
		
			if(orderstate === '준비중'){
				if(!confirm('배송중 처리하시겠습니까?')){
				return;
				}
			}else if(orderstate === '배송중'){
				if(!confirm('배송완료 처리하시겠습니가?')){
				return;
				}
			}else if(orderstate === '배송완료'){
				alert('이미 배송완료된 상품입니다.');
				return;
			}else if(orderstate === '반품완료'){
				alert('이미 반품완료된 상품입니다.');
				return;
			}else if(orderstate === '반품'){
				if(!confirm('반품완료 처리 하시겠습니까?')){
				return;
				}
			}else if(orderstate === '취소'){
				alert('취소처리된 주문입니다.');
				return;
			}else{
			return;
			}
				$.ajax({
					type : 'post',
					async : true,
					url : 'orderstateupdate.do',
					dataType : 'text',
					data : {
						updateordernum : $(this).parent().parent().find('.ordernum').text(),
						orderstate : $(this).parent().parent().find('.orderstate').text()
						},
					//contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
					 		alert("처리되었습니다.");
							location.reload();
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
					});
			
		}) //오더 수정 클릭 끝
		
		$('.ordercancle').click(function(){
			//				alert($(this).parent().parent().find('.ordernum').text()); 
		var orderstate = $(this).parent().parent().find('.orderstate').text();
			if(orderstate === '준비중' || orderstate === '배송중' || orderstate === '반품'){
				if(!confirm('해당주문을 취소하시겠습니까?')){
					return;
					}
			}else{
					alert('취소되었거나 완료된 주문입니다.');
					return;
					
			}
			$.ajax({
					type : 'post',
					async : true,
					url : 'orderstatecancle.do',
					dataType : 'text',
					data : {
						updateordernum : $(this).parent().parent().find('.ordernum').text(),
						orderstate : $(this).parent().parent().find('.orderstate').text()
						},
					//contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
					 		alert("처리되었습니다.");
							location.reload();
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
					});
		
		
		})//오더 취소 클릭 끝
/*		$('.orderselect').click(function(){
			alert($(this).parent().parent().find('.ordernum').text()); 
				$.ajax({
					type : 'post',
					async : true,
					url : 'orderdetailselect.do',
					dataType : 'text',
					data : {
						updateordernum : $(this).parent().parent().find('.ordernum').text()
						},
					//contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
					 		alert("오더 조회 처리되었습니다.");
							//location.reload();
							location.href = "orderdetail.do";
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
					});
			
			
		});//주문 조회 클릭 끝*/ 
});//	윈도우 온로드 실행 끝 

