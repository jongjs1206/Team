package com.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitamin.dao.UserDAO;
import com.vitamin.dao.UserDAOImpl;
import com.vitamin.domain.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAOImpl userDAO;
	
	@Override
	public UserVO idCheck_Login(UserVO vo) {
		return userDAO.idCheck_Login(vo);
	}

	@Override
	public List<UserVO> alluser() {
		return userDAO.alluser();
	}

	@Override
	public List<UserVO> userSerach(String keyselects, String accountsearch, String rankselect, String gradeselect) {
		
		
		return userDAO.userSerach(keyselects,accountsearch,rankselect,gradeselect);
	}

	@Override
	public int blackchange(String blackid,String blackstate) {
		
		return userDAO.blackchange(blackid,blackstate);
	}

	@Override
	public int rankchange(String rankid, String rankstate) {
		return userDAO.rankchange(rankid,rankstate);
	}

	@Override
	public String userpay(String id) {
		return userDAO.userpay(id);
	}
	
	@Override
	public void userJoin(UserVO vo) throws Exception {
		userDAO.userJoin(vo);
	}

	@Override
	public void userUpdate(UserVO vo) throws Exception {
		userDAO.userUpdate(vo);
	}
	
	@Override
	public UserVO getuserinfo(String id) {
		return userDAO.getuserinfo(id);
	}
	
	@Override
	public void userDelete(UserVO vo) throws Exception {
		System.out.println("delserviceimpl");
		userDAO.userDelete(vo);
	}


}
