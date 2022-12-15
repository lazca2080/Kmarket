<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./_header.jsp"></jsp:include>
        <main>
            <aside>
                <ul class="category">
                    <li>
                        <i class="fa fa-bars" aria-hidden="true"></i>${c1Name}
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-shopping-bag" aria-hidden="true"></i>브랜드패션
                            <i class="fas fa-angle-right" aria-hidden="true">
                            </i>
                        </a>
                        <ol>
                        	<c:forEach var="cate10" items="${cate10}">
                            <li>
                                <a href="/Kmarket/product/list.do?cate1=${cate10.cate1}&cate2=${cate10.cate2}">${cate10.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
					<li>
                        <a href="#">
                            <i class="fas fa-tshirt" aria-hidden="true"></i>패션·의류·뷰티
                            <i class="fas fa-angle-right" aria-hidden="true">
                            </i>
                        </a>
                        <ol>
                        	<c:forEach var="cate11" items="${cate11}">
                            <li>
                                <a href="/Kmarket/product/list.do?cate1=${cate11.cate1}&cate2=${cate11.cate2}">${cate11.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
  					<li>
                        <a href="#">
                            <i class="fas fa-baby-carriage" aria-hidden="true"></i>유아동
                            <i class="fas fa-angle-right" aria-hidden="true">
                            </i>
                        </a>
                        <ol>
                        	<c:forEach var="cate12" items="${cate12}">
                            <li>
                                <a href="/Kmarket/product/list.do?cate1=${cate12.cate1}&cate2=${cate12.cate2}">${cate12.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
					<li>
                        <a href="#">
                            <i class="fas fa-utensils" aria-hidden="true"></i>식품·생필품
                            <i class="fas fa-angle-right" aria-hidden="true">
                            </i>
                        </a>
                        <ol>
                        	<c:forEach var="cate13" items="${cate13}">
                            <li>
                                <a href="/Kmarket/product/list.do?cate1=${cate13.cate1}&cate2=${cate13.cate2}">${cate13.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
					<li>
                        <a href="#">
                            <i class="fas fa-home" aria-hidden="true"></i>홈데코·문구·취미·반려
                            <i class="fas fa-angle-right" aria-hidden="true">
                            </i>
                        </a>
                        <ol>
                        	<c:forEach var="cate14" items="${cate14}">
                            <li>
                                <a href="/Kmarket/product/list.do?cate1=${cate14.cate1}&cate2=${cate14.cate2}">${cate14.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
					<li>
                        <a href="#">
                            <i class="fas fa-tv" aria-hidden="true"></i>컴퓨터·디지털·가전
                            <i class="fas fa-angle-right" aria-hidden="true">
                            </i>
                        </a>
                        <ol>
                        	<c:forEach var="cate15" items="${cate15}">
                            <li>
                                <a href="/Kmarket/product/list.do?cate1=${cate15.cate1}&cate2=${cate15.cate2}">${cate15.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
					<li>
                        <a href="#">
                            <i class="fas fa-running" aria-hidden="true"></i>스포츠·건강·렌탈
                            <i class="fas fa-angle-right" aria-hidden="true">
                            </i>
                        </a>
                        <ol>
                        	<c:forEach var="cate16" items="${cate16}">
                            <li>
                                <a href="/Kmarket/product/list.do?cate1=${cate16.cate1}&cate2=${cate16.cate2}">${cate16.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
					<li>
                        <a href="#">
                            <i class="fas fa-car" aria-hidden="true"></i>자동차·공구
                            <i class="fas fa-angle-right" aria-hidden="true">
                            </i>
                        </a>
                        <ol>
                        	<c:forEach var="cate17" items="${cate17}">
                            <li>
                                <a href="/Kmarket/product/list.do?cate1=${cate17.cate1}&cate2=${cate17.cate2}">${cate17.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
					<li>
                        <a href="#">
                            <i class="fas fa-book" aria-hidden="true"></i>여행·도서·티켓·e쿠폰
                            <i class="fas fa-angle-right" aria-hidden="true">
                            </i>
                        </a>
                        <ol>
                        	<c:forEach var="cate18" items="${cate18}">
                            <li>
                                <a href="#">${cate18.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
                </ul>
                <article class="best">
                    <h1>
                        <i class="fas fa-crown" aria-hidden="true"></i>
                        베스트상품
                    </h1>
                    <ol>
                    	<c:forEach var="best" items="${index}" begin="0" end="4">
                        <li>
                            <a href="/Kmarket/product/view.do?cate1=${best.prodCate1}&cate2=${best.prodCate2}&prodNo=${best.prodNo}">
                                <div class="thumb">
                                    <i>1</i>
                                    <img src="/home/prodImg/${best.thumb1}" alt="item1">
                                </div>
                                <article>
	                                <h2>${best.prodName}</h2>
	                                <c:choose>
	                                <c:when test="${best.discount ne 0}">
	                                <div class="org_price">
	                                    <del>${best.price}</del>
	                                    <span>
	                                        ${best.discount}%
	                                    </span>
	                                </div>
	                                <div class="dis_price">
	                                    <ins>
	                                    	${best.sellPrice}
	                                    </ins>
	                                </div>
	                                </c:when>
	                                <c:otherwise>
									<div class="dis_price">
	                                    <ins>
	                                    	${best.sellPrice}
	                                    </ins>
	                                </div>
	                                </c:otherwise>
	                                </c:choose>
                                </article>
                            </a>
                        </li>
                        </c:forEach>
                    </ol>
                </article>
            </aside>
            <section>
                <!-- 슬라이더 영역 -->
                <section class="slider">
                    <ul>
                        <li>
                        <a href="#"
                            ><img src="/Kmarket/img/slider_item1.jpg" alt="item1"
                        /></a>
                        </li>
                        <li>
                        <a href="#"
                            ><img src="/Kmarket/img/slider_item2.jpg" alt="item2"
                        /></a>
                        </li>
                        <li>
                        <a href="#"
                            ><img src="/Kmarket/img/slider_item3.jpg" alt="item3"
                        /></a>
                        </li>
                        <li>
                        <a href="#"
                            ><img src="/Kmarket/img/slider_item4.jpg" alt="item4"
                        /></a>
                        </li>
                        <li>
                        <a href="#"
                            ><img src="/Kmarket/img/slider_item5.jpg" alt="item5"
                        /></a>
                        </li>
                    </ul>
                </section>
                <!-- 히트상품 영역 -->
                <section class="hit">
                    <h3>
                        <span>히트상품</span>
                    </h3>
                    <c:forEach var="hit" items="${index}" begin="5" end="12">
                    <article>
                        <a href="/Kmarket/product/view.do?cate1=${hit.prodCate1}&cate2=${hit.prodCate2}&prodNo=${hit.prodNo}">
                            <div class="thumb">
                                <img src="/home/prodImg/${hit.thumb1}" alt="t1">
                            </div>
                            <h2>${hit.prodName}</h2>
                            <p>${hit.descript}</p>
                            <c:choose>
                            <c:when test="${hit.discount ne 0}">
                            <div class="org_price">
                                <del>${hit.price}</del>
                                <span>
                                    ${hit.discount}%
                                </span>
                            </div>
                            <div class="dis_price">
                                <ins>
                                    ${hit.sellPrice}
                                </ins>
								<c:choose>
                                <c:when test="${hit.delivery ne 0}">
                                <span>배송비 ${hit.delivery}원</span>
                                </c:when>
                                <c:otherwise>
                                <span class="free">무료배송</span>
                                </c:otherwise>
                                </c:choose>
                            </div>
                            </c:when>
                            <c:otherwise>
							<div class="dis_price">
                                <ins>
                                    ${hit.sellPrice}
                                </ins>
								<c:choose>
                                <c:when test="${hit.delivery ne 0}">
                                <span>배송비 ${hit.delivery}원</span>
                                </c:when>
                                <c:otherwise>
                                <span class="free">무료배송</span>
                                </c:otherwise>
                                </c:choose>
                            </div>
                            </c:otherwise>
                            </c:choose>
                        </a>
                    </article>
                    </c:forEach>
                </section>
                <!-- 추천상품 영역 -->
                <section class="recommend">
                    <h3>
                        <span>추천상품</span>
                    </h3>
                    <c:forEach var="score" items="${index}" begin="13" end="20">
                    <article>
                        <a href="/Kmarket/product/view.do?cate1=${score.prodCate1}&cate2=${score.prodCate2}&prodNo=${score.prodNo}">
                            <div class="thumb">
                                <img src="/home/prodImg/${score.thumb1}" alt="t1">
                            </div>
                            <h2>${score.prodName}</h2>
                            <p>${score.descript }</p>
                            <c:choose>
                            <c:when test="${score.discount ne 0}">
                            <div class="org_price">
                                <del>${score.price}</del>
                                <span>
                                    ${score.discount}%
                                </span>
                            </div>
                            <div class="dis_price">
                                <ins>
                                    ${score.sellPrice}
                                </ins>
                                <c:choose>
                                <c:when test="${score.delivery ne 0}">
                                <span>배송비 ${score.delivery}원</span>
                                </c:when>
                                <c:otherwise>
                                <span class="free">무료배송</span>
                                </c:otherwise>
                                </c:choose>
                            </div>
							</c:when>
							<c:otherwise>
							<div class="dis_price">
                                <ins>
                                    ${score.sellPrice}
                                </ins>
                                <c:choose>
                                <c:when test="${score.delivery ne 0}">
                                <span>배송비 ${score.delivery}원</span>
                                </c:when>
                                <c:otherwise>
                                <span class="free">무료배송</span>
                                </c:otherwise>
                                </c:choose>
                            </div>
							</c:otherwise>
                            </c:choose>
                        </a>
                    </article>
                    </c:forEach>
                </section>
                <section class="new">
                    <h3>
                        <span>최신상품</span>
                    </h3>
                    <c:forEach var="newProd" items="${index}" begin="21" end="28">
                    <article>
                        <a href="/Kmarket/product/view.do?cate1=${newProd.prodCate1}&cate2=${newProd.prodCate2}&prodNo=${newProd.prodNo}">
                            <div class="thumb">
                                <img src="/home/prodImg/${newProd.thumb1}" alt="t1">
                            </div>
                            <h2>${newProd.prodName}</h2>
                            <p>${newProd.descript }</p>
							<c:choose>
                            <c:when test="${newProd.discount ne 0}">
                            <div class="org_price">
                                <del>${newProd.price}</del>
                                <span>
                                    ${newProd.discount}%
                                </span>
                            </div>
                            <div class="dis_price">
                                <ins>
                                    ${newProd.sellPrice}
                                </ins>
								<c:choose>
                                <c:when test="${newProd.delivery ne 0}">
                                <span>배송비 ${newProd.delivery}원</span>
                                </c:when>
                                <c:otherwise>
                                <span class="free">무료배송</span>
                                </c:otherwise>
                                </c:choose>
                            </div>
							</c:when>
							<c:otherwise>
							<div class="dis_price">
                                <ins>
                                    ${newProd.sellPrice}
                                </ins>
								<c:choose>
                                <c:when test="${newProd.delivery ne 0}">
                                <span>배송비 ${newProd.delivery}원</span>
                                </c:when>
                                <c:otherwise>
                                <span class="free">무료배송</span>
                                </c:otherwise>
                                </c:choose>
                            </div>
							</c:otherwise>
                            </c:choose>
                        </a>
                    </article>
                    </c:forEach>
                </section>
                <section class="discount">
                    <h3>
                        <span>할인상품</span>
                    </h3>
                    <c:forEach var="discount" items="${index}" begin="29" end="36">
                    <c:choose>
                    <c:when test="${not empty discount}">
                    <article>
                        <a href="/Kmarket/product/view.do?cate1=${discount.prodCate1}&cate2=${discount.prodCate2}&prodNo=${discount.prodNo}">
                            <div class="thumb">
                                <img src="/home/prodImg/${discount.thumb1}" alt="t1">
                            </div>
                            <h2>${discount.prodName}</h2>
                            <p>${discount.descript}</p>
                            <c:choose>
                            <c:when test="${discount.discount ne 0}">
                            <div class="org_price">
                                <del>${discount.price}</del>
                                <span>
                                    ${discount.discount}%
                                </span>
                            </div>
                            <div class="dis_price">
                                <ins>
                                    ${discount.sellPrice}
                                </ins>
								<c:choose>
                                <c:when test="${discount.delivery ne 0}">
                                <span>배송비 ${discount.delivery}원</span>
                                </c:when>
                                <c:otherwise>
                                <span class="free">무료배송</span>
                                </c:otherwise>
                                </c:choose>
                            </div>
                            </c:when>
                            <c:otherwise>
							<div class="dis_price">
                                <ins>
                                    ${discount.sellPrice}
                                </ins>
								<c:choose>
                                <c:when test="${discount.delivery ne 0}">
                                <span>배송비 ${discount.delivery}원</span>
                                </c:when>
                                <c:otherwise>
                                <span class="free">무료배송</span>
                                </c:otherwise>
                                </c:choose>
                            </div>
                            </c:otherwise>
                            </c:choose>
                        </a>
                    </article>
                    </c:when>
                    <c:otherwise>
                    등록된 상품이 없습니다.
                    </c:otherwise>
                    </c:choose>
                    </c:forEach>
                </section>
            </section>
        </main>
<jsp:include page="./_footer.jsp"></jsp:include>