<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<link rel="stylesheet" href="resources/css/insertGogaeg.css">
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>

</head>
<body>
	<%@ include file="../../header.jsp"%><hr />
<h2 font-family: 'Noto-R' align="center">고객센터</h2>
	<!-- 1. 폼태그에 속성 추가  -->					<!-- 파일업로딩 enctype -->>
			<form action="saveBoard.do" method="post" enctype="multipart/form-data"> 
			
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
				<tr >
					<td colspan="2" ><input align="center"  type="submit" value=" 새글 등록 " /></td>
				</tr>
		
		</form>

	</hr><%@ include file="../../footer.jsp"%>
</body>
</html>