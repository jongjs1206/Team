package com.vitamin.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitamin.domain.CategoryjoinVO;

@Repository("basketDAO")
public class BasketDAOImpl implements BasketDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void basketinsert(CategoryjoinVO vo) {
		System.out.println("===>  BasketMapper basketinsert 호출");
		mybatis.insert("user_map.basketinsert",vo);
	}

	@Override
	public List<CategoryjoinVO> basketselect(CategoryjoinVO vo) {
		System.out.println("===>  BasketMapper basketselect 호출");
		return mybatis.selectList("user_map.basketselect",vo);
	}

	@Override
	public void basketdelect(String id) {
		System.out.println("===>  BasketMapper basketdelete 호출");
		mybatis.delete("user_map.basketdelete",id);
	}
}
