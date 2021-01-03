package com.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitamin.dao.BasketDAOImpl;
import com.vitamin.domain.CategoryjoinVO;
import com.vitamin.domain.OptionVO;
import com.vitamin.domain.ProductVO;

@Service("basketService")
public class BasketServiceImpl implements BasketService{

	@Autowired
	private BasketDAOImpl basketDAO;


	@Override
	public void basketinsert(CategoryjoinVO vo) {
		basketDAO.basketinsert(vo);	
	}


	@Override
	public List<CategoryjoinVO> basketselect(CategoryjoinVO vo) {
		return basketDAO.basketselect(vo);	
	}


	@Override
	public void basketdelect(String id) {
		basketDAO.basketdelect(id);	
	}
}
