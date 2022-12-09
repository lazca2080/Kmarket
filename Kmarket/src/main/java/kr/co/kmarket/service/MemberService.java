package kr.co.kmarket.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.dao.MemberDAO;

public enum MemberService {
	
	INSTANCE;
	private MemberDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private MemberService() {
		dao = new MemberDAO();
	}
	
	/*** login ***/
	// 아이디 패스워드 확인
	public void selectMember() {
		
	}
	
}
