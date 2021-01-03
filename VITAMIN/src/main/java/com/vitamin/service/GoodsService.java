package com.vitamin.service;

import java.util.List;

import com.vitamin.domain.CategoryjoinVO;
import com.vitamin.domain.OptionVO;
import com.vitamin.domain.OrderVO;
import com.vitamin.domain.ProductVO;

public interface GoodsService {
	public List<ProductVO> productlist(ProductVO vo);
	public List<CategoryjoinVO> menulist(CategoryjoinVO vo);
	public int allcount(ProductVO vo);
	public int allcount2(CategoryjoinVO vo);
	public List<OptionVO> goodviewOption(int number);
	public ProductVO goodview(int number);
	public List<CategoryjoinVO> searchlist(CategoryjoinVO vo);
	public int searchcount(CategoryjoinVO vo);
	public List<CategoryjoinVO> orderlist(CategoryjoinVO vo);
	public OptionVO goodoption(String opnum1);
	public List<ProductVO> goodslist(ProductVO vo);
	public void insertorder(CategoryjoinVO vo);
	public void supdategrade(String id);
	public void gupdategrade(String id);
	public void vupdategrade(String id);
	public void addmile(CategoryjoinVO vo);
	public void submile(CategoryjoinVO vo);
}
