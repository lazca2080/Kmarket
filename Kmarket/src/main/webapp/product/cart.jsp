<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"></jsp:include>
<script>
	$(function() {
		$('.del').click(function() {
			
		let cartNo = $('input:checkbox:checked').val();
		let checkbox = $('input:checkbox:checked');
		
		console.log("cartNo : "+cartNo);
		
		if(cartNo == null){
			alert('선택된 상품이 없습니다.');
			return;
		}
		
		$.ajax({
			url : '/Kmarket/product/deleteCart.do',
			method : 'get',
			data : {"cartNo":cartNo},
			dataType : 'json',
			success : function(data) {
				console.log("data : "+data.result);
				if(data.result == 1){
					alert('삭제되었습니다.');
					checkbox.parent().parent().remove();
					return true;
				}else {
					alert('실패하였습니다.');
					return false;
				}
			}
			
		});
		
		
		});
			
		//alert('삭제하시겠습니까?');
			
		$(document).on('click','.chk',function(){
			if($('input[name=all]').is(':checked')){
				$('input[name=cartNo]').prop('checked', true);
			}else{
				$('input[name=cartNo]').prop('checked', false);
			}
		});
	
		let totalPrice = 0;
		let costPrice = 0;
		let totalDelivery = 0;
		let totalPoint = 0;
		let count = 0;
		let totalSellPrice = 0;
		
		$('input[name=cartNo]').change(function(){
			if($(this).prop('checked')){
				
				let price = $(this).next().val();
				costPrice += parseInt(price);
				
				let sellPrice = $(this).next().next().val();
				totalSellPrice += parseInt(sellPrice);
				
				let delivery = $(this).next().next().next().val();
				totalDelivery += parseInt(delivery);
				
				let point = $(this).next().next().next().next().val();
				totalPoint += parseInt(point);
				
				let total = $(this).next().next().next().next().next().val();
				totalPrice += parseInt(total);
				
				count += 1;
				
				console.log(costPrice);
				$('.costPrice_span').text(costPrice);
				$('.totalDelivery_span').text(totalDelivery);
				$('.totalPoint_span').text(totalPoint);
				$('.totalPrice_span').text(totalPrice);
				$('.productCount_span').text(count);
				$('.totalSale_span').text(totalSellPrice);
				
				
			}else {

				let price = $(this).next().val();
				costPrice -= parseInt(price);
				
				let sellPrice = $(this).next().next().val();
				totalSellPrice -= parseInt(sellPrice);
				
				let delivery = $(this).next().next().next().val();
				totalDelivery -= parseInt(delivery);
				
				let point = $(this).next().next().next().next().val();
				totalPoint -= parseInt(point);
				
				let total = $(this).next().next().next().next().next().val();
				totalPrice -= parseInt(total);
				
				count -= 1;
				
				console.log(costPrice);
				$('.costPrice_span').text(costPrice);
				$('.totalDelivery_span').text(totalDelivery);
				$('.totalPoint_span').text(totalPoint);
				$('.totalPrice_span').text(totalPrice);
				$('.productCount_span').text(count);
				$('.totalSale_span').text(totalSellPrice);
			}
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
                                <a href="#">${cate18.c2Name}</a>
                            </li>
                            </c:forEach>
                        </ol>
                    </li>
                </ul>
            </aside>
            <section class="cart">
                <nav>
                    <h1>장바구니</h1>
                    <p>
                        HOME > 
                        <strong>장바구니</strong>
                    </p>
                </nav>
               <form action="#">
                    <table border="0">
                        <tr>
                            <th><input type="checkbox" name="all" class="chk"></th>
                            <th>상품명</th>
                            <th>총수량</th>
                            <th>판매가</th>
                            <th>할인</th>
                            <th>포인트</th>
                            <th>배송비</th>
                            <th>소계</th>
                        </tr>
                        <tr class="empty">
                            <td colspan="7">장바구니에 상품이 없습니다.</td>
                        </tr>
                        <c:forEach var="cart" items="${cart}">
                        <tr class="${cart.cartNo}">
                            <td>
                            	<input type="checkbox" name="cartNo" id="cartNo" value="${cart.cartNo}">
                            	<input type="hidden" class="price" value="${cart.price}">
                            	<input type="hidden" class="salePrice" value="${cart.price-cart.sellPrice}">
                            	<input type="hidden" id="delivery" value="${cart.delivery}">
                            	<input type="hidden" id="point" value="${cart.point}">
                            	<input type="hidden" id="total" value="${cart.total}">
                            	
                           	</td>
                            <td><article>
                                <a href="/Kmarket/product/view.do?prodNo=${cart.prodNo}">
                                    <img src="/home/prodImg/${cart.thumb1}" alt="1">
                                </a>
                                <div>
                                    <h2><a href="#">${cart.prodName}</a></h2>
                                    <p>${cart.descript}</p>
                                </div>
                            </article></td>
                            <td>${cart.count}</td>
                            <td>${cart.price}</td>
                            <td>${cart.discount}%</td>
                            <td>${cart.point}p</td>
                            <c:if test="${cart.delivery eq 0}">
                            <td>무료배송</td>
                            </c:if>
                            <c:if test="${cart.delivery ne 0}">
                            <td>${cart.delivery}원</td>
                            </c:if>
                            <td>${cart.total}</td>
                        </tr>
                        </c:forEach>
                       
                     
                    </table>
                    <input type="button" name="del" class="del" value="선택삭제">
                    <div class="total">
                    <c:forEach var="cart" items="${cart}">
                    <input type="hidden" class="cart_price" value="${cart.price}">
                        <h2>전체합계</h2>
                        <table>
                            <tr>
                                <td>상품수</td>
                                <td class="productCount_span">0</td>
                            </tr>
                            <tr>
                                <td>상품금액</td>
                                <td class="costPrice_span">0</td>
                            </tr>
                            <tr>
                                <td>할인금액</td>
                                <td class="totalSale_span">0</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td class="totalDelivery_span">0</td>
                            </tr>
                            <tr>
                                <td>포인트</td>
                                <td class="totalPoint_span">0</td>
                            </tr>
                            <tr>
                                <td>전체주문금액</td>
                                <td class="totalPrice_span">0</td>
                            </tr>
                        </table>
                        <input type="submit" value="주문하기">
                        </c:forEach>
                    </div>
               </form>
            </section>
        </main>
<jsp:include page="../_footer.jsp"></jsp:include>