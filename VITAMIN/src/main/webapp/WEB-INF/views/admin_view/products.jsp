<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Product Page - Admin HTML Template</title>
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
						<li class="nav-item"><a class="nav-link" href="adminorder.do">
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
						<li class="nav-item"><a class="nav-link active"
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
			<div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-products">
					<h2 class="tm-block-title">${param.category}</h2>
					<div class="tm-product-table-container">
						<table class="table table-hover tm-table-small tm-product-table">
							<thead>
								<tr>
									<th scope="col">&nbsp;</th>
									<th scope="col">상품명</th>
									<th scope="col">상품번호</th>
									<th scope="col">재고</th>
									<th scope="col">판매가</th>
									<th scope="col">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
									<c:forEach items="${goodsList}" var="goods">
										<tr>
											<th scope="row"><input type="checkbox" name="complete_yn" /></th>
											<td class="tm-product-name">${goods.p_name}</td>
											<td class="checkpnum">${goods.p_num}</td>
											<td>${goods.p_stock}</td>
											<td>${goods.p_sellprice}</td>
											<td><a href="edit-product.do?p_num=${goods.p_num}" class="tm-product-delete-link updateproduct"> <i
													class="far fas fa-cog tm-product-delete-icon"></i>
											</a></td>
										</tr>
									</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- table container -->
					<a href="add-product.do"
						class="btn btn-primary btn-block text-uppercase mb-3">상품 등록</a>
					<button class="btn btn-primary btn-block text-uppercase" id = "productdelete">
						상품 삭제</button>
				</div>
			</div>
			<div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-product-categories">
					<h2 class="tm-block-title">상품 카테고리</h2>
					<div class="tm-product-table-container">
						<table class="table tm-table-small tm-product-table">
							<tbody>
								<tr>
									<td class="tm-product-name">헬스용품 - 아령,덤벨</td>
									<td class="text-center"><a
										href="products.do?category=아령,덤벨"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">헬스용품 - 케틀벨</td>
									<td class="text-center"><a href="products.do?category=케틀벨"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">헬스용품 - 푸쉬업바</td>
									<td class="text-center"><a
										href="products.do?category=푸쉬업바"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">헬스용품 - 케이블머신</td>
									<td class="text-center"><a
										href="products.do?category=케이블머신"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">헬스용품 - 밴드/로프</td>
									<td class="text-center"><a
										href="products.do?category=밴드/로프"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">헬스용품 - 웨이트볼</td>
									<td class="text-center"><a
										href="products.do?category=웨이트볼"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">요가/필라테스 - 폼롤러</td>
									<td class="text-center"><a href="products.do?category=폼롤러"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">요가/필라테스 - 밴드</td>
									<td class="text-center"><a href="products.do?category=밴드"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">요가/필라테스 - 짐볼</td>
									<td class="text-center"><a href="products.do?category=짐볼"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">요가/필라테스 - 요가매트</td>
									<td class="text-center"><a
										href="products.do?category=요가매트"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">요가/필라테스 - 밸런스운동</td>
									<td class="text-center"><a
										href="products.do?category=밸런스운동"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">운동복 - 남성</td>
									<td class="text-center"><a href="products.do?category=남성"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">운동복 - 여성</td>
									<td class="text-center"><a href="products.do?category=여성"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">운동복 - 보호장비</td>
									<td class="text-center"><a
										href="products.do?category=보호장비"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">운동복 - 기타</td>
									<td class="text-center"><a href="products.do?category=기타"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">건강식품 - 닭가슴살</td>
									<td class="text-center"><a
										href="products.do?category=닭가슴살"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">건강식품 - 간편한끼</td>
									<td class="text-center"><a
										href="products.do?category=간편한끼"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">건강식품 - 도시락/샐러드</td>
									<td class="text-center"><a
										href="products.do?category=도시락/샐러드"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">건강식품 - 고구마/견과</td>
									<td class="text-center"><a
										href="products.do?category=고구마/견과"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<tr>
									<td class="tm-product-name">건강식품 - 건강간식</td>
									<td class="text-center"><a
										href="products.do?category=건강간식"
										class="tm-product-delete-link"> <i
											class="far fas fa-cog tm-product-delete-icon"></i>
									</a></td>
								</tr>

							</tbody>
						</table>
					</div>
					<!-- table container -->
					<!-- 					<button class="btn btn-primary btn-block text-uppercase mb-3"> -->
					<!-- 						Add new category</button> -->
				</div>
			</div>
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2018</b> All rights reserved. Design: <a
					rel="nofollow noopener" href="https://templatemo.com"
					class="tm-footer-link">Template Mo</a>
			</p>
		</div>
	</footer>

	<script src="../resources/admin/js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="../resources/admin/js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script src="../resources/admin/js/adminproduct.js"></script>
	<script>
		//       $(function() {
		//         $(".tm-product-name").on("click", function() {
		//           window.location.href = "edit-product.html";
		//         });
		//       });
	</script>
</body>
</html>