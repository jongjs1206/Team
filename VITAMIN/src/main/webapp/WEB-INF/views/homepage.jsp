<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VITAMIN</title>
<link rel="icon" href="resources/images/etc/favicon.png">
<link rel="stylesheet" href="resources/css/homepage.css">

<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/vendor/bootstrap.min.js"></script>
<script src="resources/js/homepage.js"></script>
</head>
<body>
	<%@ include file="../../header.jsp"%>

	<input type='hidden' class='user_pay' value='${sessionScope.user_pay}' />
	<input type='hidden' class='u_grade' value='${sessionScope.grade}' />
	<section class="search-section">
		<div class="container">
			<div class="row subscribe-from">
				<div class="col-md-12">
					<form class="form-inline col-md-12 wow fadeInDown animated">
						<div class="form-group">
							<input type="email" class="form-control subscribe" id="email"
								placeholder="Search...">
							<button class="suscribe-btn">
								<i class="pe-7s-search"></i>
							</button>
						</div>
					</form>
					<!-- end /. form -->
				</div>
			</div>
			<!-- end of/. row -->
		</div>
		<!-- end of /.container -->
	</section>
	<!-- end of /.news letter section -->

	<section class="slider-section">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators slider-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<a href='goods_detail.do?number=151'><img
						src="resources/images/etc/top1.jpg" alt=""></a>
				</div>
				<div class="item">
					<a href='goods_detail.do?number=152'><img
						src="resources/images/etc/top2.jpg" alt=""></a>
				</div>
				<div class="item ">
					<a href='goods_detail.do?number=153'><img
						src="resources/images/etc/top3.jpg" alt=""></a>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="pe-7s-angle-left glyphicon-chevron-left" aria-hidden="true"></span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="pe-7s-angle-right glyphicon-chevron-right" aria-hidden="true"></span>
			</a>
		</div>
	</section>


	<div class='home'>
		<c:if test="${sessionScope.name ne null}">
			<div class='off'>
				<div class='title_choise'>${sessionScope.name}님 추천</div>
				<table class='product_choise'>
					<tr>
							<th><a href='goods_detail.do?number=213'><img class='product_img1'
									alt="" src="resources/admin/product/mainimages/닥터발란스 루프밴드 스트레칭 힙업 스쿼트밴드.jpg"></a></th>
							<th><a href='goods_detail.do?number=215'><img class='product_img2'
									alt="" src="resources/admin/product/mainimages/프로스펙스 라텍스밴드 스트레칭 요가 필라테스 밴드.jpg"></a></th>
							<th><a href='goods_detail.do?number=209'><img class='product_img3'
									alt="" src="resources/admin/product/mainimages/아이워너 미니진동폼롤러 충전식 마사지 폼롤러.jpg"></a></th>
							<th><a href='goods_detail.do?number=127'><img class='product_img4'
									alt="" src="resources/admin/product/mainimages/j127.jpg"></a></th>
						</tr>
						<tr>
							<th class='product_title1'><a class='pro_name'
								href='goods_detail.do?number=213'>닥터발란스 루프밴드 스트레칭 힙업 스쿼트밴드</a></th>
							<th class='product_title2'><a class='pro_name'
								href='goods_detail.do?number=215'>프로스펙스 라텍스밴드 스트레칭 요가 필라테스 밴드</a></th>
							<th class='product_title3'><a class='pro_name'
								href='goods_detail.do?number=209'>아이워너 마사지폼롤러 EVA 입체형 돌기형</a></th>
							<th class='product_title4'><a class='pro_name'
								href='goods_detail.do?number=127'>여성 요가복 DEVI-TS0013-블랙 필라테스 베이직 브라탑</a></th>
						</tr>

						<tr>
							<th><a href='goods_detail.do?number=521'><img class='product_img1'
									alt="" src="resources/admin/product/mainimages/521.jpg"></a></th>
							<th><a href='goods_detail.do?number=540'><img class='product_img2'
									alt="" src="resources/admin/product/mainimages/540.jpg"></a></th>
							<th><a href='goods_detail.do?number=523'><img class='product_img3'
									alt="" src="resources/admin/product/mainimages/523.jpg"></a></th>
							<th><a href='goods_detail.do?number=524'><img class='product_img4'
									alt="" src="resources/admin/product/mainimages/524.jpg"></a></th>
						</tr>
						<tr>
							<th class='product_title1'><a class='pro_name'
								href='goods_detail.do?number=521'>다이어트도시락(마늘 소시지 볶음밥소프트안심 오리지널)</a></th>
							<th class='product_title2'><a class='pro_name'
								href='goods_detail.do?number=540'>더 담은 닭가슴살 도시락 나물밥</a></th>
							<th class='product_title3'><a class='pro_name'
								href='goods_detail.do?number=523'>다이어트도시락(제주톳보리밥소시지볼훈제맛)</a></th>
							<th class='product_title4'><a class='pro_name'
								href='goods_detail.do?number=524'>다이어트도시락(중화볶음밥 굴림만두 고기)</a></th>
						</tr>
				</table>
				<a href='goods_detail.do'><img class='middle'
					src='resources/images/etc/middle1.jpg'></a>
			</div>
		</c:if>

		<div class='title_best'>VITAMIN BEST</div>
		<table class='product_best'>
			<tr>
				<th><a href='goods_detail.do?number=211'><img class='product_img1'
						alt="" src="resources/admin/product/mainimages/프로스펙스 진동 폼롤러.jpg"></a></th>
				<th><a href='goods_detail.do?number=212'><img class='product_img2'
						alt="" src="resources/admin/product/mainimages/닥터발란스 라텍스밴드 0.4mm 스트레칭 고무밴드.jpg"></a></th>
				<th><a href='goods_detail.do?number=214'><img class='product_img3'
						alt="" src="resources/admin/product/mainimages/닥터발란스 피트니스 스틱 튜빙밴드 상체운동 짐스틱.jpg"></a></th>
				<th><a href='goods_detail.do?number=210'><img class='product_img4'
						alt="" src="resources/admin/product/mainimages/아이워너 마블폼롤러 요가 필라테스 EVA.jpg"></a></th>
			</tr>
			<tr>
				<th class='product_title1'><a class='pro_name'
					href='goods_detail.do?number=211'>프로스펙스 진동 폼롤러</a></th>
				<th class='product_title2'><a class='pro_name'
					href='goods_detail.do?number=212'>닥터발란스 라텍스밴드 0.4mm 스트레칭 고무밴드</a></th>
				<th class='product_title3'><a class='pro_name'
					href='goods_detail.do?number=214'>닥터발란스 피트니스 스틱 튜빙밴드 상체운동 짐스틱</a></th>
				<th class='product_title4'><a class='pro_name'
					href='goods_detail.do?number=210'>아이워너 마블폼롤러 요가 필라테스 EVA</a></th>
			</tr>
			<tr>
				<th><a href='goods_detail.do?number=526'><img class='product_img1'
						alt="" src="resources/admin/product/mainimages/526.jpg"></a></th>
				<th><a href='goods_detail.do?number=535'><img class='product_img2'
						alt="" src="resources/admin/product/mainimages/535.jpg"></a></th>
				<th><a href='goods_detail.do?number=534'><img class='product_img3'
						alt="" src="resources/admin/product/mainimages/534.jpg"></a></th>
				<th><a href='goods_detail.do?number=531'><img class='product_img4'
						alt="" src="resources/admin/product/mainimages/531.jpg"></a></th>
			</tr>
			<tr>
				<th class='product_title1'><a class='pro_name'
					href='goods_detail.do?number=526'>다이어트도시락(5종 혼합)</a></th>
				<th class='product_title2'><a class='pro_name'
					href='goods_detail.do?number=535'>더 담은 닭가슴살 도시락 전주비빔밥토마토로제소스 닭가슴살</a></th>
				<th class='product_title3'><a class='pro_name'
					href='goods_detail.do?number=534'>더 담은 닭가슴살 도시락 한끼만두소프트닭가슴살 마늘맛</a></th>
				<th class='product_title4'><a class='pro_name'
					href='goods_detail.do?number=531'>다이어트도시락(양송이볶음밥스팀 고추맛 )</a></th>
			</tr>
		</table>

		<a href='goods_detail.do'><img class='middle'
			src='resources/images/etc/middle2.jpg'></a>

		<video src="resources/images/etc/push-up.mp4"
			poster="resources/images/etc/push-up_img.png" controls></video>
	</div>

	<%@ include file="../../footer.jsp"%>
</body>
</html>