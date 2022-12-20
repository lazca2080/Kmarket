<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/admin/_header.jsp"></jsp:include>
<!DOCTYPE html>
            <section id="admin-faq">
                <nav>
                    <h3>공지사항 목록</h3>
                    <p>
                        HOME > 고객센터 >
                        <strong>공지사항</strong>
                    </p>
                </nav>
                <section>
                    <div>
                        <select name="search">
                            <option value="search1">1차 선택</option>
                            <option value="search1">회원</option>
                            <option value="search1">쿠폰/이벤트</option>
                            <option value="search1">주문/결제</option>
                            <option value="search1">취소/반품/교환</option>
                            <option value="search1">여행/숙박/항공</option>
                            <option value="search1">안전거래</option>
                        </select>
						<select name="search">
                            <option value="search1">2차 선택</option>
                            <option value="search1">jquery 구현</option>
                        </select>
                    </div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="all"></th>
                            <th>번호</th>
                            <th>1차 유형</th>
                            <th>2차 유형</th>
                            <th>제목</th>
                            <th>조회</th>
                            <th>날짜</th>
                            <th>관리</th>
                        </tr>
                        <tr>
                        	<td><input type="checkbox" name="all"></td>
                            <td>100</td>
                            <td>회원</td>
                            <td>탈퇴</td>
                            <td><a href="/Kmarket/admin/cs/qna/view.do">[안내] 해외결제 사칭 문자 주의</a></td>
                            <td>120</td>
                            <td>00.00.00</td>
                            <td>
                                <a href="#">[삭제]</a><br>
                                <a href="#">[수정]</a>
                            </td>
                        </tr>
                    </table>
                    <input type="button" class="delete" value="선택삭제">
                    <a href="/Kmarket/admin/cs/qna/write.do" class="write">작성하기</a>
                    <div class="paging">
                        <span class="prev">
                            <a href="#"><&nbsp;이전</a>
                        </span>
                        <span class="num">
                            <a href="#" class="on">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">7</a>
                        </span>
                        <span class="next">
                            <a href="#">다음&nbsp;></a>
                        </span>
                    </div>
                </section>
            </section>
        </main>
<jsp:include page="/admin/_footer.jsp"></jsp:include>