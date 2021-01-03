<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세</title>
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/css/getGogaeg.css">
</head>
<body>
<%@ include file="../../header.jsp"%>
	<hr>

		<h1 align="center">게시글</h1>		
		<hr>
		<form action="updateGogaeg.do" method="post">
			<input name="gb_id" type="hidden" value="${gogaeg.gb_id}" />
			<table align="center" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="#ff7d9e" width="70">제목</td>
					<td align="left"><input name="gb_title" type="text"
						value="${gogaeg.gb_title }" /></td>
				</tr>
				<tr>
					<td bgcolor="#ff7d9e">내용</td>
					<td align="left"><textarea name="gb_content" cols="40" rows="10">${gogaeg.gb_content }</textarea></td>
				</tr>
				<tr>
					<td bgcolor="#ff7d9e">이메일</td>
					<td align="left">${gogaeg.gb_email }</td>
				</tr>
				<tr>
					<td bgcolor="#ff7d9e">등록일</td>
					<td align="left">${gogaeg.gb_date }</td>
				</tr>
			
				<tr>
					<td bgcolor="#ff7d9e">파일첨부</td>
					<td align="left">
					<a href='resources/upload/${gogaeg.gb_fname}'> 
			<img  width="70"  alt="" src="/VITAMIN/resources/upload/${gogaeg.gb_fname}"></td>
					</td>
					
				</tr>
			</table>
		</form>
		<hr>
		<div align="center" >
		<a  class="rok"  href="insertGogaeg.do">글등록</a>&nbsp;&nbsp;&nbsp; 
		<a class="sak" href="deleteGogaeg.do?b_id=${gogaeg.gb_id }">글삭제</a>&nbsp;&nbsp;&nbsp; 
		<a class="mok"  href="GogaegList.do">글목록</a>&nbsp;&nbsp;&nbsp; 
		<a class="dab"  href="replyGogaeg.do">답변하기</a>
		</div>
	
		<%@ include file="../../footer.jsp"%>
</body>
</html>
