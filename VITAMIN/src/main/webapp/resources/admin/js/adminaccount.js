$(function(){
	var flag = true ;

var key = function() {
			$.ajax({
					type : 'post',
					async : true,
					url : 'accountsearch.do',
					dataType : 'json',
					data : {
						keyselects : $("#key-select").val(),			//키워드
						accountsearch : $("#accountsearch").val(),	//검색어
						rankselect : $("#rank-select").val(),		//권한
						gradeselect : $("#grade-select").val()		//등급
						},
					contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(list){
								flag=null;
								$('#accountlist').empty();
								
								for ( var count = 0; count < list.length ; count++){                
					                console.log(list[count].u_rank );
					                 var option = null;
					              if(list[count].u_rank === "일반"){
					              option = $("<tr><td class = 'listid'>"+list[count].u_id+"</td><td>"+list[count].u_name+"</td><td>"+list[count].u_tel+"</td><td>"+list[count].u_height+"</td><td>"
					              +list[count].u_weight+"</td><td>"+list[count].u_grade+"</td>"
					              +"<td><select class='custom-select rankoption' id=''><option value='일반' selected>일반</option>	<option value='트레이너'>트레이너</option><option value='관리자'>관리자</option></select></td>"
					              +"<td><input type='button' class = 'black' value= "+list[count].u_black+"></td></tr>");
					              }else if(list[count].u_rank === "트레이너"){
					              //alert('트레이너');
					              option = $("<tr><td class = 'listid'>"+list[count].u_id+"</td><td>"+list[count].u_name+"</td><td>"+list[count].u_tel+"</td><td>"+list[count].u_height+"</td><td>"
					              +list[count].u_weight+"</td><td>"+list[count].u_grade+"</td>"
					              +"<td><select class='custom-select rankoption' id=''><option value='일반' >일반</option>	<option value='트레이너' selected>트레이너</option><option value='관리자'>관리자</option></select></td>"
					              +"<td><input type='button' class = 'black' value= "+list[count].u_black+"></td></tr>");
					              }else if (list[count].u_rank === "관리자"){
					              //alert('관리자');
					              option = $("<tr><td class = 'listid'>"+list[count].u_id+"</td><td>"+list[count].u_name+"</td><td>"+list[count].u_tel+"</td><td>"+list[count].u_height+"</td><td>"
					              +list[count].u_weight+"</td><td>"+list[count].u_grade+"</td>"
					              +"<td><select class='custom-select rankoption' id=''><option value='일반' >일반</option>	<option value='트레이너'>트레이너</option><option value='관리자' selected>관리자</option></select></td>"
					              +"<td><input type='button' class = 'black' value= "+list[count].u_black+"></td></tr>");
					              }

					         	 $('#accountlist').append(option);

           						}
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
					});
	}
	
	//key();
	//엔터키 눌렀을떄 검색
	 $('body').on('keydown',"#accountsearch",function(keys) {
		if (keys.keyCode == 13) {
			$.ajax({
					type : 'post',
					async : true,
					url : 'accountsearch.do',
					dataType : 'json',
					data : {
						keyselects : $("#key-select").val(),			//키워드
						accountsearch : $("#accountsearch").val(),	//검색어
						rankselect : $("#rank-select").val(),		//권한
						gradeselect : $("#grade-select").val()		//등급
						},
					contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(list){
								flag=null;
								$('#accountlist').empty();
								
								for ( var count = 0; count < list.length ; count++){                
					                console.log(list[count].u_rank );
					                 var option = null;
					              if(list[count].u_rank === "일반"){
					              option = $("<tr><td class = 'listid'>"+list[count].u_id+"</td><td>"+list[count].u_name+"</td><td>"+list[count].u_tel+"</td><td>"+list[count].u_height+"</td><td>"
					              +list[count].u_weight+"</td><td>"+list[count].u_grade+"</td>"
					              +"<td><select class='custom-select rankoption' id=''><option value='일반' selected>일반</option>	<option value='트레이너'>트레이너</option><option value='관리자'>관리자</option></select></td>"
					              +"<td><input type='button' class = 'black' value= "+list[count].u_black+"></td></tr>");
					              }else if(list[count].u_rank === "트레이너"){
					              //alert('트레이너');
					              option = $("<tr><td class = 'listid'>"+list[count].u_id+"</td><td>"+list[count].u_name+"</td><td>"+list[count].u_tel+"</td><td>"+list[count].u_height+"</td><td>"
					              +list[count].u_weight+"</td><td>"+list[count].u_grade+"</td>"
					              +"<td><select class='custom-select rankoption' id=''><option value='일반' >일반</option>	<option value='트레이너' selected>트레이너</option><option value='관리자'>관리자</option></select></td>"
					              +"<td><input type='button' class = 'black' value= "+list[count].u_black+"></td></tr>");
					              }else if (list[count].u_rank === "관리자"){
					              //alert('관리자');
					              option = $("<tr><td class = 'listid'>"+list[count].u_id+"</td><td>"+list[count].u_name+"</td><td>"+list[count].u_tel+"</td><td>"+list[count].u_height+"</td><td>"
					              +list[count].u_weight+"</td><td>"+list[count].u_grade+"</td>"
					              +"<td><select class='custom-select rankoption' id=''><option value='일반' >일반</option>	<option value='트레이너'>트레이너</option><option value='관리자' selected>관리자</option></select></td>"
					              +"<td><input type='button' class = 'black' value= "+list[count].u_black+"></td></tr>");
					              }

					         	 $('#accountlist').append(option);

           						}
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
					});
			
		}//엔터키 끝
		
	});
	
	
	//버튼 눌렀을떄 검색 
	$('body').on('click',"#searchbtn",key);
	$('body').on('change',"#rank-select",key);
	$('body').on('change',"#grade-select",key);
		
		
		$('body').on('click',".black",function(){
		//alert('시바');
		if($(this).val()=='Y'){
			if(confirm("차단해체 하시겠습니까")==false){
			return;
			}
		}else{
			if(confirm("차단 하시겠습니까?")==false){
			return;
			}
		}
				//$(this).parent().parent().find("td.listid").text();
				//$(this).val();
					$.ajax({
					type : 'post',
					async : true,
					url : 'blackupdate.do',
					dataType : 'text',
					data : {
						blackid : $(this).parent().parent().find("td.listid").text(),
						blackstate : $(this).val()		

						},
					contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
					if(flag){
						location.reload();
						alert('수정완료');
					}else{
						key();
						alert('수정완료');
					}
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
					});
			
		})
		
		$('body').on('change',".rankoption",function(){
		//alert($(this).val());
		//alert($(this).parent().parent().find("td.listid").text());
			
			$.ajax({
					type : 'post',
					async : true,
					url : 'rankupdate.do',
					dataType : 'text',
					data : {
						rankid : $(this).parent().parent().find("td.listid").text(),
						rankstate : $(this).val()		

						},
					contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
					if(flag){
						location.reload();
						alert('수정완료');
					}else{
						key();
						alert('수정완료');
					}
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
					});
		});





});
