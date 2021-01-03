package com.vitamin.dao;

import java.util.List;
import java.util.Map;

import com.vitamin.domain.DietVO;
import com.vitamin.domain.OrderVO;


public interface OrderMMDAO {

	//상품조회
	List<OrderVO> productList(OrderVO vo) ;
	
	//회원정보
	List<OrderVO> userinfoList(OrderVO vo) ;
	
}
