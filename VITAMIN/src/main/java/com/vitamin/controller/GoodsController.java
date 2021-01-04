package com.vitamin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitamin.domain.CategoryjoinVO;
import com.vitamin.domain.OptionVO;
import com.vitamin.domain.ProductVO;
import com.vitamin.domain.PsImageVO;
import com.vitamin.service.GoodsService;
import com.vitamin.service.ProductService;


@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private ProductService productService;
	
	/*
	 * 상품리스트로 가는 코드
	 */
	@RequestMapping("goods.do")
	public Map menu(String menu,String category,String search,String hs,String page) {
		ProductVO vo = new ProductVO();
		CategoryjoinVO cvo = new CategoryjoinVO();
		
		//페이징 코드
		vo.setP_costprice((Integer.parseInt(page)-1)*15+1);
		cvo.setP_costprice((Integer.parseInt(page)-1)*15+1);
		vo.setP_sellprice((Integer.parseInt(page)-1)*15+15);
		cvo.setP_sellprice((Integer.parseInt(page)-1)*15+15);
		
		//남는 VO변수에 정렬할 값을 구분시킴
		if("a".equals(search)) {
			vo.setP_content("a");
			cvo.setP_content("a");
		}else if("b".equals(search)) {	
			vo.setP_content("b");
			cvo.setP_content("b");
		}else if("c".equals(search)) {	
			vo.setP_content("c");	
			cvo.setP_content("c");	
		}
		
		//hs는 검색한 값이 들어온다. 남는 VO변수에 넣었다.
		if(hs!=null) {
			cvo.setP_postdate(hs);
			List<CategoryjoinVO> list = goodsService.searchlist(cvo);
			int count= goodsService.searchcount(cvo);
			Map map = new HashMap();
			map.put("list", list);
			map.put("count", count);
			return map;
		}else {
			if(category!=null) {
				vo.setCa_smallcate(category);
				List<ProductVO> list = goodsService.goodslist(vo);
				int count= goodsService.allcount(vo);
				Map map = new HashMap();
				map.put("goodsList", list);
				map.put("count", count);
				return map;
			}
			else {
				cvo.setCa_largecate(menu);
				List<CategoryjoinVO> list = goodsService.menulist(cvo);
				int count= goodsService.allcount2(cvo);
				Map map = new HashMap();
				map.put("list", list);
				map.put("count", count);
				return map;
			}
		}
	}
	
	/*
	 * 상품 상세보기로 가는 코드
	 */
	@RequestMapping("goods_detail.do")
	public Map detail(int number) {
		List<OptionVO> option = goodsService.goodviewOption(number);
		ProductVO result = goodsService.goodview(number);
		List<PsImageVO> imgresult = productService.getImage(Integer.toString(number));
		
		Map map = new HashMap();
		map.put("option", option);
		map.put("view", result);
		map.put("imgresult", imgresult);
		return map;
	}
	
}
