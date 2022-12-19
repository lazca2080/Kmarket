<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/admin/_header.jsp"></jsp:include>
<!DOCTYPE html>
        <main>
            <aside>
                 <!-- Global Navigation Bar -->
                <ul id="gnb">
                    <li>
                        <a href="#"><i class="fa fa-cogs" aria-hidden="true"></i>환경설정</a>
                        <ol>
                            <li><a href="#">기본환경설정</a></li>
                            <li><a href="#">배너관리</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-store" aria-hidden="true"></i>상점관리</a>
                        <ol>
                            <li><a href="#">판매자현황</a></li>
                            <li><a href="#">재고관리</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-users" aria-hidden="true"></i>회원관리</a>
                        <ol>
                            <li><a href="#">회원현황</a></li>
                            <li><a href="#">포인트관리</a></li>
                            <li><a href="#">비회원관리</a></li>
                            <li><a href="#">접속자집계</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-box-open" aria-hidden="true"></i>상품관리</a>
                        <ol>
                            <li><a href="#">상품현황</a></li>
                            <li><a href="#">상품등록</a></li>
                            <li><a href="#">재고관리</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-credit-card" aria-hidden="true"></i>주문관리</a>
                        <ol>
                            <li><a href="#">주문현황</a></li>
                            <li><a href="#">매출현황</a></li>
                            <li><a href="#">결제관리</a></li>
                            <li><a href="#">배송관리</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>고객센터</a>
                        <ol>
                            <li><a href="/Kmarket/admin/cs/notice/list.do">공지사항</a></li>
                            <li><a href="/Kmarket/admin/cs/faq/list.do">자주묻는 질문</a></li>
                            <li><a href="/Kmarket/admin/cs/qna/list.do">문의하기</a></li>
                        </ol>
                    </li>
                </ul>
            </aside>
            <section id="cs">
            	<div class="qna">
	                <nav>
	                    <h3>자주묻는질문 보기</h3>
	                    <p>
	                        HOME > 고객센터 >
	                        <strong>자주묻는질문</strong>
	                    </p>
	                </nav>
	                <section class="write">
						<article>
							<table>
							    <tbody>
							        <tr>
							            <td>유형</td>
							            <td>회원 - 가입</td>
							        </tr>
							        <tr>
							            <td>제목</td>
							            <td>개인 회원과 법인 회원에 차이가 있나요?</td>
							        </tr>
							        <tr>
							            <td>내용</td>
							            <td>개인회원은 본인인증, 법인회원은 사업자 등록번호를 기준으로 사업자 인증 후 가입 가능합니다.개인회원은 본인인증, 법인회원은 사업자 등록번호를 기준으로 사업자 인증 후 가입 가능합니다.개인회원은 본인인증, 법인회원은 사업자 등록번호를 기준으로 사업자 인증 후 가입 가능합니다.style 수정하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</td>
							        </tr>
							        <tr>
							        	<td>답변</td>
							        	<td>
							        		<textarea name="content"></textarea>
							        	</td>
							        </tr>
							    </tbody>
							</table>
							 <div>
							    <input type="button" value="삭제">
							    <input type="button" value="답변등록">
							    <input type="button" value="목록">
							</div>
						</article>
	                </section>
                </div>
            </section>
        </main>
<jsp:include page="/admin/_footer.jsp"></jsp:include>