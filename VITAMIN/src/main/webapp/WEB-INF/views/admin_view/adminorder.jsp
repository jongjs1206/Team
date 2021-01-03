<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Accounts - Product Admin Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="../resources/admin/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="../resources/admin/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href="../resources/admin/css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">
	<div class="" id="home">
		<nav class="navbar navbar-expand-xl">
			<div class="container h-100">
				<a class="navbar-brand" href="adminmain.do">
					<h1 class="tm-site-title mb-0">VITAMIN Admin</h1>
				</a>
				<button class="navbar-toggler ml-auto mr-0" type="button"
					data-toggle="collapse" data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars tm-nav-icon"></i>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto h-100">
						<li class="nav-item"><a class="nav-link" href="adminmain.do">
								<i class="fas fa-tachometer-alt"></i> Dashboard <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link active" href="adminorder.do">
								<i class="fas fa-list-alt"></i> order <span class="sr-only">(current)</span>
						</a></li>
<!-- 						<li class="nav-item dropdown"><a -->
<!-- 							class="nav-link dropdown-toggle" href="#" id="navbarDropdown" -->
<!-- 							role="button" data-toggle="dropdown" aria-haspopup="true" -->
<!-- 							aria-expanded="false"> <i class="fas fa-chart-bar"></i> <span> -->
<!-- 									Chart <i class="fas fa-angle-down"></i> -->
<!-- 							</span> -->
<!-- 						</a> -->
<!-- 							<div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!-- 								<a class="dropdown-item" href="#">Daily Chart</a> <a -->
<!-- 									class="dropdown-item" href="#">Weekly Chart</a> <a -->
<!-- 									class="dropdown-item" href="#">Yearly Chart</a> -->
<!-- 							</div></li> -->
						<li class="nav-item"><a class="nav-link"
							href="products.do?category=아령,덤벨"> <i
								class="fas fa-shopping-cart"></i> Products
						</a></li>

						<li class="nav-item"><a class="nav-link" href="accounts.do">
								<i class="far fa-user"></i> Accounts
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-cog"></i> <span>
									Settings <i class="fas fa-angle-down"></i>
							</span>
						</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Profile</a> <a
									class="dropdown-item" href="#">Billing</a> <a
									class="dropdown-item" href="#">Customize</a>
							</div></li>
					</ul>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link d-block"
							href="../homepage.do"> Admin, <b>Logout</b>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container mt-5">
			<div class="row tm-content-row">
				<div class="col-12 tm-block-col">
					<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
						<h2 class="tm-block-title">주문 정보</h2>
						<p class="text-white"></p>
						<form action="adminorder.do">
						<div class="form-group col-lg-6">
								<label for="name">-성명-</label> <input id="name"
									type="text" name='o_name'
									 class="form-control validate" value='${param.o_name}'/>
									 
						</div >
						<div  class="" style="width:380px; position:absolute; top : 123px; left:580px;">
						<button style=" position:absolute;  left:400px;" class='btn btn-success'>검색</button>
						<select  class="custom-select" name='select'>
							<option value="전체" >전체</option>
						<c:choose>
							<c:when test="${param.select eq '준비중'}">
								<option value="준비중" selected>준비중</option>
								<option value="배송중" >배송중</option>
								<option value="배송완료">배송완료</option>
								<option value="반품">반품</option>
								<option value="반품완료">반품완료</option>
								<option value="취소">취소</option>		
							</c:when>
							<c:when test="${param.select eq '배송중'}">
								<option value="준비중">준비중</option>
								<option value="배송중" selected>배송중</option>
								<option value="배송완료">배송완료</option>
								<option value="반품">반품</option>
								<option value="반품완료">반품완료</option>
								<option value="취소">취소</option>									
							</c:when>
							<c:when test="${param.select eq '배송완료'}">
								<option value="준비중">준비중</option>
								<option value="배송중">배송중</option>
								<option value="배송완료" selected>배송완료</option>
								<option value="반품">반품</option>
								<option value="반품완료">반품완료</option>
								<option value="취소">취소</option>								
							</c:when>
							<c:when test="${param.select eq '반품'}">
								<option value="준비중">준비중</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
								<option value="반품" selected>반품</option>
								<option value="반품완료">반품완료</option>
								<option value="취소">취소</option>								
							</c:when>
							<c:when test="${param.select eq '반품완료'}">
								<option value="준비중">준비중</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
								<option value="반품">반품</option>
								<option value="반품완료" selected>반품완료</option>
								<option value="취소">취소</option>
							</c:when>
							<c:when test="${param.select eq '취소'}">
								<option value="준비중">준비중</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
								<option value="반품">반품</option>
								<option value="반품완료">반품완료</option>
								<option value="취소" selected>취소</option>
							</c:when>
							<c:otherwise>
								<option value="준비중">준비중</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
								<option value="반품">반품</option>
								<option value="반품완료">반품완료</option>
								<option value="취소">취소</option>	
							</c:otherwise>
						</c:choose>
						
							
						</select>
						</div>
						</form>
						
						<div class="tm-product-table-container mt-9 tm-block-h-auto">
							<table class="table">
							<center>
								<thead>
									<tr style='top:-30px;'>
										<th>주문번호</th>
										<th>ID</th>
										<th>이름</th>
										<th>상품이름</th>
										<th>날짜</th>
										<th>상태</th>
										<th><a  style="position: relative;left:30px;">주문 정보</a></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="listgo" items="${list}">
										<tr>
											<c:set var='date' value='${listgo.o_date}.substring(0,6)'></c:set>
											<td class = "ordernum">${listgo.o_num}</td>
											<c:choose>
												<c:when test="${empty listgo.u_id}">
													<td>비회원</td>
												</c:when>
												<c:otherwise>
													<td>${listgo.u_id}</td>
												</c:otherwise>
											</c:choose>
<%-- 											<td>${listgo.u_id}</td> --%>
<%-- 											<td>${listgo.u_name}</td> --%>
											<c:choose>
												<c:when test="${empty listgo.u_name}">
													<td>비회원</td>
												</c:when>
												<c:otherwise>
													<td>${listgo.u_name}</td>
												</c:otherwise>
											</c:choose>
											<td>${listgo.p_name}</td>
											<td>${fn:substring(date,0,11)}</td>
											<td class = "orderstate">${listgo.o_delivery}</td>	
											<td><button type='button' class='btn-primary btn-sm order orderupdate' style="left:40px;">처리</button>
												<button type='button' class='btn-primary btn-sm order ordercancle' style="left:40px;">취소</button>
												<button type='button' class='btn-primary btn-sm order orderselect' style="left:40px;">
												<a href = "orderdetail.do?o_num=${listgo.o_num}">조회</a></button>
											<td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			

		<script src="../resources/admin/js/jquery-3.3.1.min.js"></script>
		<!-- https://jquery.com/download/ -->
		<script src="../resources/admin/js/bootstrap.min.js"></script>
		<script src="../resources/admin/js/adminorder.js"></script>
		<!-- https://getbootstrap.com/ -->
</body>
</html>
