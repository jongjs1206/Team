$(function(){

	//상품 수정 관련 js
	// 카테고리 바로뜨게
		$('select[id="uptatecategory"]').find('option[value="' + $('#hiddencate').val()+  '"]').attr("selected",true);
	//
		
		//메인이미지 바꼇을때 코드 시작 
		$("#mainfile").on("change", handleImgFileSelect);
	        
	        var sel_file;
	        //var sel_files = [];
	        
	        function handleImgFileSelect(e) {
            var files = e.target.files;
            	filesArr = Array.prototype.slice.call(files);
 		
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
               // sel_files.push(f);
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            	});
            		
            	var formDatamainimg = new FormData($('#updateproduct')[0]);
            	console.log(formDatamainimg.get("mainfile"));
            	
            	//ajax 메인이미지바꾸기. 
            	$.ajax({
		        url: "mainimagechange.do",
		        type: "POST",
		        dataType: 'text',
		        data: formDatamainimg,
		        contentType: false,
		        processData: false,
		        cache: false,
		        timeout:5000 //5 second timeout
			    }).done(function(jqXHR, textStatus){ 
			    	alert('메인이미지 변경 성공');
					//location.href = "products.do?category=아령,덤벨";
			    }).fail(function(jqXHR, textStatus){
			        console.log('서버 에러', '서버에서 문제가 발생하였습니다.', 'error')
			        console.log("jqXHR = " + jqXHR);
			        console.log("textStatus = " + textStatus);
			    });
            
            
       		 } //function 끝 
      	 	//메인이미지 바꼇을때 코드 끝
      	  	// 원가 포커스 벗어났을때 할인율에 따른 판매가 계산 
			$('#p_discountrate').focusout(function() {
						//판매가 계산 
						$('#p_sellprice').val($('#p_costprice').val()-($('#p_costprice').val()*($('#p_discountrate').val()/100)));
			});
			//판매가 포커스 벗어났을때 할인율에 따른 판매가 계산 
			$('#p_costprice').focusout(function() {
						//판매가 계산 
						$('#p_sellprice').val($('#p_costprice').val()-($('#p_costprice').val()*($('#p_discountrate').val()/100)));
			});
			
			//옵션 추가 코드
			$("#optionbutton").on("click",function(){
			 var option_html = "<div class='options form-group'><label>옵션명</label> <input name = 'po_optionName' type= 'text' class = 'form-control validate col-sm-3' required/>"+
			"<label >재고</label> <input name = 'po_optionstock' type= 'number' class = 'form-control validate col-sm-3' required/>"+
			 "<label>추가금액</label> <input name = 'po_addprice' type= 'number' class = 'form-control validate col-sm-3' required/><input type='button' class = 'deleteoption btn-primary' value='옵션 삭제'/></div>";
	                    $("#optionlist").append(option_html);
	                    
			})
			//옵션 제거 코드
			$("#optionlist").on("click",'.deleteoption',function(){
				$(this).parent().remove();
			})
			
			
			//서브이미지 바꼇을때 코드 시작 
			 $("#subfileInput").on("change", handleImgsFilesSelects);
			 
			 var sub_sel_files = [];
			 
			function handleImgsFilesSelects(e) {
      	   // e.preventDefault();
          
             var files = e.target.files;
          	 var filesArr = Array.prototype.slice.call(files);
 
             //$(".imgs_wraps").empty();
        	
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 				
                sub_sel_files.push(f);
		 		
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img_html = "<div><img src=\"" + e.target.result + "\" />"+"<button type='button' onsubmit='return false' class='btn btn-primary imagedelete'><input type ='hidden' class='idxs' value = '"+f.name+"'/>삭제</button></div>";
                    $(".imgs_wraps").append(img_html); 
                }
                reader.readAsDataURL(f);
		 		
            });
            
       	 	}
			//서브이미지 바꼇을때 코드 끝 
			
			// 서브이미지 개별삭제 시작
	        $('#imgs').on("click",".imagedelete",function(){
	        	console.log($(this).children().val());
	        	//console.log(sub_sel_files[0].name);
	        	
	        	
	        	sub_sel_files.splice(sub_sel_files.indexOf($(this).children().val()),1); // 파일명을 찾아서 파일을담은배열에서 삭제한다.
	    		console.log(sub_sel_files);
	        	
	        	$(this).parent().remove();
	        
	       	 })
			// 서브이미지 개별삭제 코드 끝 
			
			//서브이미지 삭제버튼 눌렀을때 삭제 이미지의 i_num값을 저장하기위한 코드 시작
			var deleteSubImglist = new Array();  // 서브이미지 번호 담을 배열
			
			$('.imagedelete').click(function(){
				
				//alert($(this).children().val());
				deleteSubImglist.push($(this).children().val());
				
				//삭제할 서브넘버 리스트 조회 
				var step;
		        for(step=0 ; step < deleteSubImglist.length;step++){
		        	console.log(deleteSubImglist[step]);
				}
				
			})
			
			//서브이미지 삭제버튼 눌렀을때 삭제 이미지의 i_num값을 저장하기위한 코드 끝
			
			
			//수정하기버튼 눌렀을때  
			$('#updateproductbutton').click(function(){
				//alert('수정하기버튼 클릭됨')
				
				var formData = new FormData($('#updateproduct')[0]); // 폼데이터 받아오기 
				//이미 메인이미지는 바꿧으니 메인이미지 포함 필요없는 form데이터 지우기
				formData.delete("mainfile");
				formData.delete("subfileInput");
				
				//저장했던 서브이미지 폼데이타에 쌓기
				var step;
		        for(step=0;step < sub_sel_files.length;step++){
		         formData.append("subfileInput",sub_sel_files[step]);
				}
				sub_sel_files.length = 0;
				
				//받아온 폼데이터 확인 시작
				for (var key of formData.keys()) {
				 console.log(key);
				}
				for (var value of formData.values()) {
				  console.log(value);
				}
				//받아온 폼데이터 확인 끝
				
				//deleteSubImglist 파일,sql 데이터 지우기위해 ajax 전송 시작
				if(deleteSubImglist.length != 0){
				//alert("삭제리스트 : "+deleteSubImglist.length); // 삭제해야될리스트 
				$.ajax({
					type : 'post',
					async : true,
					url : 'subimagedel.do',
					dataType : 'text',
					async : false,
					cache : false,
					timeout : 5000, //5 second timeout
					data : {
						delist : deleteSubImglist
						},
					success: function(){
					alert('이미지지우기성공');
					//location.reload();
							
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
				
				});				
				}
				//deleteSubImglist 파일,sql 데이터 지우기위해 ajax 전송 끝
				//product update ajax 전송 시작
							$.ajax({
						        url: "productupdate.do",
						        type: "POST",
						        dataType: 'text',
						        data: formData,
						        contentType: false,
						        processData: false,
						        async : false,
						        cache: false,
						        timeout : 5000, //5 second timeout
						        success : function(){
							       		alert('수정 성공');
								    //	console.log(data);
								    	//location.reload();
										//location.href = "edit-product.do?product=";
						        },
						        error : function(err){
						       			  console.log(err)
						        }
						    });					
				//product update ajax 전송 끝
				
			
			})//수정하기 버튼 클릭 코드 이벤트 end 
      	  
        
});
