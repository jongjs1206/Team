package com.vitamin.dao;

import java.util.List;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitamin.domain.OrderVO;

@Repository("orderMMDAO")
public class OrderMMDAOImpl implements OrderMMDAO{

   @Autowired
   private SqlSessionTemplate mybatis;
	  
   //상품정보
	@Override
	public List<OrderVO> productList(OrderVO vo) {
		System.out.println("===>  DietMapper productList() 호출");
		return mybatis.selectList("orderSearch.productList", vo);
	}

	//회원정보
	@Override
	public List<OrderVO> userinfoList(OrderVO vo) {
		System.out.println("===>  DietMapper userinfoList() 호출");
		return mybatis.selectList("orderSearch.userinfoList", vo);
	}

}
