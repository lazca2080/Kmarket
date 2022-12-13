package kr.co.kmarket.db;

public class CsSql {

	/*** cs - index ***/
	// notice 최신글 리스트 5건 출력하기 (제목, 날짜 출력)
//	public static final String SELECT_NOTICE_LATESTS = "(SELECT `no`, `title`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5)  "
//											  		+ " UNION "
//											  		+ " (SELECT `no`, `title`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) "
//											  		+ " UNION "
//											  		+ " (SELECT `no`, `title`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5)";
//	
//	// qna 최신글 리스트 5건 출력하기 (문의유형1, 제목, 아이디, 날짜 출력)
//	public static final String SELECT_QNA_LATESTS = "(SELECT `no`, `cateType`, `title`, `uid`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) "
//												  + " UNION "
//												  + " (SELECT `no`, `cateType`, `title`, `uid`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) " 
//												  + " UNION "
//												  + " (SELECT `no`, `cateType`, `title`, `uid`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5)";
//	
	// notice + qna 최신글 리스트 5건 출력하기 (각자 필요없는 부분은 출력X 처리) 실행되면 위 SQL문 삭제 
	public static final String SELECT_LATESTS = "(SELECT `no`, `cateType1`, `title`, `uid`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) "
											  + " UNION "
											  + " (SELECT `no`, `cateType1`, `title`, `uid`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) " 
											  + " UNION "
											  + " (SELECT `no`, `cateType1`, `title`, `uid`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5)";
	
	// id 마스킹 처리 위 SQL문에 추가할 것
	// select replace(uid, SUBSTRING(uid, 4), '**') uid from `km_member`
	// 날짜 변경할 것
	// select REPLACE(SUBSTRING(rdate, 3, 8), "-", ".") from `km_member`
}
