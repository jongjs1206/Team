<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변하기</title>
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
</head>
<body>
	<%@ include file="../../header.jsp"%><hr />
	
	
<h3 font-family: 'Noto-R' align="center">고객센터</h3>
	<!-- 1. 폼태그에 속성 추가  -->					<!-- 파일업로딩 enctype -->>
			<form action="replyGogaeg.do" method="post" enctype="multipart/form-data"> 
			
			<table align="center" border="" cellpadding="0" cellspacing="0">
				<!-- 2. 각 항목에  name 맞추기 -->
				<tr>
					<td bgcolor=" #ff7d9e" width="70">제목</td>
					<td align="left"><input type="text" name="gb_title" /></td>
				</tr>
				
				<tr>
					<td bgcolor=" #ff7d9e">내용</td>
					<td align="left"><textarea cols="40" rows="10" name="gb_content"></textarea></td>
				</tr>
				<!-- 추가항목 시작 -->
				<tr>
					<td bgcolor=" #ff7d9e">이메일</td>
					<td align="left"><input type="text" name="gb_email" /></td>
				</tr>
		
				<tr>
					<td bgcolor=" #ff7d9e" width="70">파일추가</td><td align="left">
					<input type="file" name="file" maxlength="60" size="40"></td>
				</tr>
					</table>
				<!-- 추가항목 끝 -->
				<input type='submit' value='작성'>
				<input type='reset' value='취소'>
		</form>



	</hr><%@ include file="../../footer.jsp"%>

</body>
</html>