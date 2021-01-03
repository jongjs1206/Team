<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VITAMIN - Login</title>
<link rel="icon" href="resources/images/etc/favicon.png">
<link rel="stylesheet" href="resources/css/login.css">

<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<script src="resources/js/login.js"></script>
</head>
<body>
	<%@ include file="../../header.jsp"%>
	<hr/>
	<div class="login">
		<div class="login_main">
			<nav class="login_nav">
				<a id="login_tap" class="login_1" data-target="member"> 회원 로그인 </a>
				<a id='nomember_tap' class="login_2" data-target="nomember"> 비회원(주문배송조회) </a>
			</nav>
						
			<div class="login_left_box">
				<div class="login_show">
					<form action='log.do' method = 'post'>
						<input type="text" placeholder="아이디" class="text1" name='u_id'>
						<input type="password" placeholder="비밀번호" class="text2" name='u_pass'>
						<div class='message'> ${message}</div>
						<button>로그인</button>
					</form>
				</div>
				
				<div class="nomember">
					<form action="Ordercheck.do">
						<input type="text" name="o_name" id="o_name" placeholder="주문자명" class="text1">
						<input type="text" name="o_tel" id="o_tel" placeholder="전화번호(010-1234-1234)" class="text2">

						<button>주문내역 조회</button>
					</form>
				</div>
			</div>
		</div>

		<div class="fb">
			<h3>회원가입</h3>
			<div>
				<p>
					아직 VITAMIN 회원이 아니신가요? <br>회원가입 후 다양한 혜택과 소식을 받아보세요!
				</p>
				<a class="link">회원가입</a>
			</div>
			<div>
				<p>
					아이디 혹은 비밀번호를 잊으셨나요? <br>간단한 정보를 입력 후 잃어버린 정보를 찾으실 수 있습니다.
				</p>
				<a class="link">아이디/비밀번호 찾기</a>
			</div>
		</div>
	</div>
	<%@ include file="../../footer.jsp"%>
</body>
</html>