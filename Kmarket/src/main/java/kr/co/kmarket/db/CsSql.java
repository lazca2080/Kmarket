package kr.co.kmarket.db;

public class CsSql {

	/*** cs - index ***/
	// notice + qna 최신글 리스트 5건 출력하기 
	public static final String SELECT_LATESTS = "(SELECT `no`, `cate`, `cateType1`, `cateType2`, `title`, `uid`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) "
											  + " UNION "
											  + " (SELECT `no`, `cate`, `cateType1`, `cateType2`, `title`, `uid`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5) " 
											  + " UNION "
											  + " (SELECT `no`, `cate`, `cateType1`, `cateType2`, `title`, `uid`, `rdate` FROM `cs_article` WHERE `cate`=? ORDER BY `no` DESC LIMIT 5)";

	// id 마스킹 처리 위 SQL문에 추가할 것
	// select replace(uid, SUBSTRING(uid, 4), '**') uid from `km_member`
	// 날짜 변경할 것
	// select REPLACE(SUBSTRING(rdate, 3, 8), "-", ".") from `km_member`
	
	/*** cs - qna ***/
	// 문의글 작성하기
	public static final String INSERT_ARTICLE = "INSERT INTO `cs_article` SET "
											  + " `cate`=?, "
											  + " `cateType1`=?, "
											  + " `cateType2`=?, "
											  + " `title`=?, "
											  + " `content`=?, "
											  + " `uid`=?, "
											  + " `regip`=?, "
											  + " `rdate`=NOW()";
	public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `cs_article`";
}
