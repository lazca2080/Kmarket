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
	                    <h3>문의하기 보기</h3>
	                    <p>
	                        HOME > 고객센터 >
	                        <strong>문의하기</strong>
	                    </p>
	                </nav>
	                <section class="write">
						<article>
	                        <form action="#">
	                            <table>
	                                <tbody>
	                                    <tr>
	                                        <td>문의유형</td>
	                                        <td>
	                                            <select name="type">
	                                                <option value="0">1차 선택</option>
						                            <option value="search1">회원</option>
						                            <option value="search1">쿠폰/이벤트</option>
						                            <option value="search1">주문/결제</option>
						                            <option value="search1">취소/반품/교환</option>
						                            <option value="search1">여행/숙박/항공</option>
						                            <option value="search1">안전거래</option>
	                                            </select>
												<select name="type">
	                                                <option value="0">2차 선택</option>
	                                                <option>jquery 구현</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>문의제목</td>
	                                        <td>
	                                            <input type="text" name="title" placeholder="제목을 입력하세요.">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>문의내용</td>
	                                        <td>
	                                            <textarea name="content" placeholder="내용을 입력하세요."></textarea>
	                                        </td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                             <div>
	                                <a href="./list.html" class="btnList">취소하기</a>
	                                <input type="submit" class="btnSubmit" value="등록하기">
	                            </div>
	                        </form>
	                    </article>
	                </section>
                </div>
            </section>
        </main>
<jsp:include page="/admin/_footer.jsp"></jsp:include>