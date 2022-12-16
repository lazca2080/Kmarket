<%@ page  contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../_header.jsp"></jsp:include>
        <section id="cs">
            <div class="notice">
                <nav>
                    <div>
                        <p>
                            홈
                            <span>></span>
                            공지사항
                        </p>
                    </div>
                </nav>
                <section class="list">
                    <aside>
                        <h2>공지사항</h2>
                        <ul>
                            <li class="${cateType1 == '전체' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/notice/list.do?cate=notice">전체</a>
                            </li>
                            <li class="${cateType1 == '고객서비스' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/notice/list.do?cate=notice&cateType1=고객서비스">고객서비스</a>
                            </li>
                            <li class="${cateType1 == '안전거래' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/notice/list.do?cate=notice&cateType1=안전거래">안전거래</a>
                            </li>
                            <li class="${cateType1 == '위해상품' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/notice/list.do?cate=notice&cateType1=위해상품">위해상품</a>
                            </li>
                            <li class="${cateType1 == '이벤트당첨' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/notice/list.do?cate=notice&cateType1=이벤트당첨">이벤트당첨</a>
                            </li>
                        </ul>
                    </aside>
                    <article>
                        <nav>
                        	<c:choose>
                        		<c:when test="${cateType1 eq null}">
                        			<h1>전체</h1>
                            		<h2>공지사항 전체 내용입니다.</h2>
                        		</c:when>
                        		<c:otherwise>
                        			 <h1>${cateType1}</h1>
                            		<h2>공지사항 ${cateType1} 내용입니다.</h2>
                        		</c:otherwise>
                        	</c:choose>
                        </nav>
                        <table>
                            <tbody>
                            	<c:forEach var="article" items="${articles}">
                            		<c:choose>
                            			<c:when test="${article.cateType1 eq cateType1}">
                            				<tr id="articleList">
			                                    <td>
			                                        <a href="/Kmarket/cs/notice/view.do?cate=notice&cateType1=${article.cateType1}&no=${article.no}">[${article.cateType2}] ${article.title} //cateType1: ${article.cateType1} </a>
			                                    </td>
			                                    <td>
			                                    	<fmt:parseDate value="${article.rdate}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
					                            	<fmt:formatDate value="${time}" pattern="yy.MM.dd"/>
			                                    </td>
	                                		</tr>
                            			</c:when>
                            			<c:when test="${cateType1 eq null}">	<!-- null이면 안 됨 다른 조건식 생각해야 함 -->
                            				<tr>
                            					<td>
                            						<a>전체보기 조건 식 실행됨</a>
                            					</td>
                            				</tr>
                            			</c:when>
                            		</c:choose>
                            	</c:forEach>
                            	<%-- <c:forEach var="article" items="${articles}">
                            		<c:if test="${article.cateType1 eq cateType1}">
                            			<tr id="articleList">
		                                    <td>
		                                        <a href="/Kmarket/cs/notice/view.do?cate=notice&cateType1=${article.cateType1}&no=${article.no}">[${article.cateType2}] ${article.title} //cateType1: ${article.cateType1} </a>
		                                    </td>
		                                    <td>
		                                    	<fmt:parseDate value="${article.rdate}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
				                            	<fmt:formatDate value="${time}" pattern="yy.MM.dd"/>
		                                    </td>
	                                	</tr>
                            		</c:if>
                            	</c:forEach>  --%>
	                            <%-- <c:forEach var="article" items="${articles}">
	                               <tr id="articleList">
	                                    <td>
	                                        <a href="/Kmarket/cs/notice/view.do?cate=notice&cateType1=${article.cateType1}&no=${article.no}">[${article.cateType2}] ${article.title} //cateType1: ${article.cateType1} </a>
	                                    </td>
	                                    <td>
	                                    	<fmt:parseDate value="${article.rdate}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
			                            	<fmt:formatDate value="${time}" pattern="yy.MM.dd"/>
	                                    </td>
	                                </tr>
	                            </c:forEach>  --%>
                            </tbody>
                        </table>
                        <div class="page">
	                        <c:if test="${pageGroupStart gt 1}">
	                            <a href="/Kmarket/cs/notice/list.do?pg=${pageGroupStart-1}" class="prev">이전</a>
	                        </c:if>
	                        <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
	                            <a href="/Kmarket/cs/notice/list.do?pg=${i}" class="num ${currentPage eq i? 'current':'off'}">${i}</a>
	                        </c:forEach>
	                        <c:if test="${pageGroupStart lt lastPageNum}">
	                            <a href="/Kmarket/cs/notice/list.do?pg=${pageGroupStart+1}" class="next">다음</a>
	                        </c:if>
                        </div>
                    </article>
                </section>
            </div>
        </section>
     <jsp:include page="../_footer.jsp"></jsp:include>