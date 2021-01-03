<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VITAMIN - 마이페이지</title>
<link rel="icon" href="resources/images/etc/favicon.png">
<link rel="stylesheet" href="resources/css/mypage.css">
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<script src="resources/js/mypage.js"></script>
</head>
<body>
	<%@ include file="../../header.jsp"%>
	<hr/>
	<div id="contents">
		<div id="myshopMain">
			<ul>
				<li class="shopMain_profile">
					<img src="resources/images/etc/user.png">
					<h3>
						<strong>Profile</strong><span>회원 정보</span>
					</h3>
					<p>
						회원이신 고객님의 개인정보를<br> 관리하는 공간입니다.
					</p>
				</li>
				
					
				<li class="shopMain_order">
					<img src="resources/images/etc/search.png">
					<h3>
						<strong>Order</strong><span>주문내역 조회</span>
					</h3>
					<p>
						고객님께서 주문하신 상품의<br>
						주문내역을 확인하실 수 있습니다.
					</p>
				</li>
				

				<li class="shopMain_wishlist">
					<img src="resources/images/etc/shopping-cart.png">
					<h3>
						<strong>Basket</strong><span>장바구니</span>
					</h3>
					<p>
						장바구에 등록하신<br> 상품의 목록을 보여드립니다.
					</p>
				</li>
			</ul>

			<ul>
				<li class="shopMain_mileage ">
					<img src="resources/images/etc/coin.png">
					<h3>
						<strong>Mileage</strong><span>적립금</span>
					</h3>
					<p>
						적립금은 상품 구매 시<br>사용하실 수 있습니다.
					</p>
				</li>

				<li class="shopMain_board">
					<img src="resources/images/etc/contract.png">
					<h3>
						<strong>Board</strong><span>게시물 관리</span>
					</h3>
					<p>
						고객님께서 작성하신 게시물을<br>관리하는 공간입니다.
					</p>
				</li>
				<li class="shopMain_address">
					<img src="resources/images/etc/houses.png">
					<h3>
						<strong>Address</strong><span>배송 주소록 관리</span>
					</h3>
					<p>
						자주 사용하는 배송지를 등록하고<br>관리하실 수 있습니다.
						
					</p>
				</li>
			</ul>
		</div>
	</div>
	<%@ include file="../../footer.jsp"%>
</body>
</html>