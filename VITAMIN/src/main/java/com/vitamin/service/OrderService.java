package com.vitamin.service;

import java.util.List;


import java.util.Map;
import com.vitamin.domain.OrderVO;

//주문목록 불러오기
public interface OrderService {

   
	   //주문번호 조회
	   public List<OrderVO> orderMlist(OrderVO vo);
	   //날짜별 조회
	   public List<OrderVO> orderDay(OrderVO vo);
	  // 취소 날짜별 조회
	   public List<OrderVO> orderDaycancel(OrderVO vo);
	  //취소주문번호 조회
	   public List<OrderVO> orderCancelList(OrderVO vo);
	  //비회원 조회
	   public List<OrderVO> BMlist(OrderVO vo);
	   //비회원 날짜 조회
	   public List<OrderVO> BMDay(OrderVO vo);
	   //비회원 취소주문번호 조회
	   public List<OrderVO> BMCancelList(OrderVO vo);
	  //비회원 취소 날짜 조회
	   public List<OrderVO> BMDaycancel(OrderVO vo);
	   
   //주문 상태 수정
   public void orderstateupdate(String updateordernum, String orderstate);
   //주문 취소
   public void orderstatecancle(String updateordernum, String orderstate);
   //주문조회 정보 가져오기 
   public Map<String, Object> getorderinfo(String o_num);
}