<%@ page  contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/Kmarket/cs/qna/selectOption.js"></script>
<jsp:include page="../_header.jsp"></jsp:include>
        <section id="cs">
            <div class="qna">
                <nav>
                    <div>
                        <p>
                            홈
                            <span>></spans>
                            문의하기
                        </p>
                    </div>
                </nav>
                <section class="write">
                    <aside>
                        <h2>문의하기</h2>
                        <ul>
                            <li class="on">
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1=회원">회원</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1=쿠폰/이벤트">쿠폰/이벤트</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1='주문/결제'">주문/결제</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1='배송'">배송</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1='취소/반품/교환'">취소/반품/교환</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1='여행/숙박/항공'">여행/숙박/항공</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1='안전거래'">안전거래</a>
                            </li>
                        </ul>
                    </aside>
                    <article>
                        <form action="/Kmarket//cs/qna/write.do" method="post" enctype="multipart/form-data">
                        <input type="text" name="uid" value="${sessUser.uid}"/>
                        <input type="text" name="cate" value="${cate}"/>
                        <input type="text" name="cateType1" value="${cateType1}">
                        <input type="text" name="cateType2" value="${cateType2}">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>문의유형</td>
                                        <td>
                                            <select name="type"></select>
    										<select name="cateType2"></select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>문의제목</td>
                                        <td>
                                            <input type="text" name="title" placeholder="제목을 입력하세요."/>
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
                                <a href="/Kmarket/cs/qna/list.do?cate=${cate}" class="btnList">취소하기</a>
                                <input type="submit" class="btnSubmit" value="등록하기"/>
                            </div>
                        </form>
                    </article>
                </section>
            </div>
        </section>
  <jsp:include page="../_footer.jsp"></jsp:include>