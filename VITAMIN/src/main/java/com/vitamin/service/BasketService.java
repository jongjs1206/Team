package com.vitamin.service;

import java.util.List;

import com.vitamin.domain.CategoryjoinVO;
import com.vitamin.domain.OptionVO;
import com.vitamin.domain.ProductVO;

public interface BasketService {
	public void basketinsert(CategoryjoinVO vo);
	public List<CategoryjoinVO> basketselect(CategoryjoinVO vo);
	public void basketdelect(String id);
}
