<%@ page  contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/Kmarket/cs/qna/selectOption.js"></script>
<script>
$(function(){
	let cateType1 = "${cateType1}"; // 페이지의 cateType1을 가져온다. (js 코드 엄격 쌍따옴표 쓰기!)
	console.log("cateType1 : " + cateType1);
	
	$('select[name=type]').val(cateType1).prop("selected", true);	//1차 카테고리 셀렉트 박스를 cateType1과 동일한 값으로 선택시킨다.
	$('select[name=type]').attr('disabled', 'disabled');			//선택된 셀렉트 박스의 값을 고정시킨다.
	$('select[name=type]').trigger('change');						//고정된 셀렉트 박스의 값을 실행시킨 것처럼 trigger(이벤트 강제실행)한다. 

	
	$('select[name=cateType2]').change(function(){
		let cateType2 = $('select[name=cateType2] option:selected').text();
		console.log("cateType2: " + cateType2);
	});
	
	// title 확인용 콘솔 로그 창 (삭제 가능)
	$('input[name=title]').focusout(function(){
		let title = $('input[name=title]').val();
		console.log("title: " + title);
	});
	// content 확인용 콘솔 로그 창 (삭제 가능)
	$('textarea[name=content]').focusout(function(){
		let content = $('textarea[name=content]').val();
		console.log("content: " + content);
	});
	
});
</script>
<jsp:include page="../_header.jsp"></jsp:include>
        <section id="cs">
            <div class="qna">
                <nav>
                    <div>
                        <p>
                            홈
                            <span>></span>
                            문의하기
                        </p>
                    </div>
                </nav>
                <section class="write">
                    <aside>
                        <h2>문의하기</h2>
                        <ul class="list">
                            <li class="on">
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1=회원">회원</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1=쿠폰/이벤트">쿠폰/이벤트</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1=주문/결제">주문/결제</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1=배송">배송</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1=취소/반품/교환">취소/반품/교환</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1=여행/숙박/항공">여행/숙박/항공</a>
                            </li>
                            <li>
                                <a href="/Kmarket/cs/qna/list.do?cate=qna&cateType1=안전거래">안전거래</a>
                            </li>
                        </ul>
                    </aside>
                    <article>
                        <form action="/Kmarket/cs/qna/write.do" method="post">
                        <input type="text" name="uid" value="${sessUser.uid}"/>
                        <input type="text" name="cate" value="${cate}"/>
                        <input type="text" name="cateType1" value="${cateType1}"/>
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
                                            <input type="text" name="title" placeholder="제목을 입력하세요." required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>문의내용</td>
                                        <td>
                                            <textarea name="content" placeholder="내용을 입력하세요." required></textarea>
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