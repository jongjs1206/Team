<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="./resources/css/userjoin_css/userDelete.css">
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<script src="resources/js/userDelete.js"></script>
</head>
<body>
<%@ include file="../../header.jsp"%>
   <hr/>
   
<div class="contents">
         <h2>회원 탈퇴</h2>
         <div class="member">
            <div class="join">
            	<form name="deleteform" action="/userDelete.do" method="post">
            		<fieldset id="deleteform">
            			<ul class="form-box">
                        <li>
                           <p class="tit">아이디</p>
                           <p class="form">
                           	<input type="text" id="u_id" name="u_id" value='${userDelete.u_id}' readonly="readonly"/>
                           </p>
                        </li>
                        <li>
                           <p class="tit">비밀번호</p>
                           <p class="form">
                              <!-- <span class="info">6-20자:영문,숫자,특수문자조합</span> -->
                              <input type="password" name="u_pass" class=" placeholder" placeholder="비밀번호 확인" title="비밀번호를 입력하세요" autocomplete='new-password'>
                           </p>
                        </li>
                        <li>
                           <p class="tit">이름</p>
                           <p class="form">
                              <input type="text" name="u_name" title="이름을 입력하세요" value="${userDelete.u_name}" readonly="readonly"/>
                           </p>
                        </li>
                       </ul>
                       
                       <ul class="btnbox">
                           <li><button type="submit" class="btn-m-black" id="updateComplete">
                                 <span>탈퇴</span>
                              </button></li>
                           <li><button type="button" class="btn-m-line"
                                 onclick="javascript:location.href='./mypage.do'">
                                 <span>취소</span>
                              </button>
                           </li>
                        </ul>

		<%-- <form name="deleteform" action="/userDelete.do" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="u_id">아이디</label> <input
					class="form-control" type="text" id="u_id" name="u_id"
					value="${userUpdate.u_id}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드</label> <input
					class="form-control" type="password" id="u_pass" name="u_pass" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">성명</label> <input
					class="form-control" type="text" id="userName" name="userName"
					value="${userUpdate.u_name}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form> --%>
		<div>
			<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
		</div>
<!-- 	</section> -->

                       </fieldset>
                       
                        </form>
            </div><!-- //join1 -->
         </div><!-- //member -->
      </div><!-- //contents -->
   
<%@ include file="../../footer.jsp"%>
</body>
</html>