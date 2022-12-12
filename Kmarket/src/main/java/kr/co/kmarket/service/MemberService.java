package kr.co.kmarket.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.dao.MemberDAO;
import kr.co.kmarket.vo.MemberVO;

public enum MemberService {
	
	INSTANCE;
	private MemberDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private MemberService() {
		dao = new MemberDAO();
	}
	
	/*** login - LoginController ***/
	// 아이디 패스워드 확인
	public MemberVO selectMember(String uid, String pass) {
		return dao.selectMember(uid, pass);
	}
	// 자동 로그인 (sessID) DB 저장
	public void updateMemberForSession(String uid, String sessId) {
		dao.updateMemberForSession(uid, sessId);
	}
	
	/*** logout - LogoutContrller ***/
	public void updateUserForSessionOut(String uid) {
		dao.updateUserForSessionOut(uid);
	}
	
	/*** register - RegisterController ***/
	// 회원가입
	public void insertMember(MemberVO vo) {
		dao.insertMember(vo);
	}
	
	
	/*** register - RegisterSellerController ***/
	
	public void insertSellerMember(MemberVO vo) {
		dao.insertSellerMember(vo);
	}
	
	
	//아이디 중복확인
	public int selectCountSellerUid(String uid) {
		return dao.selectCountSellerUid(uid);
	}
}
