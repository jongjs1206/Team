<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/images/etc/favicon.png">
<title>VITAMIN - 장바구니</title>
<link rel="stylesheet" href="resources/css/css_basket/basket.css">
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
</head>
<body>
	<%@ include file="../../header.jsp"%>
	<hr />
	<c:choose>
		<c:when test="${sessionScope.anumber eq null}">
			<div id="contents">
		<div class="b_path"></div>
		<div class="b_title1">
			<h2>장바구니</h2>
		</div>

		<div class="orderListArea ec-base-table typeList gBorder">
			<div class="b_title3">
				<h3>일반상품 (0)</h3>
			</div>

			<table border="1" summary="" class="b_table1">
				<caption>개별배송</caption>
				<colgroup>
					<col style="width: 27px">
					<col style="width: 92px">
					<col style="width: auto">
					<col style="width: 98px">
					<col style="width: 75px">
					<col style="width: 98px">
					<col style="width: 98px">
					<col style="width: 85px">
					<col style="width: 98px">
					<col style="width: 110px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><input style='display:none' type="checkbox"
							onclick="Basket.setCheckBasketList('basket_product_normal_type_individual', this);"></th>
						<th scope="col">이미지</th>
						<th scope="col">상품정보</th>
						<th scope="col">판매가</th>
						<th scope="col">수량</th>
						
						<th scope="col">배송비</th>
						<th scope="col">합계</th>
						
					</tr>
				</thead>
				<tfoot class="right">
					
				</tfoot>
				
			</table>

			
		</div>

		

		<div class="b_gBorder_total">
			<table border="1" summary="">
				<caption>총 주문금액</caption>
				<colgroup>
					<col style="width: 17%;">
					<col style="width: 17%;" class="displaynone">
					<col style="width: 19%;">
					<col style="width: 17%;" class="displaynone">
					<col style="width: auto;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><strong>총 상품금액</strong></th>
						<th scope="col" class="displaynone"><strong>총 부가세</strong></th>
						<th scope="col"><strong>총 배송비</strong></th>
						<th scope="col" id="total_benefit_price_title_area"
							class="displaynone"><strong>총 할인금액</strong> <a href="#none"
							class="btnNormal"
							onclick="OrderLayer.onDiv('order_layer_benefit', event);">내역보기</a>
						</th>
						<th scope="col"><strong>결제예정금액</strong></th>
					</tr>
				</thead>
				<tbody class="center">
					<tr>
						<td><div class="box txt16">
								<strong><span class="txt23"><fmt:formatNumber value="${price}" pattern="#,###" /></span>원</strong> <span
									class="txt14 displaynone"></span>
							</div></td>
						<td class="displaynone"><div class="box txt16">
								<strong><span class="txt23"></span>원</strong> <span
									class="txt14 displaynone"></span>
							</div></td>
						<td>
							<div class="box shipping txt16">
								<strong class="txt23">+ </strong><strong><span
									id="total_delv_price_front" class="txt23"><fmt:formatNumber value="${count*3000}" pattern="#,###" /></span>원</strong> <span
									class="txt14 displaynone"></span>
								<div class="shippingArea displaynone">
									(<span></span>
									<div class="shippingFee">
										<a href="#none" class="btnNormal" id="">자세히</a>)
										<div class="ec-base-tooltip" style="display: none;">
											<h3>배송비할인</h3>
											<div class="content">
												<h4></h4>
												<table border="1" summary="">
													<caption>배송비 할인 이벤트 정보</caption>
													<tbody>
														<tr>
															<th scope="row">혜택</th>
															<td><strong class="txtEm"></strong>
																<p></p></td>
														</tr>
														<tr class="displaynone">
															<th scope="row">기간</th>
															<td><strong class="txtEm"></strong>
																<p></p></td>
														</tr>
														<tr class="displaynone">
															<th scope="row">대상</th>
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>
											<a href="#none" class="btnClose"><img
												src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif"
												alt="닫기"></a> <span class="edge"></span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td id="total_benefit_price_area" class="displaynone"><div
								class="box txt16">
								<strong class="txt23">- </strong><strong><span
									id="total_product_discount_price_front" class="txt23"><fmt:formatNumber value="" pattern="#,###" /></span>원</strong>
								<span class="txt14 displaynone"><span
									id="total_product_discount_price_back"></span></span>
							</div></td>
						<td><div class="box txtEm txt16" style="font-size: 30px;">
								<strong class="txt23">= </strong><strong><span
									id="total_order_price_front" class="txt23"></span><fmt:formatNumber value="${count*3000+price}" pattern="#,###" />원</strong> <span
									class="txt14 displaynone"><span
									id="total_order_price_back"></span></span>
							</div></td>
					</tr>
				</tbody>
			</table>

			<a href="#none" class="close"
				onclick="OrderLayer.offDiv('order_layer_benefit');"><img
				src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif"
				alt="닫기"></a>
		</div>

		<div class="b_xans-order-totalorder_justify">
			<a href="#none"
				link-order="/order/orderform.html?basket_type=all_buy"
				link-login="/member/login.html" class="b_tatalorder_button">전체상품주문</a>
			
			<span class="gRight"> <a href="goods.do?menu=헬스용품&page=1" class="btnNormalFix sizeM">쇼핑계속하기</a>
			</span>
			<!-- 네이버 체크아웃 구매 버튼  -->
			<div id="NaverChk_Button"></div>
		</div>







	</div>
	<!--  end of contents-->
		</c:when>
		<c:otherwise>
			<div id="contents">
		<div class="b_path"></div>
		<div class="b_title1">
			<h2>장바구니</h2>
		</div>
			<c:set var='count' value='0'></c:set>
					<c:forEach var='opt' items="${sessionScope.opcount}">
			<c:set var='count' value='${count+1}'></c:set>
					</c:forEach>
		<div class="orderListArea ec-base-table typeList gBorder">
			<div class="b_title3">
				<h3>일반상품 (${count})</h3>
			</div>

			<table border="1" summary="" class="b_table1">
				<caption>개별배송</caption>
				<colgroup>
					<col style="width: 27px">
					<col style="width: 92px">
					<col style="width: auto">
					<col style="width: 98px">
					<col style="width: 75px">
					<col style="width: 98px">
					<col style="width: 98px">
					<col style="width: 85px">
					<col style="width: 98px">
					<col style="width: 110px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><input style='display:none' type="checkbox"
							onclick="Basket.setCheckBasketList('basket_product_normal_type_individual', this);"></th>
						<th scope="col">이미지</th>
						<th scope="col">상품정보</th>
						<th scope="col">판매가</th>
						<th scope="col">수량</th>
						
						<th scope="col">배송비</th>
						<th scope="col">합계</th>
						
					</tr>
				</thead>
				<tfoot class="right">
					
				</tfoot>
				<c:set var='count' value='0'></c:set>
				<c:set var='price' value='0'></c:set>
				<tbody class="xans-element- xans-order xans-order-list center">
					<c:forEach var='opt' items="${sessionScope.opcount}">
					<tr class="b_xans-record">
					
						<td><input style='display:none' type="checkbox" id="basket_chk_id_0"
							name="basket_product_normal_type_individual"></td>
						<td class="thumb gClearLine"><a
							href=""><img style='width: 100px; height: 100px;'
								src="resources/admin/product/mainimages/${sessionScope.anumber[count].p_mainimage}"
								></a></td>
						<td class="left gClearLine"><strong class="name"><a
								href="/product/아이핏펀-아령-덤벨-세트-고무-재질-22kg-50kg/354/category/52/"
								class="ec-product-name">${sessionScope.anumber[count].p_name}</a></strong>
							<ul class="xans-element- xans-order xans-order-optionall option">
								<c:if test="${sessionScope.option[count].po_optionname ne null}">
								<li class="xans-record-">[옵션: ${sessionScope.option[count].po_optionname} (+${sessionScope.option[count].po_addprice})]
								</li>
								</c:if>
							</ul></td>
						<td class="right">
							<div id="b_product_price" class="">
								<strong style='position: relative; right: 20px;'><fmt:formatNumber value="${sessionScope.option[count].po_addprice+sessionScope.anumber[count].p_sellprice}" pattern="#,###" /></strong>
								<p class="displaynone"></p>
							</div>
						</td>
						<td><span class=""> <span style='position: relative; left: 20px;' class="ec-base-qty">${sessionScope.ap_count[count]}
						</span> </td>
						
						
						<td rowspan="1" class="">
							<p class="">
								3,000원<span class="displaynone"><br></span><br>
							</p>
						</td>
						<td class="right"><strong><span
								id="sum_price_front0"><fmt:formatNumber value="${(sessionScope.option[count].po_addprice+sessionScope.anumber[count].p_sellprice)*sessionScope.ap_count[count]+3000}" pattern="#,###" /></span>원</strong>
							<div class="displaynone"></div></td>
						
					</tr>
					<c:set var='price' value='${price+(sessionScope.option[count].po_addprice+sessionScope.anumber[count].p_sellprice)*sessionScope.ap_count[count]}'></c:set>
					<c:set var='count' value='${count+1}'></c:set>
					</c:forEach>
				</tbody>
			</table>

			<div class="b_order-empty">
				<p>장바구니가 비어 있습니다.</p>
			</div>
		</div>

		<div class="b_basketpriceinfoguide  ">
			<a href="basketdelete.do" class="btnNormal">장바구니비우기</a>
		</div>


		<div class="b_gBorder_total">
			<table border="1" summary="">
				<caption>총 주문금액</caption>
				<colgroup>
					<col style="width: 17%;">
					<col style="width: 17%;" class="displaynone">
					<col style="width: 19%;">
					<col style="width: 17%;" class="displaynone">
					<col style="width: auto;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><strong>총 상품금액</strong></th>
						<th scope="col" class="displaynone"><strong>총 부가세</strong></th>
						<th scope="col"><strong>총 배송비</strong></th>
						<th scope="col" id="total_benefit_price_title_area"
							class="displaynone"><strong>총 할인금액</strong> <a href="#none"
							class="btnNormal"
							onclick="OrderLayer.onDiv('order_layer_benefit', event);">내역보기</a>
						</th>
						<th scope="col"><strong>결제예정금액</strong></th>
					</tr>
				</thead>
				<tbody class="center">
					<tr>
						<td><div class="box txt16">
								<strong><span class="txt23"><fmt:formatNumber value="${price}" pattern="#,###" /></span>원</strong> <span
									class="txt14 displaynone"></span>
							</div></td>
						<td class="displaynone"><div class="box txt16">
								<strong><span class="txt23"></span>원</strong> <span
									class="txt14 displaynone"></span>
							</div></td>
						<td>
							<div class="box shipping txt16">
								<strong class="txt23">+ </strong><strong><span
									id="total_delv_price_front" class="txt23"><fmt:formatNumber value="${count*3000}" pattern="#,###" /></span>원</strong> <span
									class="txt14 displaynone"></span>
								<div class="shippingArea displaynone">
									(<span></span>
									<div class="shippingFee">
										<a href="#none" class="btnNormal" id="">자세히</a>)
										<div class="ec-base-tooltip" style="display: none;">
											<h3>배송비할인</h3>
											<div class="content">
												<h4></h4>
												<table border="1" summary="">
													<caption>배송비 할인 이벤트 정보</caption>
													<tbody>
														<tr>
															<th scope="row">혜택</th>
															<td><strong class="txtEm"></strong>
																<p></p></td>
														</tr>
														<tr class="displaynone">
															<th scope="row">기간</th>
															<td><strong class="txtEm"></strong>
																<p></p></td>
														</tr>
														<tr class="displaynone">
															<th scope="row">대상</th>
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>
											<a href="#none" class="btnClose"><img
												src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif"
												alt="닫기"></a> <span class="edge"></span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td id="total_benefit_price_area" class="displaynone"><div
								class="box txt16">
								<strong class="txt23">- </strong><strong><span
									id="total_product_discount_price_front" class="txt23"><fmt:formatNumber value="" pattern="#,###" /></span>원</strong>
								<span class="txt14 displaynone"><span
									id="total_product_discount_price_back"></span></span>
							</div></td>
						<td><div class="box txtEm txt16" style="font-size: 30px;">
								<strong class="txt23">= </strong><strong><span
									id="total_order_price_front" class="txt23"></span><fmt:formatNumber value="${count*3000+price}" pattern="#,###" />원</strong> <span
									class="txt14 displaynone"><span
									id="total_order_price_back"></span></span>
							</div></td>
					</tr>
				</tbody>
			</table>

			<a href="#none" class="close"
				onclick="OrderLayer.offDiv('order_layer_benefit');"><img
				src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif"
				alt="닫기"></a>
		</div>

		<div class="b_xans-order-totalorder_justify">
		
				<a href="modelorder.do" onclick="Basket.orderAll(this)"
					link-order="/order/orderform.html?basket_type=all_buy"
					link-login="/member/login.html" class="b_tatalorder_button">전체상품주문</a>
			
						
			
			<span class="gRight"> <a href="goods.do?menu=헬스용품&page=1" class="btnNormalFix sizeM">쇼핑계속하기</a>
			</span>
			<!-- 네이버 체크아웃 구매 버튼  -->
			<div id="NaverChk_Button"></div>
		</div>







	</div>
	<!--  end of contents-->
		</c:otherwise>
	</c:choose>
	
	<%@ include file="../../footer.jsp"%>

</body>
</html>