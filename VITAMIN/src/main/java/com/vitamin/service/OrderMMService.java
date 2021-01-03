package com.vitamin.service;

import java.util.List;

import com.vitamin.domain.OrderVO;



public interface OrderMMService {

	//상품조회
		public List<OrderVO> productList(OrderVO vo);
		
	//회원조회
		public List<OrderVO> userinfoList(OrderVO vo);
}
