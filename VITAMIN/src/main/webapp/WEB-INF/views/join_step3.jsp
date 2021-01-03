<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<link rel="stylesheet" href="./resources/css/userjoin_css/join_step3.css">
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>

</head>
<body>
<%@ include file="../../header.jsp"%>
	<hr/>
	
	<div class="contents">
			<h2>JOIN US</h2>
			<div class="member">
				<div class="join">
					<div class="complete">
						<div class="tit">VITAMIN <span>가입이 완료</span>되었습니다</div>
						
						<ul class="btnbox">
							<li><button type="submit" class="btn-m-red" onclick="javascript:location.href='./login.do'"><span>로그인</span></button></li>
							<li><button type="button" class="btn-m-line" onclick="javascript:location.href='./homepage.do'"><span>메인으로</span></button></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
					
	
	
	
	
<%@ include file="../../footer.jsp"%>	
</body>
</html>