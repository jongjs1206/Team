$(function(){
	//카테고리바꼇을때 ajax
		$('#ca_largecate').change(function(){
	
				$.ajax({
					type : 'post',
					async : true,
					url : 'category.do',
					dataType : 'json',
					data : {
						largecate : $('#ca_largecate').val()
						},
					contentType  : 'application/x-www-form-urlencoded;charset=utf-8', //한글처리
					success: function(data){
								
								$('#ca_smallcate').empty();
								
								for(var count = 0; count < data.length; count++){                
					                var option = $("<option value = "+data[count]+">"+data[count]+"</option>");
					           	 $('#ca_smallcate').append(option);
           						}

			            },
        			 error : function(err){ console.log(err)}  //실패했을때
				
					});
			})
	//메인이미지 바꼇을때 이벤트
            $("#mainfile").on("change", handleImgFileSelect);
	
	        var sel_file;
	//서브이미지 바꼇을때 이벤트
	        $("#subfileInput").on("change", handleImgsFilesSelects);
	        
	        var sel_files = [];
 			
 			var sub_sel_files = [];
 
 			var filesArr = [];
 	// 이미지 이벤트 코드 
        function handleImgFileSelect(e) {
            var files = e.target.files;
            	filesArr = Array.prototype.slice.call(files);
 		
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_files.push(f);
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
        
          function handleImgsFilesSelects(e) {
         // e.preventDefault();
          
             var files = e.target.files;
           var filesArr = Array.prototype.slice.call(files);
 
                //	$(".imgs_wraps").empty();
        	
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 				
                sub_sel_files.push(f);
		 		
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img_html = "<div><img src=\"" + e.target.result + "\" />"+"<button type='button' onsubmit='return false' class='btn imagedelete'><input type ='hidden' class='idxs' value = '"+f.name+"'/>삭제</button></div>";
                    $(".imgs_wraps").append(img_html); 
                }
                reader.readAsDataURL(f);
		 		
            });
            
       	 	}
        
        //이미지 개별삭제 
        $('#imgs').on("click",".imagedelete",function(){
        	console.log($(this).children().val());
        	//console.log(sub_sel_files[0].name);
        	
        	
        	sub_sel_files.splice(sub_sel_files.indexOf($(this).children().val()),1); // 파일명을 찾아서 파일을담은배열에서 삭제한다.
    		console.log(sub_sel_files);
        	
        	$(this).parent().remove();
        
        })
        
	
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
		 var option_html = "<div class='options form-group'><label>옵션명</label> <input name = 'po_optionName' type= 'text' class = 'form-control validate' required/>"+
		"<label >재고</label> <input name = 'po_optionstock' type= 'number' class = 'form-control validate' required/>"+
		 "<label>추가금액</label> <input name = 'po_addprice' type= 'number' class = 'form-control validate' required/><input type='button' class = 'deleteoption' value='옵션 삭제'/></div>";
                    $("#optionlist").append(option_html);
                    
		})
		//옵션 제거 코드
		$("#optionlist").on("click",'.deleteoption',function(){
			$(this).parent().remove();
		})
	
	
	$("#productinsert").click(function(){
			//event.preventDefault();
	    
		 var formData = new FormData($('#productregist')[0]);
		 
		 formData.delete("subfileInput"); //기존의 subfileInput의 file이중복되어 기본꺼삭제하는거임
		 
		 for(step=0;step<sub_sel_files.length;step++){
         console.log(sub_sel_files[step]);
		}
		 
		var step;
        for(step=0;step<sub_sel_files.length;step++){
         formData.append("subfileInput",sub_sel_files[step]);
		}
		 
		        
		for (var key of formData.keys()) {
		 console.log(key);
		}
		
		for (var value of formData.values()) {
		  console.log(value);
		}
        
       
	    
	    //파일첨부 했는지 체크 
	    var mainfileCheck = document.getElementById("mainfile").value;
		var subfileCheck = document.getElementById("subfileInput").value;
	    
		if(confirm("등록하시겠습니까?")){
			if(!mainfileCheck || !subfileCheck){
	        	alert("파일을 첨부해 주세요");
	        	return false;   //파일첨부가안됬을때 submit안하게 하려고, 
	    	}else{
	    	   $.ajax({
		        url: "insertproduct.do",
		        type: "POST",
		        dataType: 'text',
		        data: formData,
		        contentType: false,
		        processData: false,
		        cache: false,
		        timeout:5000 //5 second timeout
			    }).done(function(jqXHR, textStatus){ 
			    	alert('등록 성공');
					location.href = "products.do?category=아령,덤벨";
			    }).fail(function(jqXHR, textStatus){
			        console.log('서버 에러', '서버에서 문제가 발생하였습니다.', 'error')
			        console.log("jqXHR = " + jqXHR);
			        console.log("textStatus = " + textStatus);
			    });
	    	
	    	}
		}else{
		 return false;
		}
	})
		
	$("#productdelete").click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
				
		var deletelist = new Array() ;  // 삭제상품 번호 담을 배열
		
		$("input[name=complete_yn]:checked").each(function() {
  			 
  				deletelist.push($(this).parent().nextAll(".checkpnum").text()); //체크된 삭제 상품 배열에 넣기.
  						      
		})
		alert(deletelist); 
		 
			alert($(this).parent().nextAll(".checkpnum").text());	//부모의 다음형제노드중 checkpnum인클래스찾기 
				$.ajax({
					type : 'post',
					async : true,
					url : 'delete.do',
					dataType : 'text',
					cache : false,
					data : {
						delist : deletelist
						},
					success: function(data){
					$("input[name=complete_yn]:checked").parent().parent().remove();
			            },
        			 error : function(err){ console.log(err)}  //실패했을때
				
				});
			

		} // 정말삭제? end
	}) // 클릭 end
//	var dropFile = function(event) {
//   event.preventDefault();
//}

});



