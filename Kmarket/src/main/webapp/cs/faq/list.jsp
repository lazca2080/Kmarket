<%@ page  contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
     $(function(){
         $('.more').click(function(){
             e.preventDefault();
             
             /*
             let item = $(this).parent().find('> li:nth-child(n+4)');
             let isVisible = item.is(':visible');

             console.log('isVisible : ' + isVisible);

             if(isVisible){
                 item.slideUp(100);
             }else{
                 item.sildedown(100);
             }
             */
         });
     });
 </script>
            <section id="cs">
                <div class="faq">
                    <nav>
                        <div>
                            <p>
                                홈
                                <span>></span>
                                자주묻는 질문
                            </p>
                        </div>
                    </nav>
                    <section class="list">
                        <aside>
                            <h2>자주묻는 질문</h2>
                            <ul>
                            <li class="${cateType1 == '회원' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/faq/list.do?cate=qna&cateType1=회원">회원</a>
                            </li>
                            <li class="${cateType1 == '쿠폰/이벤트' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/faq/list.do?cate=qna&cateType1=쿠폰/이벤트">쿠폰/이벤트</a>
                            </li>
                            <li class="${cateType1 == '주문/결제' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/faq/list.do?cate=qna&cateType1=주문/결제">주문/결제</a>
                            </li>
                            <li class="${cateType1 == '배송' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/faq/list.do?cate=qna&cateType1=배송">배송</a>
                            </li>
                            <li class="${cateType1 == '취소/반품/교환' ? 'on' : 'off'}"> 
                                <a href="/Kmarket/cs/faq/list.do?cate=qna&cateType1=취소/반품/교환">취소/반품/교환</a>
                            </li>
                            <li class="${cateType1 == '여행/숙박/항공' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/faq/list.do?cate=qna&cateType1=여행/숙박/항공">여행/숙박/항공</a>
                            </li>
                            <li class="${cateType1 == '안전거래' ? 'on' : 'off'}">
                                <a href="/Kmarket/cs/faq/list.do?cate=qna&cateType1=안전거래">안전거래</a>
                            </li>
                        </ul>
                        </aside>
                        <article>
                            <nav>
                                <h1>${cateType1}</h1>
                                <h2>가장 자주 묻는 질문입니다.</h2>
                            </nav>
                             <c:forEach var="article" items="${articles.cate1}">
                            <div>
                                <h3>${cateType2}</h3>
                                <ul>
	                                    <li>
	                                        <a href="#">
	                                            <span>Q.</span>
	                                             ${article.title}
	                                        </a>
	                                    </li>
                                    <li class="more">
                                        <a href="#">더보기</a>
                                    </li>
                                </ul>
                            </div>
                            </c:forEach>
                           <%--  <c:forEach var="article" items="${articles}">
                            <div>
                                <h3>${cateType2}</h3>
                                <ul>
                                	<c:forEach var="article" items="${articles}">
	                                    <li>
	                                        <a href="#">
	                                            <span>Q.</span>
	                                             ${article.title}
	                                        </a>
	                                    </li>
                                    </c:forEach>
                                    
                                    <li class="more">
                                        <a href="#">더보기</a>
                                    </li>
                                </ul>
                            </div>
                            </c:forEach> --%>
                                                        
                        </article>
                    </section>
                </div>
            </section>
   <jsp:include page="../_footer.jsp"></jsp:include>