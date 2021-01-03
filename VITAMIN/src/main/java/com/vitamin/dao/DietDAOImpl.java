package com.vitamin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitamin.domain.DietVO;
import com.vitamin.domain.UserVO;

@Repository("DietDAO")
public class DietDAOImpl implements DietDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<DietVO> dietList(DietVO vo) {
		System.out.println("===>  DietMapper random() 호출");
		return mybatis.selectList("diet.random", vo);
	}

	@Override
	public List<DietVO> dietuserList(DietVO vo) {
		System.out.println("===>  DietMapper dietuserList() 호출");
		return mybatis.selectList("diet.dietuserList", vo);
	}

//	@Override
//	public List<DietVO>  age(Map map) {
//		System.out.println("===>  DietMapper age() 호출");
//		return mybatis.selectOne("diet.age", map);
//	}

	@Override
	public List<DietVO> age(DietVO vo) {
		System.out.println("===>  DietMapper age() 호출");
		return mybatis.selectList("diet.age", vo);
	}

}
