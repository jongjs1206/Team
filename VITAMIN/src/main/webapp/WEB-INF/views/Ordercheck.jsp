<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Untitled Document</title>

<link rel="stylesheet" href="./resources/css/Ordercheck.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="./resources/css/OrderCheck/bootstrap-theme.min.css">

<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="./resources/js/vendor/bootstrap.min.js"></script>


<!-- 달력UI (주문조회) -->
<script src="./resources/js/OrderCheck/jquery-ui.js"></script>
<link rel="stylesheet" href="./resources/css/OrderCheck/jquery-ui.css">

</head>

<body>
   <%@ include file="../../header.jsp"%>
	<input id="userid" type="hidden" value="${sessionScope.id}" ><!-- id체크 -->


   <hr/><br/><br/><br/>
   <div class="main">
   <h3>주문조회</h3>
   <br/><br/>
      <ul class='nav nav-tabs'>
            <li id="order" class='active'><a class="tabA" href="#home" data-toggle="tab">주문내역조회</a></li>
            <li id="cancel"><a class="tabA" href="#tab1" id="cencelList" data-toggle="tab" >취소/반품/교환 내역</a></li>
      </ul><br/><br/>
   
   <!-- 주문조회 구간 -->
   <form action="Ordercheck.do" id="search_from" name="search_from" ><!-- 다시 돌아와야하기 때문에 post -->
      <table>
         <tr>
            <td><h4>주문일자 : &nbsp;</h4></td>
            <td><h4><input type="text" style="width:130px; height:100; " name="o_startDate" class="datepicker"> &nbsp;</h4></td>
            <td>― &nbsp;</td>
            <td><h4><input type="text" style="width:130px; height:100; " name="o_endDate" class="datepicker"> &nbsp;</h4></td>
            <td><img src="./resources/images/Ordercheck/btn-search.png" id="btn_search"style="width: 60px;"/> <img src="./resources/images/Ordercheck/btn-search.png" id="btn_search2"style="width: 60px;"/></td>
            	<input id="username" name="o_name" type="hidden" value="${o_name}" ><!-- id체크 -->
				<input id="usertel" name="o_tel" type="hidden" value="${o_tel}" ><!-- id체크 -->
         </tr>
      </table><br/>
   </form>
   
      <script>
         $(function() {
             //input을 datepicker로 선언
             $('#btn_search2').hide();
             $(".datepicker").datepicker({
                 dateFormat: 'yy-mm-dd' //Input Display Format 변경
                 ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                 ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                 ,changeYear: true //콤보박스에서 년 선택 가능
                 ,changeMonth: true //콤보박스에서 월 선택 가능                
                 ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                 ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                 ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                 ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                 ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                 ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                 ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                 ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                 ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                 ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                 ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
             });                    
             
             //초기값을 오늘 날짜로 설정
             $('.datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
             
		   	 //주문취소
		     $('#cencelList').click(function() {
		    	$('.trtr').remove();
		    	 $('#btn_search').hide();
		    	 $('#btn_search2').show(); 
		    	 var o_name = $('#username').val();
	             var o_tel = $('#usertel').val();
		        	$.ajax({
			            type : "POST", //데이터를 보낼 방식
			            url : "Ordercheck.do?o_name="+o_name+"&o_tel="+o_tel , //데이터를 보낼 url
			            dataType:"json", 
			            data : { "o_name" : o_name ,
			            	     "o_tel"  : o_tel  } ,
			            contentType: 'application/json',
			            success : function(data) {//데이터를 보내는 것이 성공했을 시 출력되는 메시지
			            	//console.log(data.get(0));
			            	console.log(data[0].o_num);
			                $.each(data , function(i){
			                var str = '<TR class="trtr" align="center" height="50" bgcolor="#FFFFFF">';
			                    str += '<TD height="26" name="o_date"><h5>' + data[i].o_date + '</h5></TD><TD> <a id="a" name="o_num"href="orderM.do?o_num='+ data[i].o_num +'" ><h5>' + data[i].o_num + '</a></h5></TD><TD align="center" name="p_name" style="PADDING-RIGHT:8PX;"><h5>' + data[i].p_name + '</h5></TD>';
			                    str += '<TD align="right" name="o_count" style="PADDING-RIGHT:8PX;"><h5>' + data[i].o_count + '</h5></TD><TD align="right" name="o_price" style="PADDING-RIGHT:8PX;"><h5>' + data[i].o_price + '</h5></TD><TD width="120" name="o_delivery"><h5>' + data[i].o_delivery + '</h5></TD>';
			                    str += '</TR>';
			                    $("#cancelTable").children().append(str);
		               		});
		                 
	            		}
		     	 	}); 
	   		  });
             
	          //날짜별 조회
	          $('#btn_search').click(function(){
	               var o_name = $('#username').val();
	               var o_tel = $('#usertel').val();
	               if($("#userid").val() == ""){//비회원일때

	               $('#search_from').submit();
	               }else{//회원일때
	            	   
            	   $('#search_from').submit();
	               }
	            });

	          $('#btn_search2').click(function () {
	        	  $('.trtr').remove();
	               var o_startDate = $('input[name="o_startDate"]').val();
	               var o_endDate = $('input[name="o_endDate"]').val();
	               
	               var o_name = $('#username').val();
		           var o_tel = $('#usertel').val();
				        $.ajax({
				            type : "POST", //데이터를 보낼 방식
				            url : "Ordercheck.do?o_name="+o_name+"&o_tel="+o_tel+
				            		"&o_startDate="+o_startDate+"&o_endDate="+o_endDate , //데이터를 보낼 url
				            dataType:"json", 
				            data : { "o_name" : o_name ,
				            	     "o_tel"  : o_tel,
				            	     "o_startDate" : o_startDate,
				            	     "o_endDate" : o_endDate} ,
				            contentType: 'application/json',
				            success : function(data) {//데이터를 보내는 것이 성공했을 시 출력되는 메시지
				                $.each(data , function(i){
				                var str = '<TR class="trtr" align="center" height="50" bgcolor="#FFFFFF">';
				                    str += '<TD height="26" name="o_date"><h5>' + data[i].o_date + '</h5></TD><TD> <a id="a" name="o_num"href="orderM.do?o_num='+ data[i].o_num +'" ><h5>' + data[i].o_num + '</a></h5></TD><TD align="center" name="p_name" style="PADDING-RIGHT:8PX;"><h5>' + data[i].p_name + '</h5></TD>';
				                    str += '<TD align="right" name="o_count" style="PADDING-RIGHT:8PX;"><h5>' + data[i].o_count + '</h5></TD><TD align="right" name="o_price" style="PADDING-RIGHT:8PX;"><h5>' + data[i].o_price + '</h5></TD><TD width="120" name="o_delivery"><h5>' + data[i].o_delivery + '</h5></TD>';
				                    str += '</TR>';
				                    $("#cancelTable").children().append(str);
				               	});
			                 
			            	}
			     	 }); 
			  })
			  
		      $('#order').click(function () {
				$('#btn_search').show();
				$('#btn_search2').hide();
				
			})
	   }); 
     </script>
      <!-- 주문조회 끝-->
         
      <div class='tab-content'>
      <div class='tab-pane active' id="home">
      <table width="1" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="757" border="0" cellpadding="0" cellspacing="0" >
            <tr >
              <td colspan="5" align="left" style="PADDING-TOP:10PX;PADDING-BOTTOM:5PX;"> <h5>주문번호를
                클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br />
                개별상품에 대한 배송조회는 상세내역에서 확인하시기 바랍니다. </h5><br/></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td><table cellpadding="0" cellspacing="1" border="1" bordercolor="#DADADA" style="border-collapse: collapse;border:1px solid #DADADA;">
            <tr align="center" height="30" >
               <td  scope="col" height="60" width="200" bgcolor="#F6F6F6"><h5><b>주문일자</b></h5></td>
               <td scope="col"  width="200" bgcolor="#F6F6F6"><h5><b>주문번호</b></h5></td>
               <td scope="col" width="500" bgcolor="#F6F6F6"><h5><b>상품정보</b></h5></td>
                <td scope="col" width="160" bgcolor="#F6F6F6"><h5><b>수량</b></h5></td>
               <td scope="col"  width="160" bgcolor="#F6F6F6"><h5><b>주문금액</b></h5></td>
               <td scope="col" width="130"  bgcolor="#F6F6F6"><h5><b>주문 상태</b></h5></td>
            </tr>
            <!-- 가져오는곳 -->
               <c:forEach items="${OrderSearchList}" var="OrderSearch">
               <tr align="center" height="50" bgcolor="#FFFFFF">
                 <td height="26" name="o_date"><h5> <fmt:formatDate pattern="yyyy-MM-dd"  value="${OrderSearch.o_date }"/></h5></td>
                 <td ><a id="a" name="o_num"href="orderM.do?o_num=${OrderSearch.o_num}" ><h5> ${OrderSearch.o_num }</a></h5> </td>
                 <td align='center' name="o_info" style="PADDING-LEFT:10PX;"><h5>${OrderSearch.p_name}</h5></td>
                 <td align="right" name="o_count" style="PADDING-RIGHT:8PX;"><h5>${OrderSearch.o_count }</h5></td>
                 <td align="right" name="o_price" style="PADDING-RIGHT:8PX;"><h5>${OrderSearch.o_price }</h5></td>
                 <td width="120" name="o_delivery"><h5>${OrderSearch.o_delivery }</h5></td>
               </tr>
               </c:forEach>         
          </table></td>
        </tr>
      </table>
     </div>
  
  
  
    <div class='tab-pane' id="tab1">
    <form action="cencelList.do" id="fom" name="cancel_from"> 
   <table width="1" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td><table width="757" border="0" cellpadding="0" cellspacing="0" >
         <tr >
           <td colspan="5" align="left" style="PADDING-TOP:10PX;PADDING-BOTTOM:5PX;"> <h5>주문번호를
             클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br />
             개별상품에 대한 배송조회는 상세내역에서 확인하시기 바랍니다. </h5><br/></td>
         </tr>
       </table></td>
     </tr>
     <tr>
       <td><table id="cancelTable" cellpadding="0" cellspacing="1" border="1" bordercolor="#DADADA" style="border-collapse: collapse;border:1px solid #DADADA;">
         <tr align="center" height="30" >
              <td  scope="col" height="60" width="200" bgcolor="#F6F6F6"><h5><b>주문일자</b></h5></td>
                  <td scope="col"  width="200" bgcolor="#F6F6F6"><h5><b>주문번호</b></h5></td>
                  <td scope="col" width="500" bgcolor="#F6F6F6"><h5><b>상품정보</b></h5></td>
                <td scope="col" width="160" bgcolor="#F6F6F6"><h5><b>수량</b></h5></td>
                  <td scope="col"  width="160" bgcolor="#F6F6F6"><h5><b>주문금액</b></h5></td>
                  <td scope="col" width="130"  bgcolor="#F6F6F6"><h5><b>주문 상태</b></h5></td>
         </tr>
       </table></td>
     </tr>
   </table>
  </form>
  </div><br/><br/><br/><br/><br/><br/>
  
  </div>
 </div> <!-- class=main end div -->
   
   
 
   <%@ include file="../../footer.jsp"%>
</body>
</html>
