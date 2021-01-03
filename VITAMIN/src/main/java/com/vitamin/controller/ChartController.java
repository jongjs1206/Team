package com.vitamin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vitamin.service.ChartService;

@Controller
public class ChartController {
	
	@Autowired
	private ChartService chartService;

	@RequestMapping("admin_view/getmaindata.do")
	@ResponseBody
	public Map getmaindata() {
		System.out.println("메인데이타 요청");
		
        
		Map map = chartService.getmaindata();
		
		return map;
	}
	
	
	@RequestMapping("admin_view/adminmain.do")
	public void viewadminmainPage() {
		System.out.println("어드민메인를 요청");
	}
	@RequestMapping("admin_view/getmonthsalesdata.do")
	@ResponseBody
	public List<Map<String,Object>> getmonthsalesdata() {
		System.out.println("월별판매 데이터를 요청");
		List<Map<String,Object>> list = chartService.getmonthsalesdata();
		for(Map<String, Object> data : list ) {
//			System.out.println(data.get("TOTALPRICE"));
//			System.out.println(data.get("MONTH_DATE"));
			
			System.out.println(data);
		}
//		Map map = new HashMap();
//        map.put("list", list);
       
        
        return list;
	}
	@RequestMapping("admin_view/getdaysalesdata.do")
	@ResponseBody
	public List<Map<String,Object>> getdaysalesdata() {
		System.out.println("일별판매 데이터를 요청");
		List<Map<String,Object>> list = chartService.getdaysalesdata();
		for(Map<String, Object> data : list ) {
			System.out.println(data.get("TOTALPRICE"));
			System.out.println(data.get("DAY_DATE"));
			
			System.out.println(data);
		}
        return list;
	}
	@RequestMapping("admin_view/getcategorycount.do")
	@ResponseBody
	public List<Map<String,Object>> getcategorycount() {
		System.out.println("카테고리별 판매량을 요청");
		List<Map<String,Object>> list = chartService.getcategorycount();
		for(Map<String, Object> data : list ) {
			System.out.println(data.get("CATE"));
			System.out.println(data.get("COUNT"));
			
			System.out.println(data);
		}
        return list;
	}
	@RequestMapping("admin_view/gethitfivepname.do")
	@ResponseBody
	public List<Map<String,Object>> gethitfivepname() {
		System.out.println("top5 상품 요청");
		List<Map<String,Object>> list = chartService.gethitfivepname();
		for(Map<String, Object> data : list ) {
			System.out.println(data.get("PNAME"));
			System.out.println(data.get("COUNT"));
			
			System.out.println(data);
		}
        return list;
	}
	
	
	
}
