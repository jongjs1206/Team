package com.vitamin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitamin.domain.DietVO;
import com.vitamin.domain.UserVO;
import com.vitamin.service.DietService;
import com.vitamin.service.UserService;



@Controller
@Component
public class DietController {
	
	@Autowired
	private DietService dietservice;
	@Autowired
	private UserService userService;
		
	
	@Scheduled(fixedDelay = 1000)
	public void diet(Model model) {
		System.out.println("스케줄");
		String d_type = "고도비만";
		DietVO vo = new DietVO();
		vo.setD_type(d_type);
		List<DietVO> dietList = dietservice.dietList(vo);
		System.out.println(dietList);
		model.addAttribute("diet",dietList );
	}
	
	//체형별 추천 식단
	@RequestMapping("healthCare.do")
	public void dietlist(Model model,HttpSession session) {
		if (session.getAttribute("id") != null) {
			DietVO vo = new DietVO();
			String id = (String) session.getAttribute("id");
			vo.setU_id(id);
			List<DietVO> dietuserList = dietservice.dietuserList(vo);
			System.out.println(dietuserList);
			model.addAttribute("dietuserList", dietuserList);
			

			Map map = new HashMap();
			for(int i=0;i<dietuserList.size();i++){
				String dList = dietuserList.get(i).getU_idnum();
				String day = dList.substring(0, 14);
				System.out.println(day);
				vo.setU_idnum(day);
			}
			List<DietVO> age = dietservice.age(vo);
			System.out.println(age);
			model.addAttribute("age", age);
			
//			List<DietVO> age = dietservice.age(vo);
//			System.out.println(age);
//			model.addAttribute("age", age);
		
			

			String obesity = (String) session.getAttribute("obesity");
			System.out.println(obesity);
			vo.setD_type(obesity);
			List<DietVO> dietList = dietservice.dietList(vo);
			System.out.println(dietList);
			model.addAttribute("type", obesity);//타입
			model.addAttribute("diet",dietList );//식단
	}
	
	}
}
