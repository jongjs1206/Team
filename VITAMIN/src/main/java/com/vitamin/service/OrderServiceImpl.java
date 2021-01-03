package com.vitamin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitamin.dao.OrderDAO;
import com.vitamin.domain.OrderVO;

@Service("OrderService")
public class OrderServiceImpl implements OrderService{
   
   @Autowired
   private OrderDAO orderDAO;



   @Override
   public List<OrderVO> orderMlist(OrderVO vo) {
      List<OrderVO> list = new ArrayList<>();
      list = orderDAO.orderMlist(vo);
      return list;
   }


	@Override
	public List<OrderVO> orderDay(OrderVO vo) {
	    List<OrderVO> list = new ArrayList<>();
	    list = orderDAO.orderDay(vo);
	    return list;
	}


	@Override
	public List<OrderVO> orderCancelList(OrderVO vo) {
	    List<OrderVO> list = new ArrayList<>();
	      list = orderDAO.orderCancelList(vo);
	      return list;
	}


	@Override
	public List<OrderVO> BMlist(OrderVO vo) {
		 List<OrderVO> list = new ArrayList<>();
	      list = orderDAO.BMlist(vo);
	      return list;
	}


	@Override
	public List<OrderVO> BMDay(OrderVO vo) {
		  List<OrderVO> list = new ArrayList<>();
		    list = orderDAO.BMDay(vo);
		    return list;
	}


	@Override
	public List<OrderVO> BMCancelList(OrderVO vo) {
		 List<OrderVO> list = new ArrayList<>();
		    list = orderDAO.BMCancelList(vo);
		    return list;
	}


	@Override
	public List<OrderVO> orderDaycancel(OrderVO vo) {
		 List<OrderVO> list = new ArrayList<>();
		    list = orderDAO.orderDaycancel(vo);
		    return list;
	}


	@Override
	public List<OrderVO> BMDaycancel(OrderVO vo) {
		 List<OrderVO> list = new ArrayList<>();
		    list = orderDAO.BMDaycancel(vo);
		    return list;
	}


	@Override
	public void orderstateupdate(String updateordernum, String orderstate) {
		orderDAO.orderstateupdate(updateordernum,orderstate);
	}


	@Override
	public void orderstatecancle(String updateordernum, String orderstate) {
		orderDAO.orderstatecancle(updateordernum,orderstate);		
	}


	@Override
	public Map<String, Object> getorderinfo(String o_num) {
		return orderDAO.getorderinfo(o_num);
	}

}