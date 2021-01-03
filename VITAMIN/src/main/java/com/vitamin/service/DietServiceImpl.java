package com.vitamin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitamin.dao.DietDAO;
import com.vitamin.domain.DietVO;
import com.vitamin.domain.OrderVO;
import com.vitamin.domain.UserVO;

@Service("DietService")
public class DietServiceImpl implements DietService{
	@Autowired
	private DietDAO dietdao;

	@Override
	public List<DietVO> dietList(DietVO vo) {
		List<DietVO> dietList = dietdao.dietList(vo);
		String[] season = {"아침","점심","저녁"};
		for(int i=0;i<dietList.size();i++) {
			dietList.get(i).setD_season(season[i]);
		}
		return dietList;
	}

	@Override
	public List<DietVO> dietuserList(DietVO vo) {
		 List<DietVO> list = new ArrayList<>();
		    list = dietdao.dietuserList(vo);
		    return list;
	}

	@Override
	public List<DietVO> age(DietVO vo) {
		List<DietVO> list = new ArrayList<>();
	    list = dietdao.age(vo);
	    return list;
	}

//	@Override
//	public List<DietVO>  age(Map map) {
//		List<DietVO>  age = dietdao.age(map);
//		return age;
//	}



}
