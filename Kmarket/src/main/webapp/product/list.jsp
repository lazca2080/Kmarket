<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"></jsp:include>
<script>
	$(function(){
		
		let cate1 = ${category.c1Name};
		console.log(cate1);
		
	});
</script>
        <main id="product">
            <aside>
            	<ul class="category">
                    <li>
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-shopping-bag" aria-hidden="true"></i>브랜드패션
                            <i class="fas fa-angle-right" aria-hidden="true">
                            </i>
                        </a>
                        <ol>
                        	<c:forEach var="cate10" items="${cate.cate10}">
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
                        	<c:forEach var="cate11" items="${cate.cate11}">
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
                        	<c:forEach var="cate12" items="${cate.cate12}">
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
                        	<c:forEach var="cate13" items="${cate.cate13}">
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
                        	<c:forEach var="cate14" items="${cate.cate14}">
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
                        	<c:forEach var="cate15" items="${cate.cate15}">
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
                        	<c:forEach var="cate16" items="${cate.cate16}">
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
                        	<c:forEach var="cate17" items="${cate.cate17}">
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
                        	<c:forEach var="cate18" items="${cate.cate18}">
                            <li>
                                <a href="/Kmarket/product/list.do?cate1=${cate18.cate1}&cate2=${cate18.cate2}">${cate18.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
                </ul>
            </aside>
            <section class="list">
                <nav>
                    <h1>상품목록</h1>
                    <p>
                        HOME > 
                        <span>${category.c1Name}</span>
                         > 
                        <strong>${category.c2Name}</strong>
                    </p>
                </nav>
                <ul class="sort">
                    <li>
                        <a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=sold" class="${sort eq 'sold' ? 'on' : 'off'}">판매많은순</a>
                    </li>
                    <li>
                        <a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=ascSold" class="${sort eq 'ascSold' ? 'on' : 'off' }">낮은가격순</a>
                    </li>
                    <li>
                        <a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=descSold" class="${sort eq 'descSold' ? 'on' : 'off' }">높은가격순</a>
                    </li>
                    <li>
                        <a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=score" class="${sort eq 'score' ? 'on' : 'off' }">평점높은순</a>
                    </li>
                    <li>
                        <a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=review" class="${sort eq 'review' ? 'on' : 'off' }">후기많은순</a>
                    </li>
                    <li>
                        <a href="/Kmarket/product/list.do?cate1=${cate1}&cate2=${cate2}&sort=rdate" class="${sort eq 'rdate' ? 'on' : 'off' }">최근등록순</a>
                    </li>
                </ul>
                <table>
                	<c:forEach var="products" items="${products}">
                    <tr>
                        <td><a href="/Kmarket/product/view.do?prodNo=${products.prodNo}" class="thumb">
                            <img src="/home/prodImg/${products.thumb1}" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">${products.prodName}</h3>
                            <a href="#" class="desc">${products.descript}</a>
                        </td>
                        <td>
                            <ul>
                                <li><ins class="dis-price">${products.sellPrice}</ins></li>
                                <c:choose>
                                <c:when test="${products.discount ne 0}">
                                <li>
                                    <del class="org-price">${products.price}</del>
                                    <span class="discount">${products.discount}%</span>
                                </li>
                                </c:when>
                                </c:choose>
                                <c:if test="${products.delivery eq 0}">
                                <li><span class="free-delivery">배달비무료</span></li>
                                </c:if>
                                <c:if test="${products.delivery ne 0}">
                                <li><span>배송비 ${products.delivery}원</span></li>
                                </c:if>
                            </ul>
                        </td>
                         
                        <td>
                            <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i>${products.seller}
                            </h4>
                            <c:choose>
                            <c:when test="${products.level eq '3'}">
                            <h5 class="badge power" style="background-image: url(../img/ico_power_dealer.gif)">판매자등급</h5>
                            </c:when>
							<c:when test="${products.level eq '2'}">
                            <h5 class="badge power" style="background-image: url(../img/ico_great_seller.gif)">판매자등급</h5>
                            </c:when>
                            <c:otherwise>
                            <h5>일반 판매자</h5>
                            </c:otherwise>
                            </c:choose>
                            <c:choose>
                            <c:when test="${products.score eq '5'}">
                            <h6 class="rating star5">상품평</h6>
                            </c:when>
                            <c:when test="${products.score eq '4'}">
                            <h6 class="rating star4">상품평</h6>
                            </c:when>
							<c:when test="${products.score eq '3'}">
							<h6 class="rating star3">상품평</h6>
                            </c:when>
							<c:when test="${products.score eq '2'}">
							<h6 class="rating star2">상품평</h6>
                            </c:when>
                            <c:otherwise>
                            <h6 class="rating star1">상품평</h6>
                            </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                   </c:forEach>
                    
                </table>
                <div class="paging">
                	
                    <span class="prev">
                        <c:if test="">
                        	<a href="./list.do?cate1=${cate1}&cate2=${cate2}&pg=${pageGroupStart -1}">< 이전</a>
                    	</c:if>
                    </span>
                    
                    <span class="num">
                    	<c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                        	<a href="./list.do?cate1=${cate1}&cate2=${cate2}&pg=${i}" class="on${currentPage == i?'current':'off'}">${i}</a>
                     	</c:forEach>
                    </span>
                    <span class="next">
                    	<c:if test="${pageGroupEnd < lastPageNum}">
                        <a href="./list.do?cate1=${cate1}&cate2=${cate2}&pg=${pageGroupEnd + 1}">다음 ></a>
                        </c:if>
                    </span>
                </div>
            </section>
        </main>
<jsp:include page="../_footer.jsp"></jsp:include>