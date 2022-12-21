<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../_header.jsp"></jsp:include>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Kmarket/product/js/zipcode.js"></script>
<script>
	$(function(){
		
		$('input[class=addPoint]').click(function(){
			
			// 현재 uid가 가지고있는 point값 가져오기 // 259번째 줄 input hidden 추가
			let currentPoint = $('input[name=currentPoint]').val();
			
			// 할인 받을 point값 가져오기
			let point = $('input[name=point]').val();
			
			// 현재 가지고 있는 point보다 높게 입력시 alert, return;
			if(parseInt(point) > parseInt(currentPoint)){
				alert('가지고 계신 포인트 보다 많습니다.');
				return;
			}else if(parseInt(point) <= 5000){
				alert('5000점 이상부터 사용 가능합니다.');
				return;
			}
			
			// 최종결제 정보 포인트 할인에 가져온 point 값 집어넣기 // 140번째 줄 아래 input hidden 추가
			$('.order > form > .final > table tr:eq(4) > td:eq(1)').text(point);
			
			// input에 사용한 point값을 가져온 point 값으로 변경하기
			$('input[name=ordusedPoint]').attr('value', point);
			
			// total값 가져오기
			let total = $('input[name=ordTotPrice]').val();
			
			// total에서 할인받은 point값 빼기
			let finalTotal = parseInt(total)-parseInt(point);
			
			// form으로 보낼 total값 변경
			$('input[name=ordTotPrice]').attr('value', finalTotal);
			
			// 최종결제 정보 전체주문금액 변경
			$('.order > form > .final > table tr:eq(5) > td:eq(1)').text(finalTotal);
		});
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
            <section class="order">
                <nav>
                    <h1>주문결제</h1>
                    <p>
                        HOME > 
                        <span>장바구니</span>
                         > 
                        <strong>주문결제</strong>
                    </p>
                </nav>
                <!-- form 전송시 데이터가 필요해서 input hidden을 과하게 집어넣음... -->
                <form action="/Kmarket/product/complete.do" method="post">
                	<input type="hidden" name="uid" value="${sessUser.uid}">
					<input type="hidden" name="ordCount" value="${vo.count}">
					<input type="hidden" name="ordPrice" value="${vo.price}">
					<input type="hidden" name="ordDiscount" value="${vo.discount}">
					<input type="hidden" name="ordDelivery" value="${vo.delivery}">
					<input type="hidden" name="ordsavePoint" value="${vo.point}">
					<input type="hidden" name="ordusedPoint" value="0">
					<input type="hidden" name="ordTotPrice" value="${vo.total}">
                    <table border="0">
                        <tr>
                            <th>상품명</th>
                            <th>총수량</th>
                            <th>판매가</th>
                            <th>할인</th>
                            <th>배송비</th>
                            <th>소계</th>
                        </tr>
                        <c:choose>
                        <c:when test="${prod eq null}">
                        <tr class="empty">
                            <td colspan="7">장바구니에 상품이 없습니다.</td>
                        </tr>
                        </c:when>
                        <c:otherwise>
                        <c:forEach var="cart" items="${prod}">
                        <tr class="${cart.cartNo}">
                            <td><article>
                                <a href="#">
                                    <img src="/home/prodImg/${cart.thumb1}" alt="1">
                                </a>
                                <div>
                                    <h2><a href="/Kmarket/product/view.do?prodNo=${cart.prodNo}">${cart.prodName}</a></h2>
                                    <p>${cart.descript}</p>
                                </div>
                            </article></td>
                            <td>${cart.count}</td>
                            <td>${cart.price}</td>
                            <td>${cart.discount}%</td>
                            <td>${cart.delivery}</td>
                            <td>${cart.total}</td>
                        </tr>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                    </table>
                    <div class="final">
                        <h2>최종결제 정보</h2>
                        <table>
                            <tr>
                                <td>총</td>
                                <td>${vo.count} 건</td>
                            </tr>
                            <tr>
                                <td>상품금액</td>
                                <td>${vo.price}</td>
                            </tr>
                            <tr>
                                <td>할인금액</td>
                                <td>${vo.discount}</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td class="point">${vo.delivery}</td>
                            </tr>
                            <tr>
                                <td>포인트 할인</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>전체주문금액</td>
                                <td>${vo.total}</td>
                            </tr>
                        </table>
                        <input type="submit" value="결제하기">
                    </div>
                    <!-- 배송정보 -->
                    <article class="delivery">
                        <h1>배송정보</h1>
                        <table>
                            <tr>
                                <td>주문자</td>
                                <td><input type="text" name="orderer"></td>
                            </tr>
                            <tr>
                                <td>휴대폰</td>
                                <td>
                                    <input type="text" name="hp">
                                    <span>- 포함 입력</span>
                                </td>
                            </tr>
                            <tr>
                                <td>우편번호</td>
                                <td>
                                    <input type="text" name="zip" id="zip" readonly="readonly">
                                    <button type="button" onclick="zipcode()">우편번호 찾기</button>
                                </td>
                            </tr>
                            <tr>
                                <td>기본주소</td>
                                <td>
                                    <input type="text" name="addr1" id="addr1">
                                </td>
                            </tr>
                            <tr>
                                <td>상세주소</td>
                                <td><input type="text" name="addr2" id="addr2"></td>
                            </tr>
                        </table>
                    </article>
                    <!-- 할인정보 -->
                    <article class="discount">
                        <h1>할인정보</h1>
                        <div>
                            <p>
                                현재 포인트 : 
                                <span>${sessUser.point}</span>점
                            </p>

                            <label>
                            	<input type="hidden" name="currentPoint" value="${sessUser.point}">
                                <input type="text" name="point">점
                                <input type="button" class="addPoint" value="적용">
                            </label>
                            <span>포인트 5,000점 이상이면 현금처럼 사용 가능합니다.</span>
                        </div>
                    </article>
                    <!-- 결제방법 -->
                    <article class="payment">
                        <h1>결제방법</h1>
                        <div>
                            <span>신용카드</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="type1">신용카드 결제
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="type2">체크카드 결제
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>계좌이체</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="type3">실시간 계좌이체
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="type4">무통장 입금
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>기타</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="type4">휴대폰 결제
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="type5">카카오페이
                                    <img src="../img/ico_kakaopay.gif" alt="카카오페이">
                                </label>
                            </p>
                        </div>
                    </article>
                    <!-- 경고 -->
                    <article class="alert">
                        <ul>
                            <li><span>케이마켓의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 케이마켓 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.
                            </span></li>
                            <li><span>케이마켓 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008 입니다.
                            </span></li>
                            <li><span>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의 업무자료>인허가업무안내>전자금융업등록현황에서 확인하실수 있습니다.
                            </span></li>
                        </ul>
                    </article>
                </form>
            </section>
        </main>
<jsp:include page="../_footer.jsp"></jsp:include>