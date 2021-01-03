package com.vitamin.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitamin.domain.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO{

   @Autowired
   private SqlSessionTemplate mybatis;
   
 //주문번호별 조회
   @Override
   public List<OrderVO> orderMlist(OrderVO vo) {
      System.out.println("===>  OrderMapper orderMlist() 호출");      
      return mybatis.selectList("orderSearch.orderMlist", vo);
   }
   //날짜별
	@Override
	public List<OrderVO> orderDay(OrderVO vo) {
		System.out.println("===>  OrderMapper orderDay() 호출");      
	      return mybatis.selectList("orderSearch.orderDay", vo);
	}
	//취소주문조회
	@Override
	public List<OrderVO> orderCancelList(OrderVO vo) {
		 System.out.println("===>  OrderMapper orderCancelList() 호출");      
	     return mybatis.selectList("orderSearch.orderCancelList", vo);
	}
	
	//비회원
	@Override
	public List<OrderVO> BMlist(OrderVO vo) {
		 System.out.println("===>  OrderMapper BMlist() 호출");      
	     return mybatis.selectList("orderSearch.BMlist", vo);
	}
	
	//비회원 날짜 조회
	@Override
	public List<OrderVO> BMDay(OrderVO vo) {
		System.out.println("===>  OrderMapper BMDay() 호출");      
	     return mybatis.selectList("orderSearch.BMDay", vo);
	}
	
	//비회원 취소주문조회
	@Override
	public List<OrderVO> BMCancelList(OrderVO vo) {
		 System.out.println("===>  OrderMapper BMCancelList() 호출");      
	     return mybatis.selectList("orderSearch.BMCancelList", vo);
	}
	
	//취소 날짜별 조회
	public List<OrderVO> orderDaycancel(OrderVO vo) {
		 System.out.println("===>  OrderMapper orderDaycancel() 호출");      
	     return mybatis.selectList("orderSearch.orderDaycancel", vo);
	}
	
	//비회원 취소 날짜별 조회
	public List<OrderVO> BMDaycancel(OrderVO vo) {
		 System.out.println("===>  OrderMapper BMDaycancel() 호출");      
	     return mybatis.selectList("orderSearch.BMDaycancel", vo);
	}


	@Override
	public void orderstateupdate(String updateordernum, String orderstate) {
		OrderVO vo = new OrderVO();
		vo.setO_num(Integer.parseInt(updateordernum));
		vo.setO_delivery(orderstate);
		
		
		int result = mybatis.update("orderSearch.orderstateupdate",vo);
		
		System.out.println(result);
	}

	//취소
	@Override
	public void orderstatecancle(String updateordernum, String orderstate) {
		OrderVO vo = new OrderVO();
		vo.setO_num(Integer.parseInt(updateordernum));
		vo.setO_delivery(orderstate);
		
		int result = mybatis.update("orderSearch.orderstatecancle",vo);
		
		System.out.println(result);		
	}

	@Override
	public Map<String, Object> getorderinfo(String o_num) {
		System.out.println("겟오더인포 다오 까지옴");
		Map<String, Object> map = new HashMap();
		Map<String, Object> tempmap = mybatis.selectOne("orderSearch.getorderinfo",o_num);
		
		if(tempmap ==null) {
			return map;
		}
		map = tempmap;
		
		System.out.println(map.get("PO_OPTIONNAME"));
		System.out.println(map.get("O_NAME"));
		
		
		return map;
	}





}