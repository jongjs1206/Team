package com.vitamin.service;

import java.util.List;

import com.vitamin.domain.UserVO;

public interface UserService {
	public UserVO idCheck_Login( UserVO vo);
	
	public List<UserVO> alluser();
	
	public List<UserVO> userSerach(String keyselects, String accountsearch, String rankselect,String gradeselect);
	public int blackchange(String blackid,String blackstate);
	public int rankchange(String rankid,String rankstate);
	public String userpay(String id);
	
	public void userJoin(UserVO vo) throws Exception;
	   
	public void userUpdate(UserVO vo) throws Exception;
	
	public void userDelete(UserVO vo) throws Exception;

	public UserVO getuserinfo(String id);

}
