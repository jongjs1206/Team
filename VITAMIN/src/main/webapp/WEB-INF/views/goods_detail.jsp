<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Global site tag (gtag.js) - Google Ads: 877042459 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta property="og:title" content="피트몰" />
<meta property="og:type" content="website " />
<meta property="og:image" content="/images/img_kakao.jpg" />
<meta property="og:description" content="피트몰 입니다." />
<!-- PG크로스브라우징필수내용 -->
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<!-- // PG크로스브라우징필수내용 -->
<!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. -->
<link href="./resources/css/Goods_css/goods_total.css" rel="stylesheet" />
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<script src="resources/js/detail.js"></script>
<!-- <link type="text/css" href ="./resources/css/Good_detail_css/good_datail_01.css" rel="stylesheet"/> -->
<!-- <link type="text/css" href ="./resources/css/Good_detail_css/good_datail_02.css" rel="stylesheet"/> -->
<!-- <link type="text/css" rel="stylesheet" href="./resources/css/Good_detail_css/good_datail_03.css"/> -->
<!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. -->
<!-- <link rel="stylesheet" href="./resources/css/Good_detail_css/good_datail_04.css"/> -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="naver-site-verification"
	content="b44727c80d39d5c699d1fd23fe6340439743617d" />
<link rel="canonical"
	href="http://fitmall.co.kr/product/아이핏펀-아령-덤벨-세트-고무-재질-22kg-50kg/354/" />
<link rel="alternate"
	href="http://m.fitmall.co.kr/product/아이핏펀-아령-덤벨-세트-고무-재질-22kg-50kg/354/" />
<meta property="og:url"
	content="http://fitmall.co.kr/product/아이핏펀-아령-덤벨-세트-고무-재질-22kg-50kg/354/" />
<meta property="og:title" content="아이핏펀 아령 덤벨 세트 고무 재질 22kg ~ 50kg" />
<meta property="og:site_name" content="피트몰" />
<meta property="og:type" content="product" />
<meta property="og:image"
	content="http://fitmall.co.kr/web/product/big/201908/871be952dabc4d43589a83115a8aca08.jpg" />
<meta property="product:price:amount" content="88000" />
<meta property="product:price:currency" content="KRW" />
<meta property="product:sale_price:amount" content="88000" />
<meta property="product:sale_price:currency" content="KRW" />
<link rel="shortcut icon" href="/web/upload/favicon_20190807170323.ico" />

<link rel="stylesheet" type="text/css"
	href="./resources/css/Good_detail_css/good_datail_05.css" />
<!-- <link rel="stylesheet" type="text/css" href="./resources/css/Good_detail_css/good_datail_06.css" /> -->

<title>VITAMIN - 상품 - DETAIL</title>
<link rel="icon" href="resources/images/etc/favicon.png">
	<meta name="path_role" content="PRODUCT_DETAIL" />
	<meta name="keywords"
		content="아이핏펀 아령 덤벨 세트 고무 재질 22kg ~ 50kg, , 피트몰, 아령,덤벨" />
	<meta name="design_html_path" content="/product/detail.html" />
</head>
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<body>
	<%@ include file="../../header.jsp"%>
	<hr />
	<div class="quickmenu">
		<div id="nav-icon1">
			<span></span> <span></span> <span></span>
		</div>
		<div class="slide-menu">
			<div id="accordian">
				<h2>STORE GUIDE</h2>
				<ul>
					<li>
						<h3>마이쇼핑</h3>
						<ul class="xans-element- xans-myshop xans-myshop-main ">
							<li class="shopMain order"><a href="/myshop/order/list.html">주문내역
									조회</a></li>
							<li class="shopMain profile"><a href="/member/modify.html">회원
									정보</a></li>
							<li class="shopMain wishlist"><a
								href="/myshop/wish_list.html">관심 상품</a></li>
							<li class="shopMain mileage"><a
								href="/myshop/mileage/historyList.html">적립금</a></li>
							<li class="shopMain board"><a href="/myshop/board_list.html">게시물
									관리</a></li>
							<li class="shopMain address"><a
								href="/myshop/addr/list.html">배송 주소록 관리</a></li>
							<li class="shopMain likeIt displaynone"><a href="">좋아요</a></li>
							<li class="shopMain deposits displaynone"><a
								href="/myshop/deposits/historyList.html">예치금</a></li>
							<li class="shopMain consult displaynone"><a
								href="/board/consult/list.html">1:1 맞춤상담</a></li>
							<li class="shopMain coupon "><a
								href="/myshop/coupon/coupon.html">쿠폰</a></li>
						</ul>
					</li>
					<li>
						<h3>고객센터</h3>
						<ul class="xans-element- xans-layout xans-layout-boardinfo">
							<li class="xans-record-"><a
								href="/board/free/list.html?board_no=1">공지사항</a></li>
							<li class="xans-record-"><a
								href="/board/product/list.html?board_no=4">상품 사용후기</a></li>
							<li class="xans-record-"><a
								href="/board/product/list.html?board_no=6">상품 Q&A</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="RightCs">
				<div class="RightCs"></div>
				<div class="RightBank"></div>
				<div class="RightDel"></div>
				<div class="xans-element- xans-layout xans-layout-productrecent">
					<h2>
						<a href="/product/recent_view_product.html">TODAY</a>
					</h2>
					<ul>
						<li class="displaynone xans-record-"><a
							href="/product/detail.html##param##"><img src="about:blank"
								alt="" /></a></li>
						<li class="displaynone xans-record-"><a
							href="/product/detail.html##param##"><img src="about:blank"
								alt="" /></a></li>
					</ul>
					<p class="player">
						<img src="/web/upload/goodymall/kr/layout/btn_recent_prev.gif"
							alt="이전 제품" class="prev" /><img
							src="/web/upload/goodymall/kr/layout/btn_recent_next.gif"
							alt="다음 제품" class="next" />
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="menu_bg"></div>

	<hr class="layout" />
	<div id="wrap">
		<div id="container" style="right: 90px;">
			<div id="contents">
				<div
					class="xans-element- xans-product xans-product-headcategory path ">
					<span>현재 위치</span>
					<ol>
						<li><a href="/"></a></li>
						<li class=""><a href="/category/웨이트용품/26/"></a></li>
						<li class=""><a href="/category/아령덤벨/52/"></a></li>
						<li class="displaynone"><a href=""></a></li>
						<li class="displaynone"><strong><a href=""></a></strong></li>
					</ol>
				</div>

				<div class="xans-element- xans-product xans-product-detail">
					<!--
		※ 옵션 선택시 품목의 할인가로 표시됩니다.
		$use_item_sale_price = T
	-->
					<div class="detailArea ">
						<div
							class="xans-element- xans-product xans-product-image cboth imgArea ">
							<div class="keyImg move">
								<div class="thumbnail">
									<a href="" alt="P00000NQ"> <img
										style='width: 500px; height: 500px; position: relative; top: 40px;'
										src="resources/admin/product/mainimages/${view.p_mainimage}" alt=""
										class="BigImage " />
									</a>
									<div id="zoom_wrap"></div>
								</div>
							</div>
							<!-- //keyImg -->
							<div
								class="xans-element- xans-product xans-product-addimage swiper-container swiper6">
								<div class="swiper-wrapper">
									<div class="swiper-slide xans-record-">
										<img
											src="//fitmall.co.kr/web/product/small/201908/e22ef0a52da7a8c74f380ed4d2edba3b.jpg"
											class="ThumbImage" alt="" />
									</div>
								</div>
								<div class="swiper-button-next swiper-button-next6"></div>
								<div class="swiper-button-prev swiper-button-prev6"></div>
							</div>
							<!-- //swiper6 -->
						</div>
						<!-- //keyImg -->

						<div class="infoArea">
							<div class="cboth headingArea">
								<h2>${view.p_name}</h2>
								<!-- 공급사 바로가기버튼 영역 -->
								<div class="supply displaynone">
									<span></span> <a href="#none" onclick=""><img src=""
										alt="공급사 바로가기" /></a>
								</div>
								<!-- //공급사 바로가기버튼 영역 -->

								<div class="cboth icon"></div>
								<div class="cboth color displaynone"></div>
							</div>

							<form name='form'>
				
								<table border="1" summary="">
									<caption>기본 정보</caption>
									<tbody>
										
										<tr rel="판매가" class=" xans-record-">
											<th scope="row"><span
												style="font-size: 12px; color: #008BCC; font-weight: bold;">판매가</span></th>
											<td><span
												style="font-size: 12px; color: #008BCC; font-weight: bold;"><strong
													id="span_product_price_text"><fmt:formatNumber
															value="${view.p_sellprice}" pattern="#,###" />원 </strong>
										</tr>
										<tr rel="국내·해외배송" class=" xans-record-">
											<th scope="row"><span
												style="font-size: 12px; color: #555555;">국내·해외배송</span></th>
											<td><span style="font-size: 12px; color: #555555;">국내배송</span></td>
										</tr>
										<tr rel="배송방법" class=" xans-record-">
											<th scope="row"><span
												style="font-size: 12px; color: #555555;">배송방법</span></th>
											<td><span style="font-size: 12px; color: #555555;">택배</span></td>
										</tr>
										<tr rel="배송비" class=" xans-record-">
											<th scope="row"><span
												style="font-size: 12px; color: #555555;">배송비</span></th>
											<td><span style="font-size: 12px; color: #555555;"><span
													class="delv_price_B"><strong>2,500원</strong></span></span></td>
										</tr>

										<tr rel="상품코드" class=" xans-record-">
											<th scope="row"><span
												style="font-size: 12px; color: #555555;">상품코드</span></th>
											<td><span style="font-size: 12px; color: #555555;">${view.p_num}</span></td>
										</tr>
									</tbody>
								</table>
							

							
							
							<input type="hidden" name="number" value='${view.p_num}'/>
							<%int check = 0;%>
							<c:forEach var="opt" items="${option}">
								<%check = 1;%>
							</c:forEach>
							<%if(check==1){ %>
								<input type="hidden" class="pro_name" value='${view.p_name}'/>
								<input type="hidden" class="pro_price" value='${view.p_sellprice}'/>
								<c:forEach var="opt" items="${option}">
									<input type="hidden" class="opt_num" value='${opt.po_optionnum}'/>
									<input type="hidden" class="opt_name" value='${opt.po_optionname}'/>
									<input type="hidden" class="opt_price" value='${opt.po_addprice}'/>									
								</c:forEach>
							<%} %>
							<table border="1" summary=""
								class="xans-element- xans-product xans-product-option xans-record-">
								<caption>상품 옵션</caption>
								<tbody></tbody>
								<tbody
									class="xans-element- xans-product xans-product-option xans-record-">
									<tr>
								<%if(check==1){ %>
										<th scope="row">옵션</th>
										<td><select
											
											id="product_option_id1" class="ProductOption"
											>
											
											<option
													value="*" selected link_image="">- [필수] 옵션을 선택해
													주세요 -</option>
												<option value="**" disabled link_image="">-------------------</option>
												
												<c:forEach var="opt" items="${option}">
													
													<c:choose>
														<c:when test="${opt.po_optionstock eq 0}">
															<option class='option' value='${opt.po_optionnum}'disabled>${opt.po_optionname} [품절]
														</c:when>
														<c:otherwise>
															<option class="option" value='${opt.po_optionnum}'>${opt.po_optionname} (+<fmt:formatNumber
 																value="${opt.po_addprice}" pattern="#,###" />)
 														</c:otherwise>
 													</c:choose>
													</option>
												</c:forEach>
									
												</select>
										<p class="value"></p></td>
									</tr>
								</tbody>
								<tbody>
									<tr class="displaynone" id="">
										<td colspan="2" class="selectButton"><a href="#none"
											class="btnSubmit sizeS" onclick="">옵션선택</a></td>
									</tr>
								</tbody>
								<%} %>
							</table>
							<div class="guideArea">
								<p class="info ">
									(최소주문수량 1개 이상)
								</p>
							
								<span class="sizeGuide displaynone"><a href="#none"
									class="size_guide_info" product_no="354">사이즈 가이드</a></span>
							
							</div>




							
							<div id="totalProducts" class="">
								<p class="ec-base-help txtWarn txt11 displaynone">수량을
									선택해주세요.</p>
									<%if(check==1){ %>
								<p class="ec-base-help txtWarn txt11 ">위 옵션선택 박스를 선택하시면 아래에
									상품이 추가됩니다.</p>
									<% }%>
								<table border="1" summary="">
									<caption>상품 목록</caption>
									<colgroup>
										<col style="width: 284px;" />
										<col style="width: 80px;" />
										<col style="width: 110px;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">상품명</th>
											<th scope="col">상품수</th>
											<th scope="col">가격</th>
										</tr>
									</thead>
									<tbody class='option_table'>
									<%if(check==0){ %>
										<tr>
											<td><b>${view.p_name}</b></td>
											<td><span class="quantity"> <input id="quantity"
													 style="" value="1" type="text" /> <a
													><img
														src="resources/images/etc/up.gif"
														class="QuantityUp up" /></a> <a><img
														src="resources/images/etc/down.gif"
														class="QuantityDown down" /></a>
											</span></td>
												<td class="right"><span class="quantity_price">${view.p_sellprice}</span>
											</td>
										</tr>
									
										
									<%} %>
										
									</tbody>				
								</table>
							</div>
						<%if(check==0){ %>
							<div id="totalPrice" class="totalPrice">
								<strong>총 상품금액</strong>(수량) : <span class="total"><strong><em class='em'>${view.p_sellprice}</em></strong>
									(<a class='t_num'>1</a>개)</span>
								<input type='hidden' value='1' name='p_count' class='p_co'/>
							</div>
						<%}else{ %>
							<div id="totalPrice" class="totalPrice">
								<strong>총 상품금액</strong>(수량) : <span class="total"><strong><em class='em'>0</em></strong>
									(<a class='t_num'>0</a>개)</span>
									<input type='hidden' value='0' name='p_count' class='p_co'/>
							</div>
						<%} %>
							<p class="ec-base-help txt11 displaynone EC-price-warning">할인가가
								적용된 최종 결제예정금액은 주문 시 확인할 수 있습니다.</p>

							<div class="xans-element- xans-product xans-product-action ">
								<div class="ec-base-button">
									<input type='submit' class="btnstyle" value='장바구니' onclick="javascript: form.action='basketsave.do';"/>
									<input type='submit' class="btnstyle" value='바로구매' onclick="javascript: form.action='orders.do';"/>
<!-- 									<a href="#none" class="btnstyle">품절상품</a> -->
								</div>
								
								<!-- 네이버 체크아웃 구매 버튼 -->
								<div id="NaverChk_Button"></div>
								<!-- //네이버 체크아웃 구매 버튼 -->


							</div>
							</form>
							
						</div>
						<!-- //infoArea -->
					</div>
					<!-- 공급사:판매사정보 -->
					<div class="supplyInfo displaynone"></div>
					<!-- //공급사:판매사정보 -->
					<div class="eventArea displaynone ">
						<h3>
							<span>이벤트</span>
						</h3>
						<div class="event"></div>
					</div>
					<!-- //product_relation -->
				</div>

				
				
					
					
					
				</div>



			</div>
			<hr class="layout" />
		</div>
		<hr class="layout" />
		<div id="quick"></div>

	<hr class="layout" />
	
	
	<hr/>
	<c:forEach var='subimg' items="${imgresult}">
		<center>
			<img src='resources/admin/product/subimages/${subimg.i_imgpath}'>
		</center>
	</c:forEach>
	
	
	

	<pre>
	
	
	
	
	
	
	
	
	
	</pre>
	<%@ include file="../../footer.jsp"%>
</body>
</html>
