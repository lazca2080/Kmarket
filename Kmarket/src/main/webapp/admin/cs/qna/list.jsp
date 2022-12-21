<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/admin/_header.jsp"></jsp:include>
<script>
	$(function(){
		
		$('#selectBox').change(function(){
			let selectCate1 = $('#selectBox option:selected').val();
			console.log("1차 카테고리 선택: " + selectCate1);
			
			/* let jsonData = {"selectCate1":selectCate1}; */
			let jsonData = {
					"cateType1":cateType1
			}
			
			$.ajax({
				url: '/Kmarket/admin/cs/qna/select.do', 
				method: 'get',
				data:jsonData,
				dataType:'json',
				success: function(data){
					
					$('.row').remove();	// 테이블 비우기

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
                            <option value="">1차 선택</option>
                            <option value="option1">회원</option>
                            <option value="option2">쿠폰/이벤트</option>
                            <option value="option3">주문/결제</option>
                            <option value="option4">취소/반품/교환</option>
                            <option value="option5">여행/숙박/항공</option>
                            <option value="option6">안전거래</option>
                        </select>
						<select name="search" id="selectBox2">
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
	                        	<td><input type="checkbox" name="all"></td>
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