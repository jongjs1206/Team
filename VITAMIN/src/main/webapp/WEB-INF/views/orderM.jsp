<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/orderM.css">

</head>
<body>
	<%@ include file="../../header.jsp"%>
	<hr /><br/><br/>
	<div class="main">
	 <c:forEach items="${productlist}" var="productlist">
	<h2>주문상세 내역</h2>
	주문번호:
	<b>${productlist.o_num}</b> &nbsp;&nbsp; 주문일자: ${productlist.o_date}
	<br />
	<br /><br/><br/>

	<h3 style="color:#369">상품정보</h3> 
	<table cellpadding="0" cellspacing="1" border="1" bordercolor="#DADADA"
		style="border-collapse: collapse; border: 1px solid #DADADA;">
		<tr align="center" height="30">
			<td scope="col" height="28" width="450" bgcolor="#F6F6F6"><b>상품명</b></td>
			<td scope="col" width="200" bgcolor="#F6F6F6"><b>수량</b></td>
			<td scope="col" width="200" bgcolor="#F6F6F6"><b>배송비</b></td>
			<td scope="col" width="200" bgcolor="#F6F6F6"><b>판매가</b></td>
			<td scope="col" width="200" bgcolor="#F6F6F6"><b>총합계</b></td>
			<td scope="col" width="200" bgcolor="#F6F6F6"><b>배송 정보</b></td>
		</tr>

		<tr align="center" height="26" bgcolor="#FFFFFF">
			<td height="26" width="100"><div class="n-prd-row">
					<ul class="info">
						<li class="name"><a href="/app/goods/1675435/0"> ${productlist.p_name}</a></li>
						<li class="option">옵션 : ${productlist.po_optionname}</li>
					</ul>
				</div></td>
			<td>${productlist.o_count}</td>
			<td style="PADDING-LEFT: 10PX;">3000원 
			</td>
			<td>${productlist.p_sellprice}</td>
   			</c:forEach>
			<td width="120">${totalprice}</td>
			<td>티떠블유엔 <br> 업체 무료배송 <br> 평균출고일: 1.2일
			</td>
		</tr>
	</table><br/><br/>

	<ul class="n-info-txt">
				<li><img src="./resources/images/orderM/동그라미.PNG" width="14"> 동일한 주문번호라도 2개 이상의 브랜드에서 주문하신 경우 출고지 주소가 달라 각각 출고됩니다. (택배 박스를 2개 이상 수령 가능)</li>
				<li><img src="./resources/images/orderM/동그라미.PNG" width="14"> 출고 완료 직후 교환 / 환불 요청을 하더라도 상품을 수령하신 후 택배 업체를 통해 보내주셔야 처리 가능합니다.</li>
				<li><img src="./resources/images/orderM/동그라미.PNG" width="14"> 별도의 구매 확정이 없더라도 상품 발송 후 9일이 지난 경우에는 자동 구매 확정 됩니다.</li>
				<li><img src="./resources/images/orderM/동그라미.PNG" width="14"> 자세한 내용은 <a class="n-link" href="#">FAQ</a>를 확인하여 주시기 바랍니다.</li>
	</ul>

<br/><br/><br/><br/>
<!-- 배송지 정보 -->
<table class="type09" >
  <thead>
  <tr>
    <th scope="cols" width="400">배송지 정보</th>
    <th scope="cols" width="600"></th>
  </tr>
  </thead>
  
  <tbody>
   <c:forEach items="${userinfolist}" var="userinfolist">
  <tr>
    <th scope="row" >이름</th>
    <td width="300">${userinfolist.o_name}</td>
  </tr>
  <tr>
    <th scope="row">연락처</th>
    <td>${userinfolist.o_tel}</td>
  </tr>
  <tr>
    <th scope="row">배송지 주소</th>
    <td>${userinfolist.o_add}</td>
  </tr>
    <tr>
    <th scope="row">배송 메세지</th>
    <td></td>
  </tr>
  </c:forEach>
  </tbody>
  
</table>
<br/><img src="./resources/images/orderM/동그라미.PNG" width="14"> 발송전 일때만 배송지 주소를 변경하실 수 있습니다.(미입금/입금확인/출고요청 단계까지만가능)

<br/><br/><br/><br/><br/>
<!-- 결제 정보 -->
<table class="type09" >
  <thead>
  <tr>
    <th scope="cols" width="400">결제 정보</th>
    <th scope="cols" width="600"></th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${productlist}" var="productlist">
  <tr>
    <th scope="row" >결제 금액</th>
    <td width="300">${totalprice}</td>
  </tr>
  <tr>
    <th scope="row">상품금액</th>
    <td>${prductprice}</td>
  </tr>
  <tr>
    <th scope="row">배송비</th>
    <td>3000</td>
  </tr>
     <tr>
    <th scope="row">최종 결제 금액</th>
    <td style="color:#FF007F"><b>${totalprice}</b></td>
  </tr>
  </c:forEach>
  </tbody>
</table><br/><br/><br/>
</div>
	<%@ include file="../../footer.jsp"%>
</body>
</html>