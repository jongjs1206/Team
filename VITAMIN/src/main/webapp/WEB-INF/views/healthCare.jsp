<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/healthCare.css">

<script
	src="./resources/js/vendor/jquery-3.5.1.min.js"></script>
<script
	src="./resources/js/helathCare/popper.min.js"></script>
<script
	src="./resources/js/helathCare/cookie.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="./resources/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="./resources/css/OrderCheck/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="./resources/js/vendor/bootstrap.min.js"></script>

</head>
<body>
	<%@ include file="../../header.jsp"%>
	<hr/><br/><br/><br/><br/>

	<div class="doctor__item__text">
		 <c:forEach items="${dietuserList}" var="dietuserList">
		<span><img style="margin-right: 20px; float: left"
			alt="member_img" src="./resources/images/healthCare/member1.PNG" width="290"></span>
		<h2>Physical</h2>
		<p><h3>${dietuserList.u_name}</h3></p><br/>
		</c:forEach>
		<ul>
		    <c:forEach items="${age}" var="age">
			<li><i class="fa fa-check-circle"></i><img src="./resources/images/healthCare/check.PNG" width="15"> Age : ${age}</li> </c:forEach>
			<c:forEach items="${dietuserList}" var="dietuserList">
			<li><i class="fa fa-check-circle"></i><img src="./resources/images/healthCare/check.PNG" width="15"> Weight : ${dietuserList.u_height}</li>
			<li><i class="fa fa-check-circle"></i><img src="./resources/images/healthCare/check.PNG" width="15"> Height : ${dietuserList.u_weight}</li>
			</c:forEach>
			<c:forEach items="${type}" var="type">
			<li><i class="fa fa-check-circle"></i><img src="./resources/images/healthCare/check.PNG" width="15"> Body Type : ${type}</li>
			</c:forEach>
		</ul>
	</div>
	<br/><br/><br/><br/><br/><br/>

	<div class="container" id="todayFood">

		<ul class='nav nav-tabs'>
			<li class='active'><a class="tabA" href="#foodlist" data-toggle="tab">오늘의
					식단</a></li>
			<li><a class="tabA" href="#trainer" data-toggle="tab">트레이너</a></li>
		</ul>

		<div class='tab-content'>
		 <div class='tab-pane active' id="foodlist">
			<p><h4>오늘 먹은 음식이 내일의 몸을 변화시킵니다!</h4></p><br/>

				<table class="table table-hover">
					<thead>
						<tr>
							<th width="150">시기</th>
							<th width="400">음식이름</th>
							<th width="180">칼로리</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${diet}" var="diet">
						<tr id="txtdiet">
							<td>${diet.d_season}</td>
							<td>${diet.d_name}</td>
							<td>${diet.d_calorie}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			
			 <div class='tab-pane' id="trainer">
			<p><h4>트레이너 전용 구간입니다.</h4></p><br/>

				<table class="table table-hover">
					<thead>
						<tr>
							<th width="150">시기</th>
							<th width="400">음식이름</th>
							<th width="180">칼로리</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>아침</td>
							<td>토마토1개 + 고구마1개 + 닭가슴살 100g</td>
							<td>266kcal</td>
						</tr>
						<tr>
							<td>점심</td>
							<td>닭가슴살 샐러드 + 다이어트 음료</td>
							<td>369kcal</td>
						</tr>
						<tr>
							<td>간식</td>
							<td>바나나 1개 + 계란흰자 3개 + 노른자1개</td>
							<td>225kcal</td>
						</tr>
						<tr>
							<td>저녁</td>
							<td>고구마1개 + 닭가슴살 1조각 + 야채</td>
							<td>434kcal</td>
						</tr>
					</tbody>
				</table>
			</div><br/><br/><br/>
			
			
			
		</div>
	</div>

	<%@ include file="../../footer.jsp"%>

</body>
</html>