<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Global site tag (gtag.js) - Google Ads: 877042459 -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=AW-877042459"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'AW-877042459');
</script>
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
<!-- <link href="./resources/css/Goods_css/goods04.css" rel="stylesheet"/> -->
<!-- <link rel="stylesheet" href="./resources/css/Goods_css/goods05.css"/>스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. -->
<!-- <link rel="stylesheet" href="./resources/css/Goods_css/goods06.css"/> -->

<!--구글애널리틱스 추적코드 201217 끝 -->
<meta name="naver-site-verification"
	content="b44727c80d39d5c699d1fd23fe6340439743617d" />
<link rel="canonical" href="http://fitmall.co.kr/category/크로스핏용품/80/" />
<link rel="alternate" href="http://m.fitmall.co.kr/category/크로스핏용품/80/" />
<meta property="og:url"
	content="http://fitmall.co.kr/category/크로스핏용품/80/" />
<meta property="og:title" content="크로스핏용품 - 크로스핏용품" />
<meta property="og:description" content="크로스핏용품" />
<meta property="og:site_name" content="피트몰" />
<meta property="og:type" content="product.group" />
<link rel="shortcut icon" href="./ico/favicon_20190807170323.ico" />
<!-- 완료 -->

<!-- 							완료  -->
<link rel="stylesheet" type="text/css"
	href="./resources/css/Goods_css/goods12.css" />
<!-- <link rel="stylesheet" type="text/css" href="./resources/css/Goods_css/goods02.css" /> -->
<style type="text/css">
</style>
<title>VITAMIN - 상품</title>
<link rel="icon" href="resources/images/etc/favicon.png">
<meta name="path_role" content="PRODUCT_LIST" />
<meta name="description" content="크로스핏용품" />
<meta name="keywords" content="크로스핏용품, 피트몰, 크로스핏용품" />
<meta name="design_html_path" content="/product/list.html" />
</head>
<script src="resources/js/vendor/jquery-3.5.1.min.js"></script>
<body>
	<%@ include file="../../header.jsp"%>
	<hr />

	<div class="menu_bg"></div>

	<hr class="layout" />
	<div id="wrap">
		<div id="container">
			<div id="contents">

				<div class="xans-element- xans-product xans-product-menupackage ">
					<div
						class="xans-element- xans-product xans-product-headcategory path ">
						<span>현재 위치</span>
						<ol>
							<li><a href="/"></a></li>
							<li class=""><a href="/category/웨이트기구/25/"></a></li>
							<li class=""><a href="/category/파워랙하프랙/70/"></a></li>
							<li class="displaynone"><a href=""></a></li>
							<li class="displaynone"><strong><a href=""></a></strong></li>
						</ol>
					</div>

					<div
						class="xans-element- xans-product xans-product-headcategory title ">
						<p class="banner"></p>
						<h2>

							<c:if test="${param.hs ne null}">
								<span>'${param.hs}'의 검색 결과 입니다.</span>
							</c:if>

							<c:choose>
								<c:when test="${param.category eq null}">
									<span>${param.menu}</span>
								</c:when>
								<c:otherwise>
									<span>${param.category}</span>
								</c:otherwise>
							</c:choose>

						</h2>
						<span class="likeButton displaynone"><button type="button">
								<strong></strong>
							</button></span>
					</div>
					<ul class="menuCategory">

						<%
							String[] health = { "아령,덤벨", "케틀벨", "푸쉬업바", "케이블머신", "밴드/로프", "웨이트볼" };
						String[] yoga = { "폼롤러", "밴드", "짐볼", "요가매트", "밸런스운동" };
						String[] dress = { "남성", "여성", "보호장비", "기타물품" };
						String[] food = { "닭가슴살", "간편한끼", "도시락/샐러드", "고구마/견과", "건강간식" };
						%>
						<c:set var="health" value="<%=health%>" />
						<c:set var="yoga" value="<%=yoga%>" />
						<c:set var="dress" value="<%=dress%>" />
						<c:set var="food" value="<%=food%>" />

						<c:choose>
							<c:when test="${param.category eq null}">
								<c:if test="${param.menu eq '헬스용품'}">
									<c:forEach var="h" items="${health}">
										<li style="display:;"
											class="xans-element- xans-product xans-product-displaycategory xans-record-"><a
											href="goods.do?menu=${param.menu}&category=${h}&page=1">${h}<span
												class="count displaynone">()</span></a></li>
									</c:forEach>
								</c:if>
								<c:if test="${param.menu eq '요가/필라테스'}">
									<c:forEach var="y" items="${yoga}">
										<li style="display:;"
											class="xans-element- xans-product xans-product-displaycategory xans-record-"><a
											href="goods.do?menu=${param.menu}&category=${y}&page=1">${y}<span
												class="count displaynone">()</span></a></li>
									</c:forEach>
								</c:if>
								<c:if test="${param.menu eq '운동복'}">
									<c:forEach var="d" items="${dress}">
										<li style="display:;"
											class="xans-element- xans-product xans-product-displaycategory xans-record-"><a
											href="goods.do?menu=${param.menu}&category=${d}&page=1">${d}<span
												class="count displaynone">()</span></a></li>
									</c:forEach>
								</c:if>
								<c:if test="${param.menu eq '건강식품'}">
									<c:forEach var="f" items="${food}">
										<li style="display:;"
											class="xans-element- xans-product xans-product-displaycategory xans-record-"><a
											href="goods.do?menu=${param.menu}&category=${f}&page=1">${f}<span
												class="count displaynone">()</span></a></li>
									</c:forEach>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${param.menu eq '헬스용품'}">
									<c:forEach var="h" items="${health}">
										<c:choose>
											<c:when test="${param.category eq h}">
												<li style="display:;"
													class="xans-element- xans-product xans-product-displaycategory selected xans-record-"><a
													href="goods.do?menu=${param.menu}&category=${h}&page=1">${h}<span
														class="count displaynone">()</span></a></li>
											</c:when>
											<c:otherwise>
												<li style="display:;"
													class="xans-element- xans-product xans-product-displaycategory xans-record-"><a
													href="goods.do?menu=${param.menu}&category=${h}">${h}<span
														class="count displaynone">()</span></a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
								<c:if test="${param.menu eq '요가/필라테스'}">
									<c:forEach var="y" items="${yoga}">
										<c:choose>
											<c:when test="${param.category eq y}">
												<li style="display:;"
													class="xans-element- xans-product xans-product-displaycategory selected xans-record-"><a
													href="goods.do?menu=${param.menu}&category=${y}&page=1">${y}<span
														class="count displaynone">()</span></a></li>
											</c:when>
											<c:otherwise>
												<li style="display:;"
													class="xans-element- xans-product xans-product-displaycategory xans-record-"><a
													href="goods.do?menu=${param.menu}&category=${y}&page=1">${y}<span
														class="count displaynone">()</span></a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
								<c:if test="${param.menu eq '운동복'}">
									<c:forEach var="d" items="${dress}">
										<c:choose>
											<c:when test="${param.category eq d}">
												<li style="display:;"
													class="xans-element- xans-product xans-product-displaycategory selected xans-record-"><a
													href="goods.do?menu=${param.menu}&category=${d}&page=1">${d}<span
														class="count displaynone">()</span></a></li>
											</c:when>
											<c:otherwise>
												<li style="display:;"
													class="xans-element- xans-product xans-product-displaycategory xans-record-"><a
													href="goods.do?menu=${param.menu}&category=${d}&page=1">${d}<span
														class="count displaynone">()</span></a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
								<c:if test="${param.menu eq '건강식품'}">
									<c:forEach var="f" items="${food}">
										<c:choose>
											<c:when test="${param.category eq f}">
												<li style="display:;"
													class="xans-element- xans-product xans-product-displaycategory selected xans-record-"><a
													href="goods.do?menu=${param.menu}&category=${f}&page=1">${f}<span
														class="count displaynone">()</span></a></li>
											</c:when>
											<c:otherwise>
												<li style="display:;"
													class="xans-element- xans-product xans-product-displaycategory xans-record-"><a
													href="goods.do?menu=${param.menu}&category=${f}&page=1">${f}<span
														class="count displaynone">()</span></a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>



				<div class="xans-element- xans-product xans-product-normalpackage ">
					<div class="xans-element- xans-product xans-product-normalmenu ">
						<div class="function">
							<p class="prdCount">${count}PRODUCTINTHISCATEGORY</p>
							<ul id="type"
								class="xans-element- xans-product xans-product-orderby">
								<c:choose>
									<c:when test="${param.category ne null}">
										<li class="xans-record-"><a
											href="goods.do?menu=${param.menu}&category=${param.category}&page=${param.page}">신상품</a></li>
										<li class="xans-record-"><a
											href="goods.do?menu=${param.menu}&category=${param.category}&search=a&page=${param.page}">상품명</a></li>
										<li class="xans-record-"><a
											href="goods.do?menu=${param.menu}&category=${param.category}&search=b&page=${param.page}">낮은가격</a></li>
										<li class="xans-record-"><a
											href="goods.do?menu=${param.menu}&category=${param.category}&search=c&page=${param.page}">높은가격</a></li>
									</c:when>
									<c:when test="${param.hs ne null}">
										<li class="xans-record-"><a
											href="goods.do?hs=${param.hs}&page=${param.page}">신상품</a></li>
										<li class="xans-record-"><a
											href="goods.do?hs=${param.hs}&search=a&page=${param.page}">상품명</a></li>
										<li class="xans-record-"><a
											href="goods.do?hs=${param.hs}&search=b&page=${param.page}">낮은가격</a></li>
										<li class="xans-record-"><a
											href="goods.do?hs=${param.hs}&search=c&page=${param.page}">높은가격</a></li>
									</c:when>
									<c:otherwise>
										<li class="xans-record-"><a
											href="goods.do?menu=${param.menu}&page=${param.page}">신상품</a></li>
										<li class="xans-record-"><a
											href="goods.do?menu=${param.menu}&search=a&page=${param.page}">상품명</a></li>
										<li class="xans-record-"><a
											href="goods.do?menu=${param.menu}&search=b&page=${param.page}">낮은가격</a></li>
										<li class="xans-record-"><a
											href="goods.do?menu=${param.menu}&search=c&page=${param.page}">높은가격</a></li>
									</c:otherwise>
								</c:choose>

							</ul>
							<span class="compare displaynone"><a href="#none"
								class="btnCompare" onclick="EC_ListAction.setProductCompare();">상품비교</a></span>
						</div>
						<fieldset class="condition displaynone">
							<legend>조건별 검색</legend>
							<p>

								<select
									class="xans-element- xans-product xans-product-firstselect FirstSelect"><option
										value="">-조건선택-</option>
									<option value="" class=""></option>
								</select> <select
									class="xans-element- xans-product xans-product-secondselect SecondSelect"><option
										value="">-조건선택-</option>
									<option value="" class=""></option>
								</select> <a href="#SelectSearch" class="btnSubmitFix">검색</a>
							</p>
						</fieldset>
					</div>
					<div
						class="xans-element- xans-product xans-product-listnormal ec-base-product">


						<ul class="prdList grid3">
							<c:choose>
								<c:when test="${param.category ne null}">
									<c:forEach items="${goodsList}" var="goods">
										<li id="anchorBoxId_391" class="xans-record-">
											<div class="thumbnail">
												<div class="prdImg">
													<div class="likeButton displaynone">
														<button type="button">
															<strong></strong>
														</button>
													</div>
													<a href="goods_detail.do?number=${goods.p_num}"><img
													 style='height: 400px;'	src="resources/admin/product/mainimages/${goods.p_mainimage}"
														;
											id="eListPrdImage391_1" /></a> <span
														class="wish"></span>
												</div>
											</div>
											<div class="description">
												<div class="timesale_box">
													<span class="saletime"></span><span class="sale_per"></span>
												</div>
												<div class="name">
													<a href="goods_detail.do?number=${goods.p_num}" class=""><span
														class="title displaynone"><span
															style="font-size: 12px; color: #555555;">상품명</span> :</span> <span
														style="font-size: 12px; color: #555555;">${goods.p_name}</span></a>
												</div>
												<ul
													class="xans-element- xans-product xans-product-listitem spec">
													<c:if test="${goods.p_content ne null}">
														<li rel="상품요약정보" class=" xans-record-"><strong
															class="title displaynone"><span
																style="font-size: 12px; color: #555555;">상품요약정보</span> :</strong>
															<span style="font-size: 12px; color: #555555;">${goods.p_content}</span></li>
													</c:if>
													<c:if test="${goods.p_discountrate ne 0}">
														<li rel="소비자가" class=" xans-record-"><strong
															class="title displaynone"><span
																style="font-size: 12px; color: #555555;">소비자가</span> :</strong> <span
															style="font-size: 12px; color: #555555; text-decoration: line-through;"><fmt:formatNumber
																	value="${goods.p_costprice}" pattern="#,###" /></span></li>
													</c:if>
													<li rel="판매가" class=" xans-record-"><strong
														class="title displaynone"><span
															style="font-size: 12px; color: #008BCC; font-weight: bold;">판매가</span>
															:</strong> <span
														style="font-size: 12px; color: #008BCC; font-weight: bold;"><fmt:formatNumber
																value="${goods.p_sellprice}" pattern="#,###" />원</span><span
														id="span_product_tax_type_text" style=""> </span></li>
												</ul>
												<div class="icon">
													<div class="promotion"></div>
													<div class="button">
														<div class="likeButton displaynone">
															<button type="button">
																<strong></strong>
															</button>
														</div>
														<div class="option"></div>
													</div>
												</div>
											</div>
										</li>

									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="list">
										<li id="anchorBoxId_391" class="xans-record-">
											<div class="thumbnail">
												<div class="prdImg">
													<div class="likeButton displaynone">
														<button type="button">
															<strong></strong>
														</button>
													</div>
													<a href='goods_detail.do?number=${list.p_num}'><img
														src="resources/admin/product/mainimages/${list.p_mainimage}"
														;
											id="eListPrdImage391_1" /></a> <span
														class="wish"></span>
												</div>
											</div>
											<div class="description">
												<div class="timesale_box">
													<span class="saletime"></span><span class="sale_per"></span>
												</div>
												<div class="name">
													<a href="goods_detail.do?number=${list.p_num}" class=""><span
														class="title displaynone"><span
															style="font-size: 12px; color: #555555;">상품명</span> :</span> <span
														style="font-size: 12px; color: #555555;">${list.p_name}</span></a>
												</div>
												<ul
													class="xans-element- xans-product xans-product-listitem spec">
													<c:if test="${list.p_content ne null}">
														<li rel="상품요약정보" class=" xans-record-"><strong
															class="title displaynone"><span
																style="font-size: 12px; color: #555555;">상품요약정보</span> :</strong>
															<span style="font-size: 12px; color: #555555;">${list.p_content}</span></li>
													</c:if>
													<c:if test="${list.p_discountrate ne 0}">
														<li rel="소비자가" class=" xans-record-"><strong
															class="title displaynone"><span
																style="font-size: 12px; color: #555555;">소비자가</span> :</strong> <span
															style="font-size: 12px; color: #555555; text-decoration: line-through;"><fmt:formatNumber
																	value="${list.p_costprice}" pattern="#,###" /></span></li>
													</c:if>
													<li rel="판매가" class=" xans-record-"><strong
														class="title displaynone"><span
															style="font-size: 12px; color: #008BCC; font-weight: bold;">판매가</span>
															:</strong> <span
														style="font-size: 12px; color: #008BCC; font-weight: bold;"><fmt:formatNumber
																value="${list.p_sellprice}" pattern="#,###" />원</span><span
														id="span_product_tax_type_text" style=""> </span></li>
												</ul>
												<div class="icon">
													<div class="promotion"></div>
													<div class="button">
														<div class="likeButton displaynone">
															<button type="button">
																<strong></strong>
															</button>
														</div>
														<div class="option"></div>
													</div>
												</div>
											</div>
										</li>

									</c:forEach>
								</c:otherwise>
							</c:choose>



						</ul>
						<div class="icon">
							<div class="promotion"></div>
							<div class="button">
								<div class="likeButton displaynone">
									<button type="button">
										<strong></strong>
									</button>
								</div>
								<div class="option"></div>
							</div>
						</div>
					</div>
					</li>
					</ul>
				</div>
			</div>

			<c:set var='p_start' value='${param.page-4}'></c:set>
			<c:set var='p_end' value='${param.page+4}'></c:set>

			<c:if test="${p_start <= 0}">
				<c:set var='p_start' value='1'></c:set>
				<c:set var='p_end' value='9'></c:set>
			</c:if>
			<c:if test="${p_end >= count/15+1}">
				<c:set var='p_start' value='${count/15-7}'></c:set>
				<%-- 				<c:set var='p_end' value=''></c:set> --%>
				<fmt:parseNumber var="p_end" integerOnly="true"
					value="${count/15+1}" />
			</c:if>
			<c:if test="${p_start <= 0}">
				<c:set var='p_start' value='1'></c:set>
				<fmt:parseNumber var="p_end" integerOnly="true"
					value="${count/15+1}" />
			</c:if>
			<c:if test='${count%15 == 0}'>
				<c:set var='p_end' value='${p_end-1}'></c:set>
			</c:if>

			<div
				class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">

				<c:choose>
					<c:when test="${param.hs ne null}">
						<c:choose>
							<c:when test="${param.search ne null}">
								<a href="goods.do?hs=${param.hs}&search=${param.search}&page=1"
									class="first"><img
									src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif"
									alt="첫 페이지" /></a>
								<c:choose>
									<c:when test="${param.page eq 1}">
										<a
											href="goods.do?hs=${param.hs}&search=${param.search}&page=1"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
											alt="이전 페이지" /></a>
									</c:when>
									<c:otherwise>
										<a
											href="goods.do?hs=${param.hs}&search=${param.search}&page=${param.page-1}"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
											alt="이전 페이지" /></a>
									</c:otherwise>
								</c:choose>
								<ol>
									<c:forEach var='temp' begin='${p_start}' end='${p_end}'>
										<c:choose>
											<c:when test="${temp eq param.page}">
												<li class="xans-record-"><a
													href="goods.do?hs=${param.hs}&search=${param.search}&page=${temp}"
													class="this">${temp}</a></li>
											</c:when>
											<c:otherwise>
												<li class="xans-record-"><a
													href="goods.do?hs=${param.hs}&search=${param.search}&page=${temp}"
													class="other">${temp}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ol>
								<c:choose>
									<c:when test="${param.page ne p_end}">
										<a href="goods.do?hs=${param.hs}&search=${param.search}&page=${param.page+1}"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
											alt="다음 페이지" /></a>
									</c:when>
									<c:otherwise>
										<a href="goods.do?hs=${param.hs}&search=${param.search}&page=${p_end}"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
											alt="다음 페이지" /></a>
									</c:otherwise>
								</c:choose>
								<a href="goods.do?hs=${param.hs}&search=${param.search}&page=${p_end}" class="last"><img
									src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif"
									alt="마지막 페이지" /></a>
							</c:when>
							<c:otherwise>
								<a href="goods.do?hs=${param.hs}&page=1" class="first"><img
									src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif"
									alt="첫 페이지" /></a>
								<c:choose>
									<c:when test="${param.page eq 1}">
										<a href="goods.do?hs=${param.hs}&page=1"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
											alt="이전 페이지" /></a>
									</c:when>
									<c:otherwise>
										<a href="goods.do?hs=${param.hs}&page=${param.page-1}"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
											alt="이전 페이지" /></a>
									</c:otherwise>
								</c:choose>
								<ol>
									<c:forEach var='temp' begin='${p_start}' end='${p_end}'>
										<c:choose>
											<c:when test="${temp eq param.page}">
												<li class="xans-record-"><a
													href="goods.do?hs=${param.hs}&page=${temp}" class="this">${temp}</a></li>
											</c:when>
											<c:otherwise>
												<li class="xans-record-"><a
													href="goods.do?hs=${param.hs}&page=${temp}"
													class="other">${temp}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ol>
								<c:choose>
									<c:when test="${param.page ne p_end}">
										<a
											href="goods.do?hs=${param.hs}&page=${param.page+1}"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
											alt="다음 페이지" /></a>
									</c:when>
									<c:otherwise>
										<a
											href="goods.do?hs=${param.hs}&page=${p_end}"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
											alt="다음 페이지" /></a>
									</c:otherwise>
								</c:choose>
								<a
									href="goods.do?hs=${param.hs}&page=${p_end}"
									class="last"><img
									src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif"
									alt="마지막 페이지" /></a>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${param.category ne null}">
								<c:choose>
									<c:when test="${param.search ne null}">

										<a
											href="goods.do?menu=${param.menu}&category=${param.category}&search=${param.search}&page=1"
											class="first"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif"
											alt="첫 페이지" /></a>
										<c:choose>
											<c:when test="${param.page eq 1}">
												<a
													href="goods.do?menu=${param.menu}&category=${param.category}&search=${param.search}&page=1"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
													alt="이전 페이지" /></a>
											</c:when>
											<c:otherwise>
												<a
													href="goods.do?menu=${param.menu}&category=${param.category}&search=${param.search}&page=${param.page-1}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
													alt="이전 페이지" /></a>
											</c:otherwise>
										</c:choose>
										<ol>

											<c:forEach var='temp' begin='${p_start}' end='${p_end}'>
												<c:choose>
													<c:when test="${temp eq param.page}">
														<li class="xans-record-"><a
															href="goods.do?menu=${param.menu}&category=${param.category}&search=${param.search}&page=${temp}"
															class="this">${temp}</a></li>
													</c:when>
													<c:otherwise>
														<li class="xans-record-"><a
															href="goods.do?menu=${param.menu}&category=${param.category}&search=${param.search}&page=${temp}"
															class="other">${temp}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</ol>
										<c:choose>
											<c:when test="${param.page ne p_end}">
												<a
													href="goods.do?menu=${param.menu}&category=${param.category}&search=${param.search}&page=${param.page+1}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
													alt="다음 페이지" /></a>
											</c:when>
											<c:otherwise>
												<a
													href="goods.do?menu=${param.menu}&category=${param.category}&search=${param.search}&page=${p_end}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
													alt="다음 페이지" /></a>
											</c:otherwise>
										</c:choose>
										<a
											href="goods.do?menu=${param.menu}&category=${param.category}&search=${param.search}&page=${p_end}"
											class="last"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif"
											alt="마지막 페이지" /></a>
									</c:when>
									<c:otherwise>
										<a
											href="goods.do?menu=${param.menu}&category=${param.category}&page=1"
											class="first"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif"
											alt="첫 페이지" /></a>
										<c:choose>
											<c:when test="${param.page eq 1}">
												<a
													href="goods.do?menu=${param.menu}&category=${param.category}&page=1"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
													alt="이전 페이지" /></a>
											</c:when>
											<c:otherwise>
												<a
													href="goods.do?menu=${param.menu}&category=${param.category}&page=${param.page-1}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
													alt="이전 페이지" /></a>
											</c:otherwise>
										</c:choose>
										<ol>
											<c:forEach var='temp' begin='${p_start}' end='${p_end}'>
												<c:choose>
													<c:when test="${temp eq param.page}">
														<li class="xans-record-"><a
															href="goods.do?menu=${param.menu}&category=${param.category}&page=${temp}"
															class="this">${temp}</a></li>
													</c:when>
													<c:otherwise>
														<li class="xans-record-"><a
															href="goods.do?menu=${param.menu}&category=${param.category}&page=${temp}"
															class="other">${temp}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</ol>
										<c:choose>
											<c:when test="${param.page ne p_end}">
												<a
													href="goods.do?menu=${param.menu}&category=${param.category}&page=${param.page+1}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
													alt="다음 페이지" /></a>
											</c:when>
											<c:otherwise>
												<a
													href="goods.do?menu=${param.menu}&category=${param.category}&page=${p_end}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
													alt="다음 페이지" /></a>
											</c:otherwise>
										</c:choose>
										<a
											href="goods.do?menu=${param.menu}&category=${param.category}&page=${p_end}"
											class="last"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif"
											alt="마지막 페이지" /></a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${param.search ne null}">
										<a
											href="goods.do?menu=${param.menu}&search=${param.search}&page=1"
											class="first"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif"
											alt="첫 페이지" /></a>
										<c:choose>
											<c:when test="${param.page eq 1}">
												<a
													href="goods.do?menu=${param.menu}&search=${param.search}&page=1"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
													alt="이전 페이지" /></a>
											</c:when>
											<c:otherwise>
												<a
													href="goods.do?menu=${param.menu}&search=${param.search}&page=${param.page-1}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
													alt="이전 페이지" /></a>
											</c:otherwise>
										</c:choose>
										<ol>
											<c:forEach var='temp' begin='${p_start}' end='${p_end}'>
												<c:choose>
													<c:when test="${temp eq param.page}">
														<li class="xans-record-"><a
															href="goods.do?menu=${param.menu}&search=${param.search}&page=${temp}"
															class="this">${temp}</a></li>
													</c:when>
													<c:otherwise>
														<li class="xans-record-"><a
															href="goods.do?menu=${param.menu}&search=${param.search}&page=${temp}"
															class="other">${temp}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</ol>
										<c:choose>
											<c:when test="${param.page ne p_end}">
												<a
													href="goods.do?menu=${param.menu}&search=${param.search}&page=${param.page+1}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
													alt="다음 페이지" /></a>
											</c:when>
											<c:otherwise>
												<a
													href="goods.do?menu=${param.menu}&search=${param.search}&page=${p_end}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
													alt="다음 페이지" /></a>
											</c:otherwise>
										</c:choose>
										<a
											href="goods.do?menu=${param.menu}&search=${param.search}&page=${p_end}"
											class="last"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif"
											alt="마지막 페이지" /></a>
									</c:when>
									<c:otherwise>
										<a href="goods.do?menu=${param.menu}&page=1" class="first"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif"
											alt="첫 페이지" /></a>
										<c:choose>
											<c:when test="${param.page eq 1}">
												<a href="goods.do?menu=${param.menu}&page=1"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
													alt="이전 페이지" /></a>
											</c:when>
											<c:otherwise>
												<a href="goods.do?menu=${param.menu}&page=${param.page-1}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
													alt="이전 페이지" /></a>
											</c:otherwise>
										</c:choose>
										<ol>
											<c:forEach var='temp' begin='${p_start}' end='${p_end}'>
												<c:choose>
													<c:when test="${temp eq param.page}">
														<li class="xans-record-"><a
															href="goods.do?menu=${param.menu}&page=${temp}"
															class="this">${temp}</a></li>
													</c:when>
													<c:otherwise>
														<li class="xans-record-"><a
															href="goods.do?menu=${param.menu}&page=${temp}"
															class="other">${temp}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</ol>
										<c:choose>
											<c:when test="${param.page ne p_end}">
												<a href="goods.do?menu=${param.menu}&page=${param.page+1}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
													alt="다음 페이지" /></a>
											</c:when>
											<c:otherwise>
												<a href="goods.do?menu=${param.menu}&page=${p_end}"><img
													src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
													alt="다음 페이지" /></a>
											</c:otherwise>
										</c:choose>
										<a href="goods.do?menu=${param.menu}&page=${p_end}"
											class="last"><img
											src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif"
											alt="마지막 페이지" /></a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>

			</div>

		</div>
		<hr class="layout" />
	</div>
	<hr class="layout" />
	<div id="quick"></div>
	</div>
	<hr class="layout" />
	<%@ include file="../../footer.jsp"%>
</body>
</html>
