package com.vitamin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitamin.domain.DietVO;
import com.vitamin.domain.OrderVO;
import com.vitamin.service.OrderMMService;
import com.vitamin.service.OrderService;

@Controller
public class OrderMMController {
	

	   @Autowired
	   private OrderMMService OrderMMService;

	   // 주문내역 검색
	   @RequestMapping("orderM.do")
	   public void AllordersearchList(HttpSession session, Model model ,int o_num){
		   int num = o_num;
		   OrderVO vo = new OrderVO();
		   vo.setO_num(num);
		   List<OrderVO> productlist = OrderMMService.productList(vo);//상품오더리스트
		   System.out.println(productlist);
		   model.addAttribute("productlist",productlist );
		   model.addAttribute("totalprice",(productlist.get(0).getP_sellprice() * productlist.get(0).getO_count())+3000);
		   									//				(하나의 가격 			* 갯수) + 베송비
		   model.addAttribute("prductprice",(productlist.get(0).getP_sellprice() * productlist.get(0).getO_count()));
		   List<OrderVO> userinfolist = OrderMMService.userinfoList(vo);
		   model.addAttribute("userinfolist", userinfolist);
		   System.out.println(userinfolist);
		   
		   
		   
		   

	   }
	   //1. 넘버를 이용해서 리스트를 뿌린다
	   //2-1. 하나하나 모델로 넘겨준다/리스트도 넘겨준다
	   //2-2. Map<String,Object> map = new HashMap<>(); map.put("key",value); <- 이거를 모델 넣는다
	   //3. p_price (토탈가격) 서비스에서 만들어준다
	   //서비스에서 list 안에 있는 sellprice들의 총합을 만들어준다
	   //int sum = 0;
	   //for(int i=0;i<list.size();i++){
	   //	sum = sum + list.get(i).getP_sellprice();
	   //}model.add("totalprice",sum);
	   
	   //안되면 그냥 던진다
	   //조인을 최대한 이용한다(맵퍼에서)
	   //뷰 -> 컨트롤 , 컨트롤 -> 뷰 (데이터)
	   //여기에 너무 몰입하지 말것
}
