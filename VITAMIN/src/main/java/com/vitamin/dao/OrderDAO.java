package com.vitamin.dao;


import java.util.List;
import java.util.Map;

import com.vitamin.domain.OrderVO;


public interface OrderDAO {
	//전체조회
	   List<OrderVO> orderMlist(OrderVO vo);
	   
	   //전체 날짜별 조회
	   List<OrderVO> orderDay(OrderVO vo);
	   
	   //취소주문전체조회
	   List<OrderVO> orderCancelList(OrderVO vo);
	   
	   //취소 날짜별 조회
	   List<OrderVO> orderDaycancel(OrderVO vo);
	   
	   //비회원조회
	   List<OrderVO> BMlist(OrderVO vo);
	   
	   //비회원 날짜별 조회
	   List<OrderVO> BMDay(OrderVO vo);
	   
	   //비회원 취소주문전체조회
	   List<OrderVO> BMCancelList(OrderVO vo);
	   
	  //비회원 취소 날짜별 조회
	   List<OrderVO> BMDaycancel(OrderVO vo);


    void orderstateupdate(String updateordernum, String orderstate);
    void orderstatecancle(String updateordernum, String orderstate);

	Map<String, Object> getorderinfo(String o_num);

}