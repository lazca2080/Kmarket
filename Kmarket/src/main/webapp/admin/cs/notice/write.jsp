<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/admin/_header.jsp"></jsp:include>
<script>
$(function(){
	$('select[name=type]').change(function(){
		cateType1 = $('select[name=type]').val();
		console.log("cateType1: "+cateType1);
		$('input[name=cateType1]').val($(this).val());
	});
	$('select[name=cateType2]').change(function(){
		cateType2 = $('select[name=cateType2]').val();
		console.log("cateType2: "+cateType2);
		$('input[name=cateType2]').val($(this).val());
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
	                    <h3>공지사항 보기</h3>
	                    <p>
	                        HOME > 고객센터 >
	                        <strong>공지사항</strong>
	                    </p>
	                </nav>
	                <section class="write">
						<article>
	                        <form action="/Kmarket/admin/cs/notice/write.do" method="post">
	                        <input type="text" name="uid" value="${sessUser.uid}"/>	
	                        <input type="text" name="cate" value="${cate}"/>	<!-- 이후 hidden으로 수정 예정 -->
	                       	<input type="text" name="cateType1" />		<!-- 이후 hidden으로 수정 예정 -->	
                     		<input type="text" name="cateType2" /> 		<!-- 이후 hidden으로 수정 예정 -->	
	                            <table>
	                                <tbody>
	                                    <tr>
	                                        <td>문의유형</td>
	                                        <td>
	                                            <select name="type">
	                                            	<option>1차 유형 선택</option>
	                                            	<option>고객서비스</option>
	                                            	<option>안전거래</option>
	                                            	<option>위해상품</option>
	                                            	<option>이벤트당첨</option>
	                                            </select>
    											<select name="cateType2">
    												<option>2차 유형 선택</option>
    												<option>공지</option>
    												<option>안내</option>
    												<option>점검</option>
    												<option>주의</option>
    												<option>발표</option>
    												<option>위해상품정보</option>
    											</select>
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
	                                <a href="/Kmarket/admin/cs/notice/list.do" class="btnList">취소하기</a>
	                                <input type="submit" class="btnSubmit" value="등록하기">
	                            </div>
	                        </form>
	                    </article>
	                </section>
                </div>
            </section>
        </main>
<jsp:include page="/admin/_footer.jsp"></jsp:include>