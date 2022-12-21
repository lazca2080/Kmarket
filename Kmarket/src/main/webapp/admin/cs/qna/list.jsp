<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/admin/_header.jsp"></jsp:include>
<script>
	$(function() {
		
		$('.delete').click(function() {

			let no = $('input:checkbox:checked').val();
			let checkbox = $('input:checkbox:checked');
			
			console.log("no : "+no);
			
			if(no == null){
				alert('선택된 사항이 없습니다.');
				return;
			}
			
			$.ajax({
				url : '/Kmarket/admin/cs/qna/delete.do',
				method : 'get',
				data : {"no":no},
				dataType : 'json',
				success : function(data) {
					console.log("data : "+data.result);
					if(data.result == 1){
						alert('삭제되었습니다.');
						checkbox.parent().parent().remove();
						return true;
					}else{
						alert('실패하였습니다.');
						return false;
					}
				}
			});
			
		});
		
		$('select[name=search1]').change(function() {

			let select = $(this).val();
			
			console.log("select : "+select);
			
			if(select == '10'){
				$('.choose').empty();
				
				let tags = "<option value='0'>2차 선택</option>";
				 	tags += "<option value='10'>가입</option>";
				 	tags += "<option value='11'>탈퇴</option>";
					tags += "<option value='12'>회원정보</option>";
					tags += "<option value='13'>로그인</option>";
					
				$('.choose').append(tags);
				
			}else if(select == '11'){
				$('.choose').empty();
				
				let tags = "<option value='0'>2차 선택</option>";
				 	tags += "<option value='10'>쿠폰/할인혜택</option>";
				 	tags += "<option value='11'>포인트</option>";
					tags += "<option value='12'>제휴</option>";
					tags += "<option value='13'>이벤트</option>";
					
				$('.choose').append(tags);	
				
			}else if(select == '12'){
				$('.choose').empty();
				
				let tags = "<option value='0'>2차 선택</option>";
				 	tags += "<option value='10'>상품</option>";
				 	tags += "<option value='11'>결제</option>";
					tags += "<option value='12'>구매내역</option>";
					tags += "<option value='13'>영수증/증빙</option>";
					
				$('.choose').append(tags);
			}else if(select == '13'){
$('.choose').empty();
				
				let tags = "<option value='0'>2차 선택</option>";
				 	tags += "<option value='10'>배송상태/기간</option>";
				 	tags += "<option value='11'>배송정보확인/변경</option>";
					tags += "<option value='12'>해외배송</option>";
					tags += "<option value='13'>당일배송</option>";
					tags += "<option value='13'>해외직구</option>";
					
				$('.choose').append(tags);
				
			}else if(select == '14'){
$('.choose').empty();
				
				let tags = "<option value='0'>2차 선택</option>";
				 	tags += "<option value='10'>반품신청/철회</option>";
				 	tags += "<option value='11'>반품정보확인/변경</option>";
					tags += "<option value='12'>교환AS신청/철회</option>";
					tags += "<option value='13'>교환정보확인/변경</option>";
					tags += "<option value='13'>취소신청/철회</option>";
					tags += "<option value='13'>취소확인/환불정보</option>";
					
				$('.choose').append(tags);
				
			}else if(select == '15'){
$('.choose').empty();
				
				let tags = "<option value='0'>2차 선택</option>";
				 	tags += "<option value='10'>여행/숙박</option>";
				 	tags += "<option value='11'>항공</option>";
					
				$('.choose').append(tags);
				
			}else if(select == '16'){
$('.choose').empty();
				
				let tags = "<option value='0'>2차 선택</option>";
				 	tags += "<option value='10'>서비스 이용규칙 위반</option>";
				 	tags += "<option value='11'>지식재산권침해</option>";
					tags += "<option value='12'>법령 및 정책위반 상품</option>";
					tags += "<option value='13'>게시물 정책위반</option>";
					tags += "<option value='14'>직거래/외부거래유도</option>";
					tags += "<option value='15'>표시광고</option>";
					tags += "<option value='16'>청소년 위해상품/이미지</option>";
					
				$('.choose').append(tags);
			}
			
		});
		
				$('#selectBox').change(function(){
			let selectCate1 = $('#selectBox option:selected').val();
			console.log("1차 카테고리 선택: " + selectCate1);
			
			let jsonData = {"selectCate1":selectCate1};
			
			$.ajax({
				url: '/Kmarket/admin/cs/qna/select.do', 
				method: 'get',
				data:jsonData,
				dataType:'json',
				success: function(data){
					
					$('.row').remove();

					for(let vo of data){
						let row = "<tr class='row'>";
							row + "<td></td>";
							row + "<td></td>";
							row + "<td></td>";
							row + "<td></td>";
							row + "<td></td>";
							row + "<td></td>";
							row + "<td></td>";
							row + "</tr>";
							
						$('#tb').append(row);
					}
				}
			});
		});
		
	});

</script>
<!DOCTYPE html>
            <section id="admin-faq">
                <nav>
                    <h3>문의하기 목록</h3>
                    <p>
                        HOME > 고객센터 >
                        <strong>공지사항</strong>
                    </p>
                </nav>
                <section>
                    <div>
                        <select name="search" id="selectBox">
                            <option value="0">1차 선택</option>
                            <option value="10">회원</option>
                            <option value="11">쿠폰/이벤트</option>
                            <option value="12">주문/결제</option>
                            <option value="13">배송</option>
                            <option value="14">취소/반품/교환</option>
                            <option value="15">여행/숙박/항공</option>
                            <option value="16">안전거래</option>
                        </select>
                        </select>
                        <select name="search" id="selectBox2" class="choose">
                            <option value="search1">2차 선택</option>
                            <option value="search1">jquery 구현</option>
                        </select>
                    </div>
                    <table id="tb">
                        <tr>
                            <th><input type="checkbox" name="all"></th>
                            <th>번호</th>
                            <th>1차 유형</th>
                            <th>2차 유형</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>상태</th>
                        </tr>
						<c:forEach var="article" items="${articles}">
						<c:set var="i" value="${i+1}"/>
							<tr class="row">
	                        	<td><input type="checkbox" name="all" value="${article.no}"></td>
	                            <td>${i}</td>
	                            <td>${article.cateType1}</td>
	                            <td>${article.cateType2}</td>
	                            <td><a href="/Kmarket/admin/cs/qna/view.do?cate=qna&cateType1=${article.cateType1}&no=${article.no}">[${article.cateType2}] ${article.title} // type1:${article.cateType1} // type2:${article.cateType2} // no:${article.no}</a></td>
	                            <td>${article.uid.substring(0,3)}**</td>
	                            <td>
	                            	<fmt:parseDate value="${article.rdate}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
					                <fmt:formatDate value="${time}" pattern="yy.MM.dd"/>
	                            </td>
	                            <td>검답</td>
                        	</tr>
						</c:forEach>
                        
                    </table>
                    <input type="button" class="delete" value="선택삭제">
                    <a href="/Kmarket/admin/cs/qna/write.do?cate=qna" class="write">작성하기</a>
                    <div class="paging">
                        <span class="prev">
                            <c:if test="${pageGroupStart gt 1}">
	                            <a href="/Kmarket/admin/cs/qna/list.do?pg=${pageGroupStart-1}" class="prev">&nbsp;이전</a>
	                        </c:if>
                        </span>
                        <span class="num">
                            <!-- <a href="#" class="on">1</a> -->
                            <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
	                            <a href="/Kmarket/admin/cs/qna/list.do?pg=${i}" class="num ${currentPage eq i? 'current':'off'}">${i}</a>
	                        </c:forEach>
                        </span>
                        <span class="next">
                            <c:if test="${pageGroupStart lt lastPageNum}">
	                            <a href="/Kmarket/admin/cs/qna/list.do?pg=${pageGroupStart+1}" class="next">다음&nbsp;</a>
	                        </c:if>
                        </span>
                    </div>
                </section>
            </section>
        </main>
<jsp:include page="/admin/_footer.jsp"></jsp:include>