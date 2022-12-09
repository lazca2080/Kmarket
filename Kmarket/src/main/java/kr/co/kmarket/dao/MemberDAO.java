package kr.co.kmarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBCP;
import kr.co.kmarket.db.MemberSql;
import kr.co.kmarket.vo.MemberVO;

public class MemberDAO {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	/*** login ***/
	// 아이디 패스워드 확인
	public MemberVO selectMember(String uid, String pass) {
		MemberVO mv = null;
		try {
			logger.info("selectMember...");
			Connection con = DBCP.getConnection();
			PreparedStatement psmt = con.prepareStatement(MemberSql.SELECT_MEMBER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				mv.setUid(rs.getString(1));
				mv.setPass(rs.getString(2));
				mv.setGender(rs.getInt(3));
				mv.setHp(rs.getString(4));
				mv.setEmail(rs.getString(5));
				mv.setType(rs.getInt(6));
				mv.setPoint(rs.getInt(7));
				mv.setLevel(rs.getInt(8));
				mv.setZip(rs.getString(9));
				mv.setAddr1(rs.getString(10));
				mv.setAddr2(rs.getString(11));
				mv.setCompany(rs.getString(12));
				mv.setCeo(rs.getString(13));
				mv.setBizRegNum(rs.getString(14));
				mv.setCornRegNum(rs.getString(15));
				mv.setTel(rs.getString(16));
				mv.setMananger(rs.getString(17));
				mv.setManagerHp(rs.getString(18));
				mv.setFax(rs.getString(19));
				mv.setRegip(rs.getString(20));
				mv.setWdate(rs.getString(21));
				mv.setRdate(rs.getString(22));
				mv.setEtc1(rs.getInt(23));
				mv.setEtc2(rs.getInt(24));
				mv.setEtc3(rs.getString(25));
				mv.setEtc4(rs.getString(26));
				
			}
			
			rs.close();
			psmt.close();
			con.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return mv;
	}
	// 자동 로그인 (auto) 체크
	
	// 자동 로그인 세션 만료 연장
	
	// 자동 로그인 (sessID) DB 저장
	public void updateMemberForSession(String sessId, String uid) {
		try {
			logger.info("updateMemberForSession...");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(MemberSql.UPDATE_MEMBER_FOR_SESSION);
			psmt.setString(1, sessId);
			psmt.setString(2, uid);
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	
	
}
