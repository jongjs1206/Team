package com.vitamin.dao;

import java.util.List;
import java.util.Map;

import com.vitamin.domain.DietVO;

public interface DietDAO {
	//랜덤조회
	public List<DietVO> dietList(DietVO vo);
	
	//회원조회
	List<DietVO> dietuserList(DietVO vo) ;
	
	//나이조회
//	public List<DietVO>  age(Map map);
	
	//나이조회
	List<DietVO> age(DietVO vo) ;
	
	
}
