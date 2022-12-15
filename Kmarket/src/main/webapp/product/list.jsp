<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"></jsp:include>
        <main id="product">
            <aside>
            	 <ul class="category">
                    <li>
                        <i class="fa fa-bars" aria-hidden="true"></i>카테고리
                    </li>
                        <li>
                        <a href="#">
                            <i class="fas fa-tshirt" aria-hidden="true"></i>패션·의류·뷰티
                            </i>
                        </a>
                        <ol>
                            <li>
                                <a href="#">남성의류</a>
                            </li>
                            <li>
                                <a href="#">여성의류</a>
                            </li>
                            <li>
                                <a href="#">잡화</a>
                            </li>
                            <li>
                                <a href="#">뷰티</a>
                            </li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-laptop" aria-hidden="true"></i>가전·디지털
                            </i>
                        </a>
                        <ol>
                            <li>
                                <a href="#">노트북/PC</a>
                            </li>
                            <li>
                                <a href="#">가전</a>
                            </li>
                            <li>
                                <a href="#">휴대폰</a>
                            </li>
                            <li>
                                <a href="#">기타</a>
                            </li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-utensils" aria-hidden="true"></i>식품·생필품
                            </i>
                        </a>
                        <ol>
                            <li>
                                <a href="#">신선식품</a>
                            </li>
                            <li>
                                <a href="#">가공식품</a>
                            </li>
                            <li>
                                <a href="#">건강식품</a>
                            </li>
                            <li>
                                <a href="#">생필품</a>
                            </li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-home" aria-hidden="true"></i>홈·문구·취미
                            </i>
                        </a>
                        <ol>
                            <li>
                                <a href="#">가구/DIY</a>
                            </li>
                            <li>
                                <a href="#">침구·커튼</a>
                            </li>
                            <li>
                                <a href="#">생활용품</a>
                            </li>
                            <li>
                                <a href="#">사무용품</a>
                            </li>
                        </ol>
                    </li>
                </ul>
            </aside>
            <section class="list">
                <nav>
                    <h1>상품목록</h1>
                    <p>
                        HOME > 
                        
                        <span>${cate1}</span>
                         > 
                        <strong>${cate2}</strong>
                    </p>
                </nav>
                <ul class="sort">
                    <li>
                        <a href="#" class="on">판매많은순</a>
                    </li>
                    <li>
                        <a href="#">낮은가격순</a>
                    </li>
                    <li>
                        <a href="#">높은가격순</a>
                    </li>
                    <li>
                        <a href="#">평점높은순</a>
                    </li>
                    <li>
                        <a href="#">후기많은순</a>
                    </li>
                    <li>
                        <a href="#">최근등록순</a>
                    </li>
                </ul>
                <table>
                	<c:forEach var="products" items="${products}">
                    <tr>
                        <td><a href="#" class="thumb">
                            <img src="/Kmarket/home/prodImg/${products.thumb1}" alt="상품이미지">
                        </a></td>
                        <td>
                            <h3 class="name">${products.prodName}</h3>
                            <a href="#" class="desc">${products.descript}</a>
                        </td>
                        <td>
                            <ul>
                                <li><ins class="dis-price">${products.sellPrice}</ins></li>
                                <li>
                                    <del class="org-price">${products.price}</del>
                                    <span class="discount">${products.discount}</span>
                                </li>
                                <c:if test="${products.delivery eq 0 }">
                                <li><span class="free-delivery">배달비무료</span></li>
                                </c:if>
                                <c:if test="${products.delivery ne 0 }">
                                <li><span>${products.delivery}원</span></li>
                                </c:if>
                            </ul>
                        </td>
                         
                        <td>
                            <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i> ${products.seller}
                            </h4>
                            <h5 class="badge power">판매자등급</h5>
                            <h6 class="rating star1">상품평</h6>
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
                        	<a href="./list.do?cate1=${cate1}&cate2=${cate2}&pg=${pageGroupEnd + 1}" class="on${currentPage == i?'current':'off'}">${i}</a>
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