<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"></jsp:include>
<script>
	$(function(){
		
		$('select[name=prodCate1]').change(function(){
			
			let select = $(this).val();
			
			if(select == '10'){
				$('select[name=prodCate2]').empty();
				
				let tags = "<option value='0'>2차 분류 선택</option>";
				   tags += "<option value='10'>브랜드 여성의류</option>";
				   tags += "<option value='11'>브랜드 남성의류</option>";
				   tags += "<option value='12'>브랜드 진/캐쥬얼</option>";
				   tags += "<option value='13'>브랜드 신발/가방</option>";
				   tags += "<option value='14'>브랜드 쥬얼리/시계</option>";
				   tags += "<option value='15'>브랜드 아웃도어</option>";
				
				$('select[name=prodCate2]').append(tags);
			}else if(select == '11'){
				$('select[name=prodCate2]').empty();
				
				let tags = "<option value='0'>2차 분류 선택</option>";
				   tags += "<option value='10'>여성의류</option>";
				   tags += "<option value='11'>남성의류</option>";
				   tags += "<option value='12'>언더웨어</option>";
				   tags += "<option value='13'>신발</option>";
				   tags += "<option value='14'>가방/잡화</option>";
				   tags += "<option value='15'>쥬얼리/시계</option>";
				   tags += "<option value='16'>화장품/향수</option>";
				   tags += "<option value='17'>바디/헤어</option>";
				
				$('select[name=prodCate2]').append(tags);
				
			}else if(select == '12'){
				$('select[name=prodCate2]').empty();
				
				let tags = "<option value='0'>2차 분류 선택</option>";
				   tags += "<option value='10'>출산/육아</option>";
				   tags += "<option value='11'>장난감/완구</option>";
				   tags += "<option value='12'>유아동 의류</option>";
				   tags += "<option value='13'>유아동 신발/잡화</option>";
				
				$('select[name=prodCate2]').append(tags);
				
			}else if(select == '13'){
				$('select[name=prodCate2]').empty();
				
				let tags = "<option value='0'>2차 분류 선택</option>";
				   tags += "<option value='10'>신선식품</option>";
				   tags += "<option value='11'>가공식품</option>";
				   tags += "<option value='12'>건강식품</option>";
				   tags += "<option value='13'>커피/음료</option>";
				   tags += "<option value='14'>생필품</option>";
				   tags += "<option value='15'>바디/헤어</option>";
				
				$('select[name=prodCate2]').append(tags);
			}else if(select == '14'){
				$('select[name=prodCate2]').empty();
				
				let tags = "<option value='0'>2차 분류 선택</option>";
				   tags += "<option value='10'>가구/DIY</option>";
				   tags += "<option value='11'>침구/커튼</option>";
				   tags += "<option value='12'>조명/인테리어</option>";
				   tags += "<option value='13'>생활용품</option>";
				   tags += "<option value='14'>주방용품</option>";
				   tags += "<option value='15'>문구/사무용품</option>";
				   tags += "<option value='16'>사무기기</option>";
				   tags += "<option value='17'>악기/취미</option>";
				   tags += "<option value='18'>반려동물용품</option>";
				
				$('select[name=prodCate2]').append(tags);
				
			}else if(select == '15'){
				$('select[name=prodCate2]').empty();
				
				let tags = "<option value='0'>2차 분류 선택</option>";
				   tags += "<option value='10'>노트북/PC</option>";
				   tags += "<option value='11'>모니터/프린터</option>";
				   tags += "<option value='12'>PC주변기기</option>";
				   tags += "<option value='13'>모바일/태블릿</option>";
				   tags += "<option value='14'>카메라</option>";
				   tags += "<option value='15'>게임</option>";
				   tags += "<option value='16'>영상가전</option>";
				   tags += "<option value='17'>주방가전</option>";
				   tags += "<option value='18'>계절가전</option>";
				   tags += "<option value='19'>생활/미용가전</option>";
				   tags += "<option value='20'>음향가전</option>";
				   tags += "<option value='21'>건강가전</option>";
				
				$('select[name=prodCate2]').append(tags);
				
			}else if(select == '16'){
				$('select[name=prodCate2]').empty();
				
				let tags = "<option value='0'>2차 분류 선택</option>";
				   tags += "<option value='10'>스포츠의류/운동화</option>";
				   tags += "<option value='11'>휘트니스/수영</option>";
				   tags += "<option value='12'>구기/라켓</option>";
				   tags += "<option value='13'>골프</option>";
				   tags += "<option value='14'>자전거/보드/기타레저</option>";
				   tags += "<option value='15'>캠핑/낚시</option>";
				   tags += "<option value='16'>등산/아웃도어</option>";
				   tags += "<option value='17'>건강/의료용품</option>";
				   tags += "<option value='18'>건강식품</option>";
				   tags += "<option value='19'>렌탈서비스</option>";
				
				$('select[name=prodCate2]').append(tags);
			}else if(select == '17'){
				$('select[name=prodCate2]').empty();
				
				let tags = "<option value='0'>2차 분류 선택</option>";
				   tags += "<option value='10'>자동차용품</option>";
				   tags += "<option value='11'>공구/안전/산업용품</option>";
				
				$('select[name=prodCate2]').append(tags);
			}else if(select == '18'){
				$('select[name=prodCate2]').empty();
				
				let tags = "<option value='0'>2차 분류 선택</option>";
				   tags += "<option value='10'>여행/항공권</option>";
				   tags += "<option value='11'>도서/음반/e교육</option>";
				   tags += "<option value='12'>공연티켓</option>";
				   tags += "<option value='13'>e쿠폰</option>";
				   tags += "<option value='14'>상품권</option>";
				
				$('select[name=prodCate2]').append(tags);
			}
			
		});
		
	});
</script>
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
                        <a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>게시판관리</a>
                        <ol>
                            <li><a href="#">게시판현황</a></li>
                            <li><a href="#">고객문의</a></li>
                        </ol>
                    </li>
                </ul>
            </aside>
            <section id="admin-product-register">
                <nav>
                    <h3>상품등록</h3>
                    <p>
                        HOME > 상품관리 >
                        <strong>상품등록</strong>
                    </p>
                </nav>
                <article>
                    <form action="/Kmarket/admin/register.do" method="post" enctype="multipart/form-data">
                        <section>
                            <h4>상품분류</h4>
                            <p>
                                기본분류는 반드시 선택하셔야 합니다. 
                                하나의 상품에 1개의 분류를 지정 합니다.
                            </p>
                            <table>
                                <tr>
                                    <td>1차 분류</td>
                                    <td>
                                        <select name="prodCate1">
                                            <option value="0">1차 분류 선택</option>
                                            <option value="10">브랜드패션</option>
                                            <option value="11">패션의류·잡화·뷰티</option>
                                            <option value="12">유아동</option>
                                            <option value="13">식품ㆍ생필품</option>
                                            <option value="14">홈데코·문구·취미·반려</option>
                                            <option value="15">컴퓨터·디지털·가전</option>
                                            <option value="16">스포츠·건강·렌탈</option>
                                            <option value="17">자동차·공구</option>
                                            <option value="18">여행·도서·티켓·e쿠폰</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2차 분류</td>
                                    <td>
                                        <select name="prodCate2">
                                            <option value="0">2차 분류 선택</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </section>
                        <section>
                            <h4>기본정보</h4>
                            <p>
                                기본정보는 반드시 입력해야 합니다.
                            </p>
                            <table>
                                <tr>
                                    <td>상품명</td>
                                    <td><input type="text" name="prodName"></td>
                                </tr>
                                <tr>
                                    <td>기본설명</td>
                                    <td>
                                        <span>
                                            상품명 하단에 상품에 대한 추가적인 설명이 
                                            필요한 경우에 입력
                                        </span>
                                        <input type="text" name="descript">
                                    </td>
                                </tr>
                                <tr>
                                    <td>제조사</td>
                                    <td><input type="text" name="company"></td>
                                </tr>
                                <tr>
                                    <td>판매가격</td>
                                    <td><input type="text" name="price">원</td>
                                </tr>
                                <tr>
                                    <td>할인율</td>
                                    <td>
                                        <span>0을 입력하면 할인율 없음</span>
                                        <input type="text" name="discount">%
                                    </td>
                                </tr>
                                <tr>
                                    <td>포인트</td>
                                    <td>
                                        <span>0을 입력하면 포인트 없음</span>
                                        <input type="text" name="point">점
                                    </td>
                                </tr>
                                <tr>
                                    <td>재고수량</td>
                                    <td><input type="text" name="stock">개</td>
                                </tr>
                                <tr>
                                    <td>배송비</td>
                                    <td>
                                        <span>0을 입력하면 배송비 무료</span>
                                        <input type="text" name="delivery">원
                                    </td>
                                </tr>
                                <tr>
                                    <td>상품 썸네일</td>
                                    <td>
                                        <span>크기 190 x 190, 상품 목록에 출력될 이미지 입니다.</span>
                                        <input type="file" name="thumb1">
                                        <span>크기 230 x 230, 상품 메인에 출력될 이미지 입니다.</span>
                                        <input type="file" name="thumb2">
                                        <span>크기 456 x 456, 상품 상세에 출력될 이미지 입니다.</span>
                                        <input type="file" name="thumb3">
                                    </td>
                                </tr>
                                <tr>
                                    <td>상세 상품정보</td>
                                    <td>
                                        <span>
                                            크기 가로 940px 높이 제약없음, 
                                            크기 최대 1MB, 상세페이지 상품정보에 
                                            출력될 이미지 입니다.
                                        </span>
                                        <input type="file" name="detail">
                                    </td>
                                </tr>
                            </table>
                        </section>
                        <section>
                            <h4>상품정보 제공고시</h4>
                            <p>
                                [전자상거래에 관한 상품정보 제공에 관한 고시] 
                                항목에 의거 등록해야 
                                되는 정보입니다.
                            </p>
                            <table>
                                <tr>
                                    <td>상품상태</td>
                                    <td>
                                        <input type="text" name="status" value="새상품">
                                    </td>
                                </tr>
                                <tr>
                                    <td>부가세 면세여부</td>
                                    <td>
                                        <input type="text" name="duty" value="과세상품">
                                    </td>
                                </tr>
                                <tr>
                                    <td>영수증발행</td>
                                    <td>
                                        <input type="text" name="receipt" value="발행가능 - 신용카드 전표, 온라인 현금영수증">
                                    </td>
                                </tr>
                                <tr>
                                    <td>사업자구분</td>
                                    <td>
                                        <input type="text" name="bizType" value="사업자 판매자">
                                    </td>
                                </tr>
                                <tr>
                                    <td>원산지</td>
                                    <td>
                                        <input type="text" name="origin" value="국내산">
                                    </td>
                                </tr>
                            </table>
                        </section>
                        <input type="submit" value="등록하기">
                    </form>
                </article>
                <p class="ico alert">
                    Warning! 전자상거래 등에서의 상품 등의 정보제공에 
                    관한 고시에 따라 총 35개 상품군에 대해 상품 특성 
                    등을 양식에 따라 입력할 수 있습니다.
                </p>
            </section>
        </main>
<jsp:include page="./_footer.jsp"></jsp:include>