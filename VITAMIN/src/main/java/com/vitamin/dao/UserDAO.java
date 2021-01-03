package com.vitamin.dao;

import java.util.List;

import com.vitamin.domain.UserVO;

public interface UserDAO {
	
	/**
	 * 로그인 확인 기능 구현
	 */
	UserVO idCheck_Login(UserVO vo);
	
	List<UserVO> alluser();
	
	List<UserVO> userSerach(String keyselects, String accountsearch, String rankselect, String gradeselect);
	public int blackchange(String blackid,String blackstate);
	public int rankchange(String rankid, String rankstate);
	public String userpay(String id);
	
	//회원가입
	public void userJoin(UserVO vo) throws Exception;

	//회원정보 수정
	public void userUpdate(UserVO vo)throws Exception;

	//회원 정보 조회
	UserVO getuserinfo(String id);

	//회원 탈퇴
	public void userDelete(UserVO vo)throws Exception;

}
