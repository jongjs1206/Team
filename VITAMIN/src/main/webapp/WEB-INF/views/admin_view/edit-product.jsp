<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Edit Product - Dashboard Admin Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="../resources/admin/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href="../resources/admin/jquery-ui-datepicker/jquery-ui.min.css"
	type="text/css" />
<!-- http://api.jqueryui.com/datepicker/ -->
<link rel="stylesheet" href="../resources/admin/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href="../resources/admin/css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body>
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
<!-- 					<li class="nav-item dropdown"><a -->
<!-- 						class="nav-link dropdown-toggle" href="#" id="navbarDropdown" -->
<!-- 						role="button" data-toggle="dropdown" aria-haspopup="true" -->
<!-- 						aria-expanded="false"> <i class="fas fa-chart-bar"></i> <span> -->
<!-- 								Chart <i class="fas fa-angle-down"></i> -->
<!-- 						</span> -->
<!-- 					</a> -->
<!-- 						<div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!-- 							<a class="dropdown-item" href="#">Daily Chart</a> <a -->
<!-- 								class="dropdown-item" href="#">Weekly Chart</a> <a -->
<!-- 								class="dropdown-item" href="#">Yearly Chart</a> -->
<!-- 						</div></li> -->
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
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">상품 수정</h2>
						</div>
					</div>
					<form action="edit-product-submit.do" method="post"
						class="tm-edit-product-form" enctype="multipart/form-data" id = "updateproduct">
						<div class="row tm-edit-product-row">
							<div class="col-xl-6 col-lg-6 col-md-12">
								<div class="form-group mb-3">
									<label for="name">상품번호</label> <input id="name" name="p_num"
										type="text" class="form-control validate"
										value=${updatevo.p_num } readonly />
								</div>
								<div class="form-group mb-3">
									<label for="name">상품명</label> <input id="name" name="p_name"
										type="text" value=${updatevo.p_name
										}
										class="form-control validate" required />
								</div>
								<input type="hidden" id='hiddencate'
									value='${updatevo.ca_smallcate}'>
								<div class="form-group mb-3">
									<label for="category">카테고리</label> <select
										class="custom-select tm-select-accounts" id="uptatecategory" name = "ca_smallcate">
										<option>Select category</option>
										<option value="아령,덤벨">헬스용품 - 아령,덤벨</option>
										<option value="케틀벨">헬스용품 - 케틀벨</option>
										<option value="푸쉬업바">헬스용품 - 푸쉬업바</option>
										<option value="케이블머신">헬스용품 - 케이블머신</option>
										<option value="밴드/로프">헬스용품 - 밴드/로프</option>
										<option value="웨이트볼">헬스용품 - 웨이트볼</option>
										<option value="폼롤러">요가/필라테스 - 폼롤러</option>
										<option value="밴드">요가/필라테스 - 밴드</option>
										<option value="짐볼">요가/필라테스 - 짐볼</option>
										<option value="요가매트">요가/필라테스 - 요가매트</option>
										<option value="밸런스운동">요가/필라테스 - 밸런스운동</option>
										<option value="남성">운동복 - 남성</option>
										<option value="여성">운동복 - 여성</option>
										<option value="보호장비">운동복 - 보호장비</option>
										<option value="기타">운동복 - 기타</option>
										<option value="닭가슴살">건강식품 - 닭가슴살</option>
										<option value="간편한끼">건강식품 - 간편한끼</option>
										<option value="도시락/샐러드">건강식품 - 도시락/샐러드</option>
										<option value="고구마/견과">건강식품 - 고구마/견과</option>
										<option value="건강간식">건강식품 - 건강간식</option>
									</select>
								</div>
								<div class="row" id="productprice">
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="p_costprice">원가 </label> <input id="p_costprice"
											name="p_costprice" type="number"
											class="form-control validate"
											value=${updatevo.p_costprice
											}
											data-large-mode="true" required />
									</div>
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="p_discountrate">할인율 </label> <input
											id="p_discountrate" name="p_discountrate" type="number"
											class="form-control validate" min="0" max="100"
											value=${updatevo.p_discountrate } required />
									</div>
									<div class="form-group mb-3 col-xs-12 col-sm-6"
										id="productstock">
										<label for="p_sellprice">판매가 </label> <input id="p_sellprice"
											name="p_sellprice" type="number"
											class="form-control validate"
											value=${updatevo.p_sellprice
											} readonly />
									</div>
									<div class="form-group mb-3 col-xs-12 col-sm-6"
										id="productstock">
										<label for="p_stock">재고 </label> <input id="p_stock"
											name="p_stock" type="number"
											class="form-control validate"
											value=${updatevo.p_stock
											} required />
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
								<div class="tm-product-img-dummy mx-auto" id="img_wrap"
									style="overflow: hidden;">
									<div class="img_wrap">
										<img id="img"
											src="../resources/admin/product/mainimages/${updatevo.p_mainimage}"
											class="img-fluid d-block mx-auto">
										<!-- 										<i class="fas fa-cloud-upload-alt tm-upload-icon" -->
										<!-- 										onclick="document.getElementById('mainfile').click();"></i> -->
									</div>
								</div>
								<div class="custom-file mt-3 mb-3 col-sm-12">
									<input id="mainfile" type="file" name="mainfile"
										style="display: none;" class="form-control validate" required />
									<input type="button" class="btn btn-primary btn-block mx-auto"
										value="메인 이미지 변경"
										onclick="document.getElementById('mainfile').click();" />
								</div>

								<div class="form-group mb-3 col-xs-12 col-sm-6"></div>
								<div class="custom-file mt-3 mb-3 col-sm-12">
									<input id="subfileInput" multiple="multiple" type="file"
										name="subfileInput" class="form-control"
										style="display: none;" required /> <input type="button"
										class="btn btn-primary btn-block mx-auto" value="설명이미지 업로드"
										onclick="document.getElementById('subfileInput').click();" />
								</div>

								<div id="imgs" class="custom-file mt-3 mb-3 col-sm-12">
									<div class="imgs_wraps">
										<c:forEach items="${imgvolist}" var="img">
											<div>
												<img
													src="../resources/admin/product/subimages/${img.i_imgpath}" />
												<button type="button" onsubmit="return false"
													class="btn btn-primary imagedelete "><input type='hidden' name = 'deleteSubImgNum' value='${img.i_imgpath}'/>삭제</button>
											</div>
										</c:forEach>
									</div>
								</div>




							</div>
							<div class="form-group mb-12 col-xs-12 col-sm-12">
								<div class="col-xl-12 col-lg-12 col-md-12">
									<input
										class="btn btn-primary btn-block text-uppercase form-group mb-3 col-xs-6 col-sm-1"
										type="button" value="옵션 추가" id="optionbutton" />
								</div>
								<div id="optionlist">
									<c:forEach items="${optionvolist}" var="OptionVO">
										<div class='options form-group'>
											<label>옵션명</label> <input name='po_optionName' type='text'
												class='form-control validate col-sm-3'
												value=${OptionVO.po_optionname
											} required /> <label>재고</label>
											<input name='po_optionstock' type='number'
												class='form-control validate col-sm-3'
												value=${OptionVO.po_optionstock } required /> <label>추가금액</label>
											<input name='po_addprice' type='number'
												class='form-control validate col-sm-3'
												value=${OptionVO.po_addprice
											} required /> <input
												type='button' class='deleteoption btn-primary' value='옵션 삭제' />
										</div>

									</c:forEach>
								</div>

								<label for="p_content">내용</label>
								<textarea class="form-control validate" rows="6"
									name="p_content" id="p_content">${updatevo.p_content}</textarea>
							</div>
							<div class="col-12">
								<input type="button" onsubmit="return false" 
									class="btn btn-primary btn-block text-uppercase" id = "updateproductbutton" value="수정하기" />

							</div>
						</div>
					</form>
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
	<script src="../resources/admin/jquery-ui-datepicker/jquery-ui.min.js"></script>
	<!-- https://jqueryui.com/download/ -->
	<script src="../resources/admin/js/bootstrap.min.js"></script>
<!-- 	<script src="../resources/admin/js/adminproduct.js"></script> -->
	<script src="../resources/admin/js/adminproductupdate.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script>
		$(function() {
			$("#expire_date").datepicker({
				defaultDate : "10/22/2020"
			});
		});
	</script>
</body>
</html>
