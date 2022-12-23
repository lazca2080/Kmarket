<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/admin/_header.jsp"></jsp:include>
<script>
$(function() {
	
	let totalNo = new Array();
	
	//개별 선택 삭제
	$('.delete').click(function() {
		
		let isDelete = confirm('정말 삭제하시겠습니까?');
		
		if(isDelete){
			
			let no = $('input:checkbox:checked').val();
			let checkbox = $('input:checkbox:checked');
			
			console.log("no : "+no);
			
			if(no == null){
				alert('선택된 사항이 없습니다.');
				return;
			}
			
			$.ajax({
				url : '/Kmarket/admin/cs/faq/delete.do',
				method : 'get',
				data : {"totalNo":JSON.stringify(totalNo)},
				dataType : 'json',
				success : function(data) {
					console.log("data : "+data.result);
					if(data.result == totalNo.length){
						alert('삭제되었습니다.');
						checkbox.parent().parent().remove();
						totalNo = [];
						return true;
					}else{
						alert('실패하였습니다.');
						return false;
					}
				}
			});
			return true;
		}else{
			return false;
		}
		
	});
	
	//전체선택 체크박스
	$(document).on('click','.chk',function(){
		if($('input[name=all]').is(':checked')){
			$('input[name=no]').prop('checked', true);
			
			totalNo = [];
			$('input[name=no]').each(function(){
				totalNo.push($(this).val());
			});
			
			console.log("true totalNo : "+totalNo);
			
		}esle{
			$('input[name=no]').prop('checked', false);
			totalNo = [];
			console.log("false totalNo : "+totalNo);
		}
	});
	
	
	$('#remove').click(function() {
		
		let isDelete = comfirm('정말 삭제 하시겠습니까?');
		
		if(isDelete){
			return true;
		}else{
			return false;
		}
		
	});
	
	$('select[id=selectBox]').change(function() {

		let select = $(this).val();
		
		console.log("select : "+select);
		
		if(select == '회원'){
			$('.choose').empty();
			
			let tags = "<option value='0'>2차 선택</option>";
			 	tags += "<option value='가입'>가입</option>";
			 	tags += "<option value='탈퇴'>탈퇴</option>";
				tags += "<option value='회원정보'>회원정보</option>";
				tags += "<option value='로그인'>로그인</option>";
				
			$('.choose').append(tags);
			
		}else if(select == '쿠폰/이벤트'){
			$('.choose').empty();
			
			let tags = "<option value='0'>2차 선택</option>";
			 	tags += "<option value='쿠폰/할인혜택}'>쿠폰/할인혜택</option>";
			 	tags += "<option value='포인트'>포인트</option>";
				tags += "<option value='제휴'>제휴</option>";
				tags += "<option value='이벤트'>이벤트</option>";
				
			$('.choose').append(tags);	
			
		}else if(select == '주문/결제'){
			$('.choose').empty();
			
			let tags = "<option value='0'>2차 선택</option>";
			 	tags += "<option value='상품'>상품</option>";
			 	tags += "<option value='결제'>결제</option>";
				tags += "<option value='구매내역'>구매내역</option>";
				tags += "<option value='영수증/증빙'>영수증/증빙</option>";
				
			$('.choose').append(tags);
		}else if(select == '배송'){
			$('.choose').empty();
			
			let tags = "<option value='0'>2차 선택</option>";
			 	tags += "<option value='배송상태/기간'>배송상태/기간</option>";
			 	tags += "<option value='배송정보확인/변경'>배송정보확인/변경</option>";
				tags += "<option value='해외배송'>해외배송</option>";
				tags += "<option value='당일배송'>당일배송</option>";
				tags += "<option value='해외직구'>해외직구</option>";
				
			$('.choose').append(tags);
			
		}else if(select == '취소/반품/교환'){
			$('.choose').empty();
			
			let tags = "<option value='0'>2차 선택</option>";
			 	tags += "<option value='반품신청/철회'>반품신청/철회</option>";
			 	tags += "<option value='반품정보확인/변경'>반품정보확인/변경</option>";
				tags += "<option value='교환AS신청/철회'>교환AS신청/철회</option>";
				tags += "<option value='교환정보확인/변경'>교환정보확인/변경</option>";
				tags += "<option value='취소신청/철회'>취소신청/철회</option>";
				tags += "<option value='취소확인/환불정보'>취소확인/환불정보</option>";
				
			$('.choose').append(tags);
			
		}else if(select == '여행/숙박/항공'){
			$('.choose').empty();
			
			let tags = "<option value='0'>2차 선택</option>";
			 	tags += "<option value='여행/숙박'>여행/숙박</option>";
			 	tags += "<option value='항공'>항공</option>";
				
			$('.choose').append(tags);
			
		}else if(select == '안전거래'){
			$('.choose').empty();
			
			let tags = "<option value='0'>2차 선택</option>";
			 	tags += "<option value='서비스 이용규칙 위반'>서비스 이용규칙 위반</option>";
			 	tags += "<option value='지식재산권침해'>지식재산권침해</option>";
				tags += "<option value='법령 및 정책위반 상품'>법령 및 정책위반 상품</option>";
				tags += "<option value='게시물 정책위반'>게시물 정책위반</option>";
				tags += "<option value='직거래/외부거래유도'>직거래/외부거래유도</option>";
				tags += "<option value='표시광고'>표시광고</option>";
				tags += "<option value='청소년 위해상품/이미지'>청소년 위해상품/이미지</option>";
				
			$('.choose').append(tags);
		}
		
	});
	
	$('#selectBox').change(function(){
		$('#selectBox2').change(function() {
			
			let cateType1 = $('#selectBox option:selected').val();
			let cateType2 = $('#selectBox2 option:selected').val();
			console.log("cateType1: " + cateType1);
			console.log("cateType2: " + cateType2);
			
			
			$.ajax({
				url: '/Kmarket/admin/cs/faq/select.do', 
				method: 'get',
				data:{"cateType1":cateType1, "cateType2":cateType2},
				dataType:'json',
				success: function(data){
					console.log(data);
					$('.row').remove();	// 테이블 비우기
					let no = 1;
					
					console.log("data.length :" +data.length);

					for(let vo of data){
						console.log("no : "+vo.no);
						let rdate = vo.rdate.substring(2,10);
						
						let rows = "<tr class='row'>";
						rows += "<td><input type='checkbox' name='no' value='"+vo.no+"'></td>";
						rows += "<td>"+no+"</td>";
						rows += "<td>"+vo.cateType1+"</td>";
						rows += "<td>"+vo.cateType2+"</td>";
						rows += "<td><a href='/Kmarket/admin/cs/qna/view.do?cate=faq&cateType1="+vo.cateType1+"&cateType2="+vo.cateType2+"&no="+vo.no+"'>["+vo.cateType2+"]  "+vo.title+"</a></td>";
						rows += "<td>"+vo.hit+"</td>";
						rows += "<td>"+rdate+"</td>";
						rows += "<td><a href='/Kmarket/admin/cs/faq/delete.do?no="+vo.no+"'>[삭제]</a><br><a href='/Kmarket/admin/cs/faq/modify.do?cate=faq&cateType1="+vo.cateType1+"&cateType2="+vo.cateType2+"&no="+vo.no+"'>[수정]</a></td>";
						rows += "</tr>";
							
						$('#tb').append(rows);
						
						no++;
					}
				}
			});
		});
	
	});
	
});
</script>
<!DOCTYPE html>
				<section id="admin-faq">
                <nav>
                    <h3>자주묻는질문 목록</h3>
                    <p>
                        HOME > 고객센터 >
                        <strong>자주묻는질문</strong>
                    </p>
                </nav>
                <section>
                    <div>
                        <select name="search" id="selectBox">
                            <option value="0">1차 선택</option>
                            <option value="회원">회원</option>
                            <option value="쿠폰/이벤트">쿠폰/이벤트</option>
                            <option value="주문/결제">주문/결제</option>
                            <option value="배송">배송</option>
                            <option value="취소/반품/교환">취소/반품/교환</option>
                            <option value="여행/숙박/항공">여행/숙박/항공</option>
                            <option value="안전거래">안전거래</option>
                        </select>
						<select name="search" id="selectBox2" class="choose">
                            <option value="search1">2차 선택</option>
                        </select>
                    </div>
                    <table id="tb">
                        <tr>
                            <th>
                            <input type="checkbox" name="all" class="chk">
                            <input type="hidden" class="uid" value="${sessUser.uid}">
                            </th>
                            <th>번호</th>
                            <th>1차 유형</th>
                            <th>2차 유형</th>
                            <th>제목</th>
                            <th>조회</th>
                            <th>날짜</th>
                            <th>관리</th>
                        </tr>
                        <c:forEach var="article" items="${articles}">
                        <c:set var="i" value="${i+1}"/>
                        <tr class="row">
                        	<td><input type="checkbox" name="no" value="${article.no}"></td>
                            <td>${i}</td>
                            <td>${article.cateType1}</td>
                            <td>${article.cateType2}</td>
                            <td><a href="/Kmarket/admin/cs/faq/view.do?cate=faq&cateType1=${article.cateType1}&cateType2=${article.cateType2}&no=${article.no}">[${article.cateType2}] ${article.title} // type1:${article.cateType1} // type2:${article.cateType2} // no:${article.no}</a></td>
                            <td>${article.hit}</td>
                            <td>
								<fmt:parseDate value="${article.rdate}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
					            <fmt:formatDate value="${time}" pattern="yy.MM.dd"/>
							</td>
                            <td>
                                <a href="/Kmarket/admin/cs/faq/delete.do?no=${article.no}" id="remove">[삭제]</a><br>
                                <a href="/Kmarket/admin/cs/faq/modify.do?cate=faq&cateType1=${article.cateType1}&cateType2=${article.cateType2}&no=${article.no}">[수정]</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <input type="button" class="delete" value="선택삭제">
                    <a href="/Kmarket/admin/cs/faq/write.do?cate=faq&cateType1=${cateType1}&cateType2=${cateType2}" class="write">작성하기</a>
                    
                  
                </section>
            </section>
        </main>
<jsp:include page="/admin/_footer.jsp"></jsp:include>