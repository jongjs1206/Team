<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VITAMIN - 주문서</title>
<link rel="icon" href="resources/images/etc/favicon.png">
<link rel="stylesheet" type="text/css" href="resources/css/ord.css">
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="resources/js/juso.js"></script>
<script src="resources/js/orders.js"></script>
</head>
<body>
	<%@ include file="../../header.jsp"%>
	<hr />
	
	<c:if test='${sessionScope.id ne null}'>
		<a style='font-size: 20px; font-weight: bold; position: absolute; top: 260px; left : 1350px;'>
		회원등급 : ${sessionScope.grade}</a>
	</c:if>
	<c:if test="${sessionScope.grade eq 'BRONZE'}">
		<c:set var='dis' value='0.01'></c:set>
	</c:if>
	<c:if test="${sessionScope.grade eq 'SILVER'}">
		<c:set var='dis' value='0.02'></c:set>
	</c:if>
	<c:if test="${sessionScope.grade eq 'GOLD'}">
		<c:set var='dis' value='0.03'></c:set>
	</c:if>
	<c:if test="${sessionScope.grade eq 'VIP'}">
		<c:set var='dis' value='0.05'></c:set>
	</c:if>
		
	
	
	<div id="container">
		<div id="contents">

			<div style="margin-top: 30px;" class="titleArea">
				<h2>주문서작성</h2>
			</div>



			<div class="orderListArea ">
				<div class="title"></div>
				<h3>국내배송상품 주문내역</h3>
				<div class="ec-base-table typeList gBorder displaynone">
					<table border="1" summary="">
						<caption>기본배송</caption>
						<colgroup>

							<col style="width: 92px">
							<col style="width: auto">
							<col style="width: 98px">
							<col style="width: 75px">
							<col style="width: 98px">
							<col style="width: 98px">
							<col style="width: 85px">
							<col style="width: 98px">
						</colgroup>
						<thead>
							<tr>

								<th scope="col">이미지</th>
								<th scope="col">상품정보</th>
								<th scope="col">판매가</th>
								<th scope="col">수량</th>
								<th scope="col">적립금</th>
								<th scope="col">배송구분</th>
								<th scope="col">배송비</th>
								<th scope="col">합계</th>
							</tr>
						</thead>
						<tfoot class="right">
							<tr>
								<td class=""></td>
								<td colspan="8"><span class="gLeft">[기본배송]</span> 상품구매금액 <strong><span
										class="displaynone"> ()</span></strong><span class="displaynone">
										+ 부가세 </span> + 배송비 <span id=""></span> <span class="displaynone">
										- 상품할인금액 <span id=""></span>
								</span> = 합계 : <strong class="txtEm gIndent10"><span id=""
										class="txt18"></span>원</strong> <span class="displaynone"></span></td>
							</tr>
						</tfoot>
					</table>
				</div>


				<div class="ec-base-table typeList gBorder ">
					<table border="1" summary="">
						<caption>개별배송</caption>
						<colgroup>

							<col style="width: 92px">
							<col style="width: auto">
							<col style="width: 98px">
							<col style="width: 75px">
							<c:if test="${sessionScope.id ne null}">
								<col style="width: 98px">
							</c:if>
							<col style="width: 98px">
							<col style="width: 85px">
							<col style="width: 98px">
						</colgroup>
						<thead>
							<tr>

								<th scope="col">이미지</th>
								<th scope="col">상품정보</th>
								<th scope="col">판매가</th>
								<th scope="col">수량</th>
								<c:if test="${sessionScope.id ne null}">
									<th scope="col">적립금</th>
								</c:if>
								<th scope="col">배송구분</th>
								<th scope="col">배송비</th>
								<th scope="col">합계</th>
							</tr>
						</thead>

						<c:set var='count' value='0'></c:set>
						<c:set var='sum' value='0'></c:set>
						<tbody
							class="xans-element- xans-order xans-order-individuallist center">
							<c:choose>
								<c:when test="${sessionScope.id ne null}">
									<c:forEach var='order' items='${order}'>
										<tr class="xans-record-">
											<td class="thumb gClearLine"><a
												href="/product/detail.html?product_no=354&amp;cate_no=26"><img
													style="width: 100px; height: 100px;"
													src="resources/admin/product/mainimages/${order.p_mainimage}"
													alt=""></a></td>
											<td class="left gClearLine"><strong class="name"><a
													class="ec-product-name">${order.p_name}</a></strong> <c:if
													test="${oroption[count] ne null}">
													<div class="option ">[옵션:
														${oroption[count].po_optionname}
														(+${oroption[count].po_addprice})]</div>
												</c:if>
												<p class="gBlank5 displaynone">무이자할부 상품</p>
												<p class="gBlank5 displaynone">유효기간 :</p></td>
											<td class="right">
												<div id="product_price_div0" class="">
													<strong><fmt:formatNumber
															value='${oroption[count].po_addprice+order.p_sellprice}'
															pattern="#,###" />원</strong>
													<p class="displaynone"></p>
												</div>

											</td>
											<c:choose>
												<c:when test="${oroption[count] ne null}">
													<td>${oropcount[count]}</td>
												</c:when>
												<c:otherwise>
													<td>${orcount[count]}</td>
												</c:otherwise>
											</c:choose>
											<fmt:parseNumber var= "res" integerOnly= "true" value= "${(3000+(oroption[count].po_addprice+order.p_sellprice)*orcount[count])*dis}" />
											<td><span id="product_mileage0" class="txtInfo"><input
													id="product_mileage_all_354_000C"
													name="product_mileage_all" value="1040" type="hidden"><img
													src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif">
													${res}원</span></td>
											<td><div class="txtInfo">
													개별배송<br>
												</div></td>
											<td rowspan="1" class=""><strong>+3,000</strong></td>
											<td class="right"><strong><span
													id="product_total_price_front0"><fmt:formatNumber
															value='${3000+(oroption[count].po_addprice+order.p_sellprice)*orcount[count]}'
															pattern="#,###" /></span>원</strong>
												<div class="displaynone"></div></td>
										</tr>
										<c:set var='sum' value='${sum+(oroption[count].po_addprice+order.p_sellprice)*orcount[count]}'></c:set>
										<c:set var='count' value='${count+1}'></c:set>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var='order' items='${order}'>
										<tr class="xans-record-">
											<td class="thumb gClearLine"><a
												href="/product/detail.html?product_no=354&amp;cate_no=26"><img
													style="width: 100px; height: 100px;"
													src="resources/admin/product/mainimages/${order.p_mainimage}"
													alt=""></a></td>
											<td class="left gClearLine"><strong class="name"><a
													class="ec-product-name">${order.p_name}</a></strong> <c:if
													test="${oroption[count] ne null}">
													<div class="option ">[옵션:
														${oroption[count].po_optionname}
														(+${oroption[count].po_addprice})]</div>
												</c:if>
												<p class="gBlank5 displaynone">무이자할부 상품</p>
												<p class="gBlank5 displaynone">유효기간 :</p></td>
											<td class="right">
												<div id="product_price_div0" class="">
													<strong><fmt:formatNumber
															value='${oroption[count].po_addprice+order.p_sellprice}'
															pattern="#,###" />원</strong>
													<p class="displaynone"></p>
												</div>

											</td>
											<c:choose>
												<c:when test="${oroption[count] ne null}">
													<td>${oropcount[count]}</td>
												</c:when>
												<c:otherwise>
													<td>${orcount[count]}</td>
												</c:otherwise>
											</c:choose>

											<td><div class="txtInfo">
													개별배송<br>
												</div></td>
											<td rowspan="1" class=""><strong>+3,000</strong></td>
											<td class="right"><strong><span
													id="product_total_price_front0"><fmt:formatNumber
															value='${3000+(oroption[count].po_addprice+order.p_sellprice)*orcount[count]}'
															pattern="#,###" /></span>원</strong>
												<div class="displaynone"></div></td>
										</tr>
										<c:set var='sum' value='${sum+(oroption[count].po_addprice+order.p_sellprice)*orcount[count]}'></c:set>
										<c:set var='count' value='${count+1}'></c:set>
									</c:forEach>
								</c:otherwise>
							</c:choose>



						</tbody>


					</table>
				</div>
			</div>

			

			<div class="ec-base-button">
				<span class="gRight"> <a
					href="javascript:window.history.back();" class="btnNormal">이전페이지</a>
				</span>
			</div>
		<form action="pay.do">
			<c:choose>
				<c:when test="${ocheck ne null}">
					<input type='hidden' name='ocheck' value='1'/>
				</c:when>
				<c:otherwise>
					<input type='hidden' name='number' value='${param.number}'/>
					<c:if test="${param.opnum1 ne null}">
						<input type='hidden' name='opnum1' value='${param.opnum1}'/>
						<input type='hidden' name='opcount1' value='${param.opcount1}'/>
					</c:if>
					<c:if test="${param.opnum2 ne null}">
						<input type='hidden' name='opnum2' value='${param.opnum2}'/>
						<input type='hidden' name='opcount2' value='${param.opcount2}'/>
					</c:if>
					<c:if test="${param.opnum3 ne null}">
						<input type='hidden' name='opnum3' value='${param.opnum3}'/>
						<input type='hidden' name='opcount3' value='${param.opcount3}'/>
					</c:if>
					<c:if test="${param.opnum4 ne null}">
						<input type='hidden' name='opnum4' value='${param.opnum4}'/>
						<input type='hidden' name='opcount4' value='${param.opcount4}'/>
					</c:if>
					<c:if test="${param.opnum5 ne null}">
						<input type='hidden' name='opnum5' value='${param.opnum5}'/>
						<input type='hidden' name='opcount5' value='${param.opcount5}'/>
					</c:if>
					
					<input type='hidden' name='p_count' value='${param.p_count}'/>
				</c:otherwise>
			</c:choose>
			<div class="orderArea">
				<div class="title">
					<h3>배송 정보</h3>
					<p class="required" align="right">
						<img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
							alt="필수"> 필수입력사항
					</p>
				</div>
				<div class="ec-base-table typeWrite">
					<table border="1" summary="">
						<caption>배송 정보 입력</caption>
						<colgroup>
							<col style="width: 139px;">
							<col style="width: auto;">
						</colgroup>
						<!-- 비회원 결제 -->
						<tbody class="displaynone ec-shop-deliverySimpleNomemberForm"
							style="display: table-row-group;">
							<tr class="ec-orderform-NoMemberPasswdRow">
								<th scope="row">주문조회 비밀번호 <img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
									alt="필수"></th>
								<td><span id="order_password_alert" class="txtWarn"></span><span
									id="order_password_msg"> (영문대소문자/숫자/특수문자 중 2가지 이상 조합,
										6자~16자)</span></td>
							</tr>
							<tr class="ec-orderform-NoMemberPasswdRow">
								<th scope="row">주문조회 비밀번호<br>확인 <img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
									alt="필수"></th>
								<td><span id="order_password_confirm_alert" class="txtWarn"></span></td>
							</tr>
						</tbody>
						<!-- 국내 배송지 정보 -->
						<tbody class="">
							<tr class="">
								<th scope="row">배송지</th>
								<td>직접 입력하여 변경할 수 있습니다.</td>
							</tr>
							<tr>
								<th scope="row">받으시는 분 <img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
									alt="필수"></th>
								<td><input id="rname" fw-filter="isFill" fw-label="수취자 성명"
									fw-msg="" class="inputTypeText" placeholder="" size="15"
									value="${sessionScope.name}" name='rname' type="text" required="required"></td>
							</tr>
							<tr>
								<c:set var = 'before' value='${fn:substringBefore(sessionScope.addr, "/") }'></c:set>
								<c:set var = 'atemp' value='${fn:substringAfter(sessionScope.addr, "/") }'></c:set>								
								<c:set var = 'middle' value='${fn:substringBefore(atemp, "/") }'></c:set>
								<c:set var = 'after' value='${fn:substringAfter(atemp, "/") }'></c:set>
								<th scope="row">주소 <img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
									alt="필수"></th>
								<td><input id="rzipcode1" fw-filter="isFill"
									fw-label="수취자 우편번호1" fw-msg="" class="inputTypeText"
									placeholder="우편번호" size="6" maxlength="6" readonly="1" name='addr1' value="${before}"
									type="text" required="required"> <input type="button"
									onclick="open_search_rzipcode1()" value="우편번호 찾기"><br>
								
									<input id="raddr1" fw-filter="isFill" fw-label="수취자 주소1"
									fw-msg="" class="inputTypeText" placeholder="기본주소" size="40" name='addr2'
									readonly="1" value="${middle}" type="text" required="required"> <span class="grid">기본주소</span><br>
									<input id="raddr2" fw-filter="" fw-label="수취자 주소2" fw-msg="" name='addr3'
									class="inputTypeText" placeholder="상세주소" size="40" value="${after}"
									type="text"> <span class="grid">나머지주소</span><span
									class="grid ">(선택입력가능)</span></td>

							</tr>

							<tr class="displaynone">
								<th scope="row">일반전화 <span class="displaynone"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
										alt="필수"></span>
								</th>
								<td></td>
							</tr>
							<tr class="">
								<th scope="row">휴대전화 <span class=""><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
										alt="필수"></span>
								</th>
								
								<td><input id="rphone2_2" " required="required"
									fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호" name='tel'
									fw-alone="N" fw-msg=""  value="${sessionScope.tel}" type="text"></td>
							</tr>
						</tbody>

					</table>
				</div>
			</div>
			<div style="margin-top: 50px;" class="title">
				<h3>결제 예정 금액</h3>
			</div>
			<div class="totalArea">
				<div class="ec-base-table typeList gBorder total">
					<table border="1" summary="">
						<caption>결제 예정 금액</caption>
						<colgroup>
							<col style="width: 33.33%">
							<col style="width: 33.33%" class="">
							<col style="width: 33.33%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><strong>상품금액</strong>
								<th scope="col" class=""><strong>배송비</strong></th>
								<th scope="col"><strong>상품 금액</strong></th>
							</tr>
						</thead>
						<tbody class="center">
							<tr>
								<td class="price"><div class="box txt16">
										<strong><span id="total_order_price_view"
											class="txt23"><fmt:formatNumber
															value='${sum}'
															pattern="#,###" /></span>원</strong> <span class="displaynone"><span

											id="total_order_price_ref_view"></span></span>
									</div></td>
								<td class="option "><div class="box txt16">
										<strong>+</strong> <strong><span
											id="total_sale_price_view" class="txt23"><fmt:formatNumber
															value='${count*3000}'
															pattern="#,###" /></span>원</strong> <span
											class="displaynone"><span
											id="total_sale_price_ref_view"></span></span>
									</div></td>
								<td><div class="box txtEm txt16">
										<strong>=</strong> <strong><span
											id="total_order_sale_price_view" class="txt23"><fmt:formatNumber
															value='${count*3000+sum}'
															pattern="#,###" /></span>원</strong>
										<span class="displaynone"><span
											id="total_order_sale_price_ref_view"></span></span>
									</div></td>
									
									<input type='hidden' name ='all' value='${count*3000+sum}'/>
									
							</tr>
						</tbody>
					</table>
				</div>
				<div class="detail">
					<c:if test="${sessionScope.id ne null }">
						<div class="ec-base-table gMerge ">
							<table border="1" summary="">
								<caption>부가결제 내역</caption>
								<colgroup>
									<col style="width: 139px">
									<col style="width: auto">
								</colgroup>
								<tbody id="mileage_use_area" class="">
									<tr>
										<th scope="row">적립금</th>
										<td>
											<p>
												<input id="input_mile" fw-filter="" fw-label="적립금" fw-msg=""
													class="inputTypeText" placeholder="" size="10" value=""
													name=mile type="number"> 원 
												<input type='button' class='t_btn'
												style='width: 70px;height: 25px; font-size: 15px;' value='전부사용'/>
													
													(총 사용가능 적립금 : <strong
													><fmt:formatNumber
															value='${sessionScope.mileage}'
															pattern="#,###" /></strong>원)
												<input type='hidden' class='mile' value='${sessionScope.mileage}'>
											</p>
										</td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<th scope="row"><strong>결제금액</strong></th>
										<td><strong id="total_addpay_price_view" class="txtWarn"></strong>원</td>
										<input type="hidden" class='all_total' value='${count*3000+sum}'/>
									</tr>
								</tbody>
							</table>
						</div>
					</c:if>
				</div>
			</div>
			<div id="ec-shop-gift_orderform"></div>
			<div style="margin-top: 50px;" class="title">
				<h3>결제수단</h3>
			</div>
			<div class="payArea">
				<div class="payment">
					

					<div class="ec-order-payment-card"
						id="ec-order-payment-directpay-card-form" style="display: none;">
						<div class="ec-base-table tableClear">
							<table border="1" summary="">

								<colgroup>
									<col style="width: 15%">
									<col style="width: auto">
								</colgroup>

							</table>
						</div>
					</div>
					<div class="ec-base-table">
						<!-- 무통장입금 -->
						<table border="1" summary="" id="payment_input_cash"
							style="display: table;">
							<caption>무통장입금</caption>
							<colgroup>
								<col style="width: 139px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">입금자명</th>
									<td>VITMIN 세계물산(주)</td>
								</tr>
								<tr>
									<th scope="row">입금은행</th>
									<td>농협 527013-56071323</td>
								</tr>
							</tbody>
						</table>
						<!-- 실시간 계좌이체 -->
						<table border="1" summary="" id="payment_input_tcash"
							style="display: none;">
							<caption>실시간 계좌이체</caption>
							<colgroup>
								<col style="width: 139px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">예금주명</th>
									<td><input id="allat_account_nm" 
										fw-filter="" fw-label="무통장 입금자명" fw-msg=""
										class="inputTypeText" placeholder="" size="26" maxlength="30"
										value="" type="text"></td>
								</tr>
								<tr>
									<th scope="row"></th>
									<td><input type="checkbox" 
										id="flagEscrowUse0" value="T">
								</tr>
							</tbody>
						</table>
						<!-- 에스크로(가상계좌) -->
						<table border="1" summary="" id="payment_input_icash"
							style="display: none;">
							<caption>에스크로(가상계좌)</caption>
							<colgroup>
								<col style="width: 139px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">에스크로</th>
									<td><input id="flagEscrowIcashUse0"
										 fw-filter="" fw-label="에스크로(구매안전)"
										fw-msg="" value="T" type="checkbox"></td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
				<div style="margin-top: 20px;margin-bottom: 70px;" class="total">
					
					<div class="ec-base-button gColumn">
						<input type="submit" id="btn_payment" class="btnSubmit sizeL" value='결제하기'
						style='font-size: 15px;'/>
					</div>

				</div>
			</div>
		</form>
		</div>
	</div>
</body>
<%@ include file="../../footer.jsp"%>
</html>