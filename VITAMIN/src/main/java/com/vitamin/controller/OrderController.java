package com.vitamin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vitamin.domain.OrderVO;
import com.vitamin.service.OrderService;

@Controller
public class OrderController {

   @Autowired
   private OrderService orderservice;

   // 주문내역 검색
   @RequestMapping("Ordercheck.do")
   public void AllordersearchList(HttpSession session, Model model ,
       String o_startDate,String o_endDate,String o_tel,String o_name){
         List<OrderVO> list = new ArrayList<>();
         
	   if (session.getAttribute("id") != null) {//회원
         String id = (String) session.getAttribute("id");
         OrderVO vo = new OrderVO();
         vo.setU_id(id);
         if(o_startDate == null){ //날짜가 없다
            list = orderservice.orderMlist(vo);//전체검색
            }
	   else{//날짜가 있다
           vo.setO_startDate(o_startDate);
           vo.setO_endDate(o_endDate);
           list = orderservice.orderDay(vo);//날짜검색
            }
        }else if(session.getAttribute("id") == null){//비회원
            OrderVO vo = new OrderVO();
            vo.setO_name(o_name);
            vo.setO_tel(o_tel);
            System.out.println("비회원");
            System.out.println(o_name);
            System.out.println(o_tel);
            list = new ArrayList<>();
          if(o_startDate == null){ //날짜가 없다
               list = orderservice.BMlist(vo);//전체검색
               System.out.println(list);
              
            }else{//날짜가 있다
            	vo.setO_startDate(o_startDate);
                vo.setO_endDate(o_endDate);
                list = orderservice.BMDay(vo);//날짜검색
               
           }
            //model.addAttribute("OrderSearchList", list);
         }
	   
	   model.addAttribute("o_name", o_name);
	   model.addAttribute("o_tel", o_tel);
	   model.addAttribute("OrderSearchList", list);


   }
   
     //주문취소/반품 리스트
     @ResponseBody
     @RequestMapping(value = "Ordercheck.do", method = RequestMethod.POST)
     public List<OrderVO> cancelordersearchList(HttpSession session, Model model,
    		 String o_name, String o_tel, String o_startDate, String o_endDate) {
         List<OrderVO> list = new ArrayList<>();
         OrderVO vo = new OrderVO(); 
         System.out.println(o_name);
         System.out.println(o_tel);
         if(session.getAttribute("id")!=null) {
           String id = (String) session.getAttribute("id"); 
           vo.setU_id(id); 
           
           if(o_startDate == null){
        	   list = orderservice.orderCancelList(vo);
        	   System.out.println(list); 
           }
           else{//날짜가 있다
               vo.setO_startDate(o_startDate);
               vo.setO_endDate(o_endDate);
               list = orderservice.orderDaycancel(vo);//날짜별 회원 주문취소
            
           }
           
         }else {//비회원
             vo.setO_name(o_name);
             vo.setO_tel(o_tel);
             
             if(o_startDate == null){
            	 list = orderservice.BMCancelList(vo);
            	 System.out.println(list);
             }
             else{//날짜가 있다
                 vo.setO_startDate(o_startDate);
                 vo.setO_endDate(o_endDate);
                 list = orderservice.BMDaycancel(vo);//날짜별 비회원 주문취소
              
             }
         }
         
      return list;
     }

}