<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/admin/_header.jsp"></jsp:include>
<!DOCTYPE html>
            <section id="cs">
            	<div class="faq">
	                <nav>
	                    <h3>자주묻는질문 보기</h3>
	                    <p>
	                        HOME > 고객센터 >
	                        <strong>자주묻는질문</strong>
	                    </p>
	                </nav>
	                <section class="view">
						<article>
							<table>
							    <tbody>
							        <tr>
							            <td>
							            	유형
							            </td>
							            <td>${vo.cateType1} - ${vo.cateType2}</td>
							        </tr>
							        <tr>
							            <td>
							           		제목
							            </td>
							            <td>${vo.title} // no: ${no}</td>
							        </tr>
							        <tr>
							            <td>
							            	내용
							            </td>
							            <td>${vo.content}</td>
							        </tr>
							    </tbody>
							</table>
							 <div>
							   <a href="/Kmarket/admin/cs/faq/delete.do?no=${no}" class="btnDelete" id="remove">삭제</a>
	                           <a href="/Kmarket/admin/cs/faq/modify.do?cate=faq&cateType1=${vo.cateType1}&cateType2=${vo.cateType2}&no=${no}" class="btnModify">수정</a>
	                           <a href="/Kmarket/admin/cs/faq/list.do" class="btnList">목록</a>
							</div>
						</article>
	                </section>
                </div>
            </section>
        </main>
<jsp:include page="/admin/_footer.jsp"></jsp:include>