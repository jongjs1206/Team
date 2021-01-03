<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>고객센터 글 목록</title>
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/css/GogaegList.css">

</head>
<body>
	<%@ include file="../../header.jsp"%>
	<hr />
	<div class="contents">
		<h2 align="center">고객센터</h2>


		<h3 align="center" class="black">
			1:1 문의<span
				style="display: block; text-align: center; color: #ff7d9e; font-size: 16px; margin-top: 15px; font-family: 'Noto-R'">평균
				30분 이내 답변(휴일 상담 가능)</span>
		</h3>



		<table align="center" class="List" align="center" border="">
			<tr>

				<th bgcolor=" #ff7d9e" width="100">제목</th>
				<th bgcolor=" #ff7d9e" width="200">내용</th>
				<th bgcolor=" #ff7d9e" width="150">이메일</th>
				<th bgcolor=" #ff7d9e" width="150">등록날짜</th>

				<th bgcolor=" #ff7d9e" width="150">파일첨부</th>
			</tr>
			<c:forEach items="${gogaegList}" var="gogaeg">
				<!-- 프라퍼티이름 변경 -->
				<tr>

					<td align="left"><a href="getGogaeg.do?gb_id=${gogaeg.gb_id}">
							${gogaeg.gb_title }</a></td>
					<td>${gogaeg.gb_content }</td>
					<td>${gogaeg.gb_email }</td>
					<td>${gogaeg.gb_date }</td>
					<!-- 추가 -->
					<td><img width="70" alt=""
						src="/VITAMIN/resources/upload/${gogaeg.gb_fname}"></td>
				
					</td>
				</tr>
			</c:forEach>
		</table>

		<table align="center">
			<tbody>
				<tr>
					<td colspan="6">글쓰기를 눌러 질문해주세요.</td>
				</tr>
			</tbody>
		</table>


		<br> <a align="center" href="insertGogaeg.do" class="btn-m-line">글쓰기</a>
	</div>




	</hr>
	<%@ include file="../../footer.jsp"%>
</body>
</html>