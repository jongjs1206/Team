<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="./resources/css/userjoin_css/userUpdate.css">
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<script src="resources/js/userUpdate.js"></script>
</head>
<body>
<%@ include file="../../header.jsp"%>
   <hr/>
   
<div class="contents">
         <h2>회원정보</h2>
         <div class="member">
            <div class="join">
               <form name="joinform" method="post" action="./userInfoChange.do" autocomplete='on'>
                  <input type='hidden' name='emailcheck' id="emailcheck" value='N'>
                  <input type='hidden' name='phonecheck' id="phonecheck" value='N'>
                  <input type='hidden' name='email_agree' value='Y'>
                  <fieldset id="joinform">
                     <legend>회원정보 수정</legend>
                     <ul class="form-box">
                        <li>
                           <p class="tit">아이디</p>
                           <p class="form">
                              <input type="text" id="u_id" name="u_id" value='${userUpdate.u_id}' readonly="readonly"/>
                           </p>
                        </li>
                        <li>
                           <p class="tit">비밀번호</p>
                           <p class="form">
                              <!-- <span class="info">6-20자:영문,숫자,특수문자조합</span> -->
                              <input type="password" name="u_pass" class=" placeholder" placeholder="6-20자:영문,숫자,특수문자조합" title="비밀번호를 입력하세요" autocomplete='new-password'>
                           </p>
                        </li>
                        <li>
                           <p class="tit">비밀번호 확인</p>
                           <p class="form">
                              <!--  <span class="info">6-20자:영문,숫자,특수문자조합</span> -->
                              <input type="password" name="u_passCk" class=" placeholder" placeholder="6-20자:영문,숫자,특수문자조합" title="비밀번호를 입력하세요" autocomplete='new-password'>
                           </p>
                        </li>
                        <li>
                           <p class="tit">이름</p>
                           <p class="form">
                              <input type="text" name="u_name" title="이름을 입력하세요" value="${userUpdate.u_name}" readonly="readonly"/>
                           </p>
                        </li>
                        <li>
                           <p class="tit">휴대전화</p>
                           <ul class="form-tel">
                              <li>
                                 <select name="u_tel1">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                 </select>
                              </li>
                              <li><input type="text" maxlength="4" title="휴대전화 앞자리" name="u_tel2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" autocomplete='new-password'></li>
                              <li><input type="text" maxlength="4" title="휴대전화 뒷자리" name="u_tel3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" autocomplete='new-password'></li>
                           </ul>
                           <p class="good3" style="display:none;">등록 가능한 핸드폰번호입니다.</p>
                           <p class="alert3" style="display:none;">이미 등록된 핸드폰번호입니다.</p>
                        </li>
                        <li>
                           <p class="tit">sms수신여부</p>
                           <p class="form-agree">
                              <span class="cs-form radio">
                                 <input type="radio" name="smsAllow" id="smsY" checked value="Y">
                                 <label for="smsY">수신함</label>
                              </span>
                              <span class="cs-form radio">
                                 <input type="radio" name="smsAllow" id="smsN" value="N">
                                 <label for="smsN">수신안함</label>
                              </span>
                           </p>
                        </li>
                        <li>
                           <p class="tit">신체 정보</p>
                           <p class="form" id="size">
                              <label>키<input type="text" maxlength="3" name="u_height" title="키" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${userUpdate.u_height}"></label>
                              <label>몸무게<input type="text" maxlength="3" name="u_weight" title="몸무게" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${userUpdate.u_weight}"></label>
                           </p>
                        </li>
                        <li>
                           <p class="tit">생일</p>
                           <ul class="form-date">
                              <li>
                                 <select name="birth_year">
                                    <option value=""></option>
                                                                        <option value="2020">2020</option>
                                                                        <option value="2019">2019</option>
                                                                        <option value="2018">2018</option>
                                                                        <option value="2017">2017</option>
                                                                        <option value="2016">2016</option>
                                                                        <option value="2015">2015</option>
                                                                        <option value="2014">2014</option>
                                                                        <option value="2013">2013</option>
                                                                        <option value="2012">2012</option>
                                                                        <option value="2011">2011</option>
                                                                        <option value="2010">2010</option>
                                                                        <option value="2009">2009</option>
                                                                        <option value="2008">2008</option>
                                                                        <option value="2007">2007</option>
                                                                        <option value="2006">2006</option>
                                                                        <option value="2005">2005</option>
                                                                        <option value="2004">2004</option>
                                                                        <option value="2003">2003</option>
                                                                        <option value="2002">2002</option>
                                                                        <option value="2001">2001</option>
                                                                        <option value="2000">2000</option>
                                                                        <option value="1999">1999</option>
                                                                        <option value="1998">1998</option>
                                                                        <option value="1997">1997</option>
                                                                        <option value="1996">1996</option>
                                                                        <option value="1995">1995</option>
                                                                        <option value="1994">1994</option>
                                                                        <option value="1993">1993</option>
                                                                        <option value="1992">1992</option>
                                                                        <option value="1991">1991</option>
                                                                        <option value="1990">1990</option>
                                                                        <option value="1989">1989</option>
                                                                        <option value="1988">1988</option>
                                                                        <option value="1987">1987</option>
                                                                        <option value="1986">1986</option>
                                                                        <option value="1985">1985</option>
                                                                        <option value="1984">1984</option>
                                                                        <option value="1983">1983</option>
                                                                        <option value="1982">1982</option>
                                                                        <option value="1981">1981</option>
                                                                        <option value="1980">1980</option>
                                                                        <option value="1979">1979</option>
                                                                        <option value="1978">1978</option>
                                                                        <option value="1977">1977</option>
                                                                        <option value="1976">1976</option>
                                                                        <option value="1975">1975</option>
                                                                        <option value="1974">1974</option>
                                                                        <option value="1973">1973</option>
                                                                        <option value="1972">1972</option>
                                                                        <option value="1971">1971</option>
                                                                        <option value="1970">1970</option>
                                                                        <option value="1969">1969</option>
                                                                        <option value="1968">1968</option>
                                                                        <option value="1967">1967</option>
                                                                        <option value="1966">1966</option>
                                                                        <option value="1965">1965</option>
                                                                        <option value="1964">1964</option>
                                                                        <option value="1963">1963</option>
                                                                        <option value="1962">1962</option>
                                                                        <option value="1961">1961</option>
                                                                        <option value="1960">1960</option>
                                                                        <option value="1959">1959</option>
                                                                        <option value="1958">1958</option>
                                                                        <option value="1957">1957</option>
                                                                        <option value="1956">1956</option>
                                                                        <option value="1955">1955</option>
                                                                        <option value="1954">1954</option>
                                                                        <option value="1953">1953</option>
                                                                        <option value="1952">1952</option>
                                                                        <option value="1951">1951</option>
                                                                        <option value="1950">1950</option>
                                                                        <option value="1949">1949</option>
                                                                        <option value="1948">1948</option>
                                                                        <option value="1947">1947</option>
                                                                        <option value="1946">1946</option>
                                                                        <option value="1945">1945</option>
                                                                        <option value="1944">1944</option>
                                                                        <option value="1943">1943</option>
                                                                        <option value="1942">1942</option>
                                                                        <option value="1941">1941</option>
                                                                        <option value="1940">1940</option>
                                                                        <option value="1939">1939</option>
                                                                        <option value="1938">1938</option>
                                                                        <option value="1937">1937</option>
                                                                        <option value="1936">1936</option>
                                                                        <option value="1935">1935</option>
                                                                        <option value="1934">1934</option>
                                                                        <option value="1933">1933</option>
                                                                        <option value="1932">1932</option>
                                                                        <option value="1931">1931</option>
                                                                        <option value="1930">1930</option>
                                                                        <option value="1929">1929</option>
                                                                        <option value="1928">1928</option>
                                                                        <option value="1927">1927</option>
                                                                        <option value="1926">1926</option>
                                                                        <option value="1925">1925</option>
                                                                        <option value="1924">1924</option>
                                                                        <option value="1923">1923</option>
                                                                        <option value="1922">1922</option>
                                                                        <option value="1921">1921</option>
                                                                        <option value="1920">1920</option>
                                                                     </select>
                                 <span>년</span>
                              </li>
                              <li>
                                 <select name="birth_month">
                                    <option value=""></option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                 </select>
                                 <span>월</span>
                              </li>
                              <li>
                                 <select name="birth_day">
                                    <option value=""></option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                    <option value="24">24</option>
                                    <option value="25">25</option>
                                    <option value="26">26</option>
                                    <option value="27">27</option>
                                    <option value="28">28</option>
                                    <option value="29">29</option>
                                    <option value="30">30</option>
                                    <option value="31">31</option>
                                 </select>
                                 <span>일</span>
                              </li>
                           </ul>
                        </li>
                        
                        <li>
                           <p class="tit">이메일</p>
                           <ul class="form-email">
                              <li>
                                 <input type="text" name="join_email0" autocomplete='new-password'>
                                 <span>@</span>
                              </li>
                              <li>
                                 <input type="text" name="join_email1" autocomplete='new-password'>
                              </li>
                              <li>
                                 <select name="join_email_sel" id="join_email_sel">
                                    <option value="">선택</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="google.com">google.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="etc">직접입력</option>
                                 </select>
                              </li>
                           </ul>
                           <p class="caution caution_email" style="padding-top: 1px; padding-bottom:2px;">※영문,숫자만 입력 가능합니다.</p>
                           <p class="good2" style="display:none;">사용가능한 이메일입니다.</p>
                           <p class="alert2" style="display:none;">이미 사용중인 이메일입니다.</p>
                        </li>
<!--                         <li> -->
<!--                            <p class="tit">이메일 수신여부</p> -->
<!--                            <p class="form-agree"> -->
<!--                               <span class="cs-form radio"> -->
<!--                                  <input type="radio" name="email_agree" value="Y" id="emailY" checked> -->
<!--                                  <label for="emailY">수신함</label> -->
<!--                               </span> -->
<!--                               <span class="cs-form radio"> -->
<!--                                  <input type="radio" name="email_agree" value="N" id="emailN"> -->
<!--                                  <label for="emailN">수신안함</label> -->
<!--                               </span> -->
<!--                            </p> -->
<!--                            <p class="caution">※쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다</p> -->
<!--                         </li> -->

                     <li>
                        <p class="tit">주소</p>
                        <ul class="form-addr">
                           <li>
                           <input type="text" name="u_addr1" id="sample6_postcode" placeholder="우편번호">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
										<input type="text" name="u_addr2" id="sample6_address" placeholder="주소"><br> 
										<input type="text" name="u_addr3" id="sample6_detailAddress" placeholder="상세주소">
										<input type="text" id="sample6_extraAddress" placeholder="참고항목" type="hidden"> 
										<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script>
											function sample6_execDaumPostcode() {
												new daum.Postcode(
														{
															oncomplete : function(
																	data) {
																// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

																// 각 주소의 노출 규칙에 따라 주소를 조합한다.
																// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
																var addr = ''; // 주소 변수
																var extraAddr = ''; // 참고항목 변수

																//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
																if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																	addr = data.roadAddress;
																} else { // 사용자가 지번 주소를 선택했을 경우(J)
																	addr = data.jibunAddress;
																}

																// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
																if (data.userSelectedType === 'R') {
																	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
																	// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
																	if (data.bname !== ''
																			&& /[동|로|가]$/g
																					.test(data.bname)) {
																		extraAddr += data.bname;
																	}
																	// 건물명이 있고, 공동주택일 경우 추가한다.
																	if (data.buildingName !== ''
																			&& data.apartment === 'Y') {
																		extraAddr += (extraAddr !== '' ? ', '
																				+ data.buildingName
																				: data.buildingName);
																	}
																	// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
																	if (extraAddr !== '') {
																		extraAddr = ' ('
																				+ extraAddr
																				+ ')';
																	}
																	// 조합된 참고항목을 해당 필드에 넣는다.
																	document
																			.getElementById("sample6_extraAddress").value = extraAddr;

																} else {
																	document
																			.getElementById("sample6_extraAddress").value = '';
																}

																// 우편번호와 주소 정보를 해당 필드에 넣는다.
																document
																		.getElementById('sample6_postcode').value = data.zonecode;
																document
																		.getElementById("sample6_address").value = addr;
																// 커서를 상세주소 필드로 이동한다.
																document
																		.getElementById(
																				"sample6_detailAddress")
																		.focus();
															}
														}).open();
											}
										</script>
									</li>
                           </ul></li>
                        </ul>
                        
                        <ul class="btnbox">
                           <li><button type="submit" class="btn-m-red" id="updateComplete">
                                 <span>수정</span>
                              </button></li>
                           <li><button type="button" class="btn-m-line"
                                 onclick="javascript:location.href='./mypage.do'">
                                 <span>취소</span>
                              </button></li>
                              
                            <li><button type="button" class="btn-m-black"
                                 onclick="javascript:location.href='./userDeleteView.do'">
                                 <span>탈퇴</span>
                              </button></li>
                              
                        </ul></fieldset>
               </form>
            </div><!-- //join1 -->
         </div><!-- //member -->
      </div><!-- //contents -->

   
   
   
   
   
<%@ include file="../../footer.jsp"%>

</body>
</html>