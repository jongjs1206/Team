package com.vitamin.dao;

import java.util.List;

import com.vitamin.domain.CategoryjoinVO;
import com.vitamin.domain.OptionVO;
import com.vitamin.domain.OrderVO;
import com.vitamin.domain.ProductVO;

public interface GoodsDAO {
	
	/*
	 * 상품 목록 불러오기
	 */
	List<ProductVO> productlist(ProductVO vo);
	List<CategoryjoinVO> menulist(CategoryjoinVO vo);
	int allcount(ProductVO vo);
	int allcount2(CategoryjoinVO vo);
	List<OptionVO> goodviewOption(int number);
	ProductVO goodview(int number);
	List<CategoryjoinVO> searchlist(CategoryjoinVO vo);
	int searchcount(CategoryjoinVO vo);
	List<CategoryjoinVO> orderlist(CategoryjoinVO vo);
	OptionVO goodoption(String opnum1);
	List<ProductVO> goodslist(ProductVO vo);
	void insertorder(CategoryjoinVO vo);
	void supdategrade(String id);
	void gupdategrade(String id);
	void vupdategrade(String id);
	void addmile(CategoryjoinVO vo);
	void submile(CategoryjoinVO vo);
}
