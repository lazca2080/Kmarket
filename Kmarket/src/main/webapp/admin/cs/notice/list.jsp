<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/admin/_header.jsp"></jsp:include>
<script>
$(function(){
	
	 // 30자 넘어가면 말 줄임표...
	/*  var tr_length = $('#tb tr').length-1;	//맨위 테이블 행은 빼기
	 var tab_td = $('#tb td');				//tb 테이블의 td들 불러오기
	 var text = "...";						//말 줄임표
	 for (var i = 0; i < tr_length; i++) {
	        if(i==0){
	            var td1 = tab_td.eq(i).text();
	            if(td1.length>20){//35글자가 넘으면
	                $("#tb td:eq("+i+")").html(td1.substr(0,20)+text);
	            }
	        }else{
	            var td2 = tab_td.eq(i*2).text();//tr 안에 td 들이 2개라서 곱하기 2
	            if(td2.length>20){//35글자가 넘으면
	                $("#tb td:eq("+(i*2)+")").html(td2.substr(0,20)+text);
	            }
	        }
	    } */
	
  $('#selectBox').change(function(){
	  
	/* 해당 switch문 또는 아래 if문 선택 사용  
	
	let selectOption = $("#selectBox option:selected").val();
	  console.log("selectOption: " + selectOption);
	  
	  switch(selectOption){
	  	case 'option1' : location.href='/Kmarket/admin/cs/notice/list.do?cate=notice&cateType1=고객서비스'; break;
	  	case 'option2' : location.href='/Kmarket/admin/cs/notice/list.do?cate=notice&cateType1=안전거래'; break;
	  	case 'option3' : location.href='/Kmarket/admin/cs/notice/list.do?cate=notice&cateType1=위해상품'; break;
	  	case 'option4' : location.href='/Kmarket/admin/cs/notice/list.do?cate=notice&cateType1=이벤트당첨'; break;
	  	
	  }  
	*/  
	  
 		let selectOption = $("#selectBox option:selected").val();
 		console.log("selectOption: " + selectOption);
	  
		 if(selectOption == 'option1'){
			 location.href='/Kmarket/admin/cs/notice/list.do?cate=notice&cateType1=고객서비스'; 
			 // 참고: $('#selectBox option:eq(option1)').prop('selected', true).trigger('change'); 페이지 이동이라 해당 방법으로 option selected 고정 불가능
			 // 참고: $("#selectBox").val("${param.search}").attr("selected","selected"); 페이지 이동이라 해당 방법으로 option selected 고정 불가능
		 }else if(selectOption == 'option2'){
			 location.href='/Kmarket/admin/cs/notice/list.do?cate=notice&cateType1=안전거래'; 
		 }else if(selectOption == 'option3'){
			 location.href='/Kmarket/admin/cs/notice/list.do?cate=notice&cateType1=위해상품'; 
		 }else if(selectOption == 'option4'){
			 location.href='/Kmarket/admin/cs/notice/list.do?cate=notice&cateType1=이벤트당첨'; 
		 } 
		 
  });
		
	$('#remove').click(function(e){
		let isDelete = confirm('정말 삭제하시겠습니까?');
		
		if(isDelete){
			return true;
		}else{
			return false;
		}
	});    
	
	    
	
});
</script>
<!DOCTYPE html>
            <section id="admin-product-list">
                <nav>
                    <h3>공지사항 목록</h3>
                    <p>
                        HOME > 고객센터 >
                        <strong>공지사항</strong>
                    </p>
                </nav>
                <section>
                    <div>
                        <select name="search" id="selectBox">
                            <option value="">유형선택</option>
                            <!-- <option value="option1">고객서비스</option> -->
                            <option value="option1" <c:if test="${cateType1 eq '고객서비스'}">selected="selected"</c:if>>고객서비스</option>
                            <option value="option2" <c:if test="${cateType1 eq '안전거래'}">selected="selected"</c:if>>안전거래</option>
                            <option value="option3" <c:if test="${cateType1 eq '위해상품'}">selected="selected"</c:if>>위해상품</option>
                            <option value="option4" <c:if test="${cateType1 eq '이벤트당첨'}">selected="selected"</c:if>>이벤트당첨</option>
                        </select>
                        <input type="hidden" value="${cateType1}">
                    </div>
                    <table id="tb">
                        <tr>
                            <th><input type="checkbox" name="checkArticle"></th>
                            <th>번호</th>
                            <th>유형</th>
                            <th>제목</th>
                            <th>조회</th>
                            <th>날짜</th>
                            <th>관리</th>
                        </tr>
						<c:forEach var="article" items="${articles}">
							<tr class="row">
	                        	<td><input type="checkbox" name="all"></td>
	                            <td>${pageStartNum = pageStartNum - 1}</td>
	                            <td>${article.cateType1}</td>
	                            <td><a href="/Kmarket/admin/cs/notice/view.do?cate=notice&cateType1=${article.cateType1}&no=${article.no}">[${article.cateType2}] ${article.title} // type1:${article.cateType1} // type2:${article.cateType2} // no:${article.no}</a></td>
	                            <td>120</td>
	                            <td>
	                            	<fmt:parseDate value="${article.rdate}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
					                <fmt:formatDate value="${time}" pattern="yy.MM.dd"/>
	                            </td>
	                            <td>
	                                <a href="/Kmarket/admin/cs/notice/delete.do?no=${article.no}" id="remove">[삭제]</a><br>
	                                <a href="/Kmarket/admin/cs/notice/modify.do?cate=notice&cateType1=${article.cateType1}&no=${article.no}">[수정]</a>
	                            </td>
                        	</tr>
						</c:forEach>
                        
                    </table>
                    <input type="button" class="delete" value="선택삭제">
                    <a href="/Kmarket/admin/cs/notice/write.do?cate=notice" class="write">작성하기</a>
                    <div class="paging">
                        <span class="prev">
                            <c:if test="${pageGroupStart gt 1}">
	                            <a href="/Kmarket/admin/cs/notice/list.do?pg=${pageGroupStart-1}" class="prev">&nbsp;이전</a>
	                        </c:if>
                        </span>
                        <span class="num">
                            <!-- <a href="#" class="on">1</a> -->
                            <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
	                            <a href="/Kmarket/admin/cs/notice/list.do?pg=${i}" class="num ${currentPage eq i? 'current':'off'}">${i}</a>
	                        </c:forEach>
                        </span>
                        <span class="next">
                            <c:if test="${pageGroupStart lt lastPageNum}">
	                            <a href="/Kmarket/admin/cs/notice/list.do?pg=${pageGroupStart+1}" class="next">다음&nbsp;</a>
	                        </c:if>
                        </span>
                    </div>
                </section>
            </section>
        </main>
<jsp:include page="/admin/_footer.jsp"></jsp:include>