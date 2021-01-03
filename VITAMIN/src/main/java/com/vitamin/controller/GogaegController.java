package com.vitamin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitamin.domain.GogaegVO;
import com.vitamin.service.GogaegService;

@Controller
public class GogaegController{

	@Autowired
	private GogaegService gogaegService;
	

	
	// 글 목록 
	@RequestMapping("/GogaegList.do")
	public Map getGogaegList(Model model) {	

		List<GogaegVO> list = gogaegService.getGogaegList();
		
		for(GogaegVO data : list ) {
			System.out.println(data);
		}
		Map map = new HashMap();
        map.put("gogaegList", list);
        
        return map;
		
	}


	@RequestMapping(value = "/saveBoard.do")
	public String insertGogaeg(GogaegVO vo) throws IOException {
		gogaegService.insertGogaeg(vo);
		return "redirect:/GogaegList.do";
	}




	@RequestMapping("/deleteGogaeg.do")
	public String deleteGogaeg(GogaegVO vo) {
		gogaegService.deleteGogaeg(vo);
		return "redirect:/GogaegList.do";
	}

	
	@RequestMapping("/getGogaeg.do")
	public void getGogaeg(GogaegVO vo, Model model) {
		System.out.println("호출");
		model.addAttribute("gogaeg", gogaegService.getGogaeg(vo)); // Model 정보 저장			
	}

	

}
	

