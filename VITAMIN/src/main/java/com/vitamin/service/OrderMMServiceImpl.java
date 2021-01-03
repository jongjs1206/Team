package com.vitamin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitamin.dao.OrderMMDAO;
import com.vitamin.domain.OrderVO;

@Service("OrderMMService")
public class OrderMMServiceImpl implements OrderMMService{

	   @Autowired
	   private OrderMMDAO orderMMDAO;
	   
	   @Override//상품리스트
	   public List<OrderVO> productList(OrderVO vo) {
		 List<OrderVO> list = new ArrayList<>();
		    list = orderMMDAO.productList(vo);
		    return list;
	}

	   @Override//회원정보
	   public List<OrderVO> userinfoList(OrderVO vo) {
		   List<OrderVO> list = new ArrayList<>();
	    	list = orderMMDAO.userinfoList(vo);
	    	return list;
	}

}
