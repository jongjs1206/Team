package com.vitamin.dao;

import java.util.List;

import com.vitamin.domain.CategoryjoinVO;

public interface BasketDAO {
	
	/*
	 * 상품 목록 불러오기
	 */
	void basketinsert(CategoryjoinVO vo);
	List<CategoryjoinVO> basketselect(CategoryjoinVO vo);
	void basketdelect(String id);
}
