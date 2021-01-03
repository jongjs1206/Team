package com.vitamin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitamin.domain.CategoryjoinVO;
import com.vitamin.domain.OptionVO;
import com.vitamin.domain.OrderVO;
import com.vitamin.domain.ProductVO;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<ProductVO> productlist(ProductVO vo) {
		System.out.println("===>  ProductMapper productlist() 호출");
		return mybatis.selectList("product.productlist", vo);
	}

	@Override
	public List<CategoryjoinVO> menulist(CategoryjoinVO vo) {
		System.out.println("===>  ProductMapper menulist() 호출");
		System.out.println(vo.getP_costprice());
		System.out.println(vo.getP_sellprice());
		return mybatis.selectList("product.list", vo);
	}

	@Override
	public int allcount(ProductVO vo) {
		System.out.println("===>  ProductMapper allcount 호출");
		return mybatis.selectOne("product.count",vo.getCa_smallcate());
	}
	@Override
	public int allcount2(CategoryjoinVO vo) {
		System.out.println("===>  ProductMapper allcount 호출");
		return mybatis.selectOne("product.count2",vo.getCa_largecate());
	}

	@Override
	public List<OptionVO> goodviewOption(int number) {
		System.out.println("===>  ProductMapper option 호출");
		return mybatis.selectList("product.option",number);
	}
	
	@Override
	public ProductVO goodview(int number) {
		System.out.println("===>  ProductMapper goodview 호출");
		return mybatis.selectOne("product.goodview",number);
	}

	@Override
	public List<CategoryjoinVO> searchlist(CategoryjoinVO vo) {
		System.out.println("===>  ProductMapper searchlist 호출");
		return mybatis.selectList("product.searchlist",vo);
	}

	@Override
	public int searchcount(CategoryjoinVO vo) {
		System.out.println("===>  ProductMapper searchcount 호출");
		return mybatis.selectOne("product.searchcount",vo);
	}

	@Override
	public List<CategoryjoinVO> orderlist(CategoryjoinVO vo) {
		System.out.println("===>  ProductMapper orderlist 호출");
		return mybatis.selectList("product.orderlist",vo);
	}
	
	@Override
	public OptionVO goodoption(String opnum1) {
		System.out.println("===>  ProductMapper goodoption 호출");
		return mybatis.selectOne("product.optioninfo",opnum1);
	}

	@Override
	public List<ProductVO> goodslist(ProductVO vo) {
		System.out.println("===>  ProductMapper goodslist() 호출");
		return mybatis.selectList("product.goodslist", vo);
	}

	@Override
	public void insertorder(CategoryjoinVO vo) {
		System.out.println("===>  ProductMapper insertorder() 호출");
		mybatis.insert("product.insertorder", vo);
	}

	@Override
	public void supdategrade(String id) {
		System.out.println("===>  ProductMapper supdategrade() 호출");
		mybatis.update("product.supdategrade", id);
		
	}

	@Override
	public void gupdategrade(String id) {
		System.out.println("===>  ProductMapper gupdategrade() 호출");
		mybatis.insert("product.gupdategrade", id);
		
	}

	@Override
	public void vupdategrade(String id) {
		System.out.println("===>  ProductMapper vupdategrade() 호출");
		mybatis.insert("product.vupdategrade", id);
	}

	@Override
	public void addmile(CategoryjoinVO vo) {
		System.out.println("===>  ProductMapper addmile() 호출");
		mybatis.insert("product.addmile", vo);
		
	}
	
	@Override
	public void submile(CategoryjoinVO vo) {
		System.out.println("===>  ProductMapper submile() 호출");
		mybatis.insert("product.submile", vo);
		
	}
}
