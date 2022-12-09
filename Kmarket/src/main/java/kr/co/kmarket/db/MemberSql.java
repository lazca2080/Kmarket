package kr.co.kmarket.db;

public class MemberSql {
	
	/*** login ***/
	// 아이디 패스워드 확인
	public static final String SELECT_MEMBER = "SELECT * FROM `km_member` WHERE `uid`=? and `pass`=SHA2(?, 256)";
	// 자동 로그인 (auto) 체크
	public static final String SELECT_MEMBER_BY_SESSID = "SELECT * FROM `km_member` WHERE `sessId`=? AND `sessLimitDate` > NOW()";
	// 자동 로그인 세션 만료 연장
	public static final String UPDATE_MEMBER_FOR_SESS_LIMIT_DATE = "UPDATE `km_member` SET `sessLimitDate` = DATE_ADD(NOW(), INTERVAL 3 DAY) WHERE `sessId`=?";
	// 자동 로그인 (sessID) DB 저장
	public static final String UPDATE_MEMBER_FOR_SESSION = "UPDATE `km_member` SET `sessId`=?, `sessLimitDate`= DATE_ADD(NOW(), INTERVAL 3 DAY) WHERE `uid`=?";
	// 아이디 찾기
	
	// 비밀번호 찾기
	
	// 비밀번호 변경
	
	// 로그아웃
	public static final String UPDATE_MEMBER_FOR_SESSION_OUT = "UPDATE `km_member` SET `sessId`=NULL, `sessLimitDate`=NULL WHERE `uid`=?";


}
