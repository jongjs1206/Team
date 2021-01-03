<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2{
	margin-left: 350px;
	margin-top : 100px;
}
.grade{
	margin:30px 0 100px 350px;
	width: 1140px;
}
</style>
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="icon" href="resources/images/etc/favicon.png">
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
	<%@ include file="../../header.jsp"%>
	<hr/>
	<h2>등급별 혜택</h2>
		<img class='grade' src="resources/images/etc/grade.PNG">
	<%@ include file="../../footer.jsp"%>
</body>
</html>