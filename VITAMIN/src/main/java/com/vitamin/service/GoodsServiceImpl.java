package com.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitamin.dao.GoodsDAOImpl;
import com.vitamin.domain.CategoryjoinVO;
import com.vitamin.domain.OptionVO;
import com.vitamin.domain.OrderVO;
import com.vitamin.domain.ProductVO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsDAOImpl goodsDAO;

	@Override
	public List<ProductVO> productlist(ProductVO vo) {
		return goodsDAO.productlist(vo);
	}

	@Override
	public List<CategoryjoinVO> menulist(CategoryjoinVO vo) {
		return goodsDAO.menulist(vo);
	}

	@Override
	public int allcount(ProductVO vo) {
		return goodsDAO.allcount(vo);
	}
	
	@Override
	public int allcount2(CategoryjoinVO vo) {
		return goodsDAO.allcount2(vo);
	}

	@Override
	public List<OptionVO> goodviewOption(int number) {
		return goodsDAO.goodviewOption(number);
	}
	
	@Override
	public ProductVO goodview(int number) {
		return goodsDAO.goodview(number);
	}

	@Override
	public List<CategoryjoinVO> searchlist(CategoryjoinVO vo) {
		return goodsDAO.searchlist(vo);
	}
	
	@Override
	public int searchcount(CategoryjoinVO vo) {
		return goodsDAO.searchcount(vo);
	}

	@Override
	public List<CategoryjoinVO> orderlist(CategoryjoinVO vo) {
		return goodsDAO.orderlist(vo);
	}
	
	@Override
	public OptionVO goodoption(String opnum1) {
		return goodsDAO.goodoption(opnum1);
	}

	@Override
	public List<ProductVO> goodslist(ProductVO vo) {
		return goodsDAO.goodslist(vo);
	}

	@Override
	public void insertorder(CategoryjoinVO vo) {
		goodsDAO.insertorder(vo);
	}

	@Override
	public void supdategrade(String id) {
		goodsDAO.supdategrade(id);
		
	}

	@Override
	public void gupdategrade(String id) {
		goodsDAO.gupdategrade(id);
		
	}

	@Override
	public void vupdategrade(String id) {
		goodsDAO.vupdategrade(id);
		
	}

	@Override
	public void addmile(CategoryjoinVO vo) {
		goodsDAO.addmile(vo);
		
	}
	@Override
	public void submile(CategoryjoinVO vo) {
		goodsDAO.submile(vo);
		
	}
}
