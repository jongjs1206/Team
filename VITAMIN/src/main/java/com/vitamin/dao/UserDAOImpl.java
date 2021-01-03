package com.vitamin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitamin.domain.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	
	public UserVO idCheck_Login(UserVO vo) {
		System.out.println("===>  UserMapper userLogin() 호출");
		System.out.println(vo.getU_id());
		System.out.println(vo.getClass());
		return mybatis.selectOne("user_map.userLogin", vo);
	}

	@Override
	public List<UserVO> alluser() {
		return mybatis.selectList("user_map.allusersearch");
	}

	@Override
	public List<UserVO> userSerach(String keyselects, String accountsearch, String rankselect, String gradeselect) {
		System.out.println("니녀석이?");
		System.out.println(keyselects);
		System.out.println(accountsearch);
		System.out.println(rankselect);
		System.out.println(gradeselect);
			HashMap<String,Object> map = new HashMap<>();
			map.put("keyselects", keyselects);
			map.put("accountsearch", accountsearch);
			map.put("rankselect", rankselect);
			map.put("gradeselect", gradeselect);

			System.out.println("유저검색 다오 ");
			
		return  mybatis.selectList("user_map.userSearch",map);
	}

	@Override
	public int blackchange(String blackid,String blackstate) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("blackid", blackid);
		map.put("blackstate", blackstate);
		
		return mybatis.update("user_map.blackchange",map);
	}

	@Override
	public int rankchange(String rankid, String rankstate) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("rankid", rankid);
		map.put("rankstate", rankstate);
		
		return mybatis.update("user_map.rankchange",map);
	}

	@Override
	public String userpay(String id) {
		return mybatis.selectOne("user_map.userpay",id);
	}
	
	//회원가입
	@Override
	public void userJoin(UserVO vo) throws Exception {
		System.out.println("===>  UserMapper userJoin() 호출");
		mybatis.insert("user_map.userJoin", vo);
	}


	//회원정보 수정
	@Override
	public void userUpdate(UserVO vo) throws Exception {
		System.out.println("===>  UserMapper userUpdate() 호출");
		System.out.println(vo.getU_id());
		System.out.println(vo.getU_pass());
		System.out.println(vo.getU_name());
		System.out.println(vo.getU_tel());//
		System.out.println(vo.getU_height());
		System.out.println(vo.getU_weight());
		System.out.println(vo.getU_idnum());//
		System.out.println(vo.getU_addr());//

		mybatis.update("user_map.userUpdate", vo);
	}

	//회원정보 조회
	public UserVO getuserinfo(String id) {
		return mybatis.selectOne("user_map.getuserinfo", id);

	}

	//회원탈퇴
	@Override
	public void userDelete(UserVO vo) throws Exception {
		System.out.println("===>  UserMapper userDelete() 호출");
		int result = mybatis.delete("user_map.userDelete", vo);	
		if(result == 1) {
			mybatis.update("user_map.userKeepRate");
		}
	}

}
