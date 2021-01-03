package com.vitamin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitamin.domain.GogaegVO;



@Repository("GogaegDAO") 
public class GogaegDAOImpl implements GogaegDAO{
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertGogaeg(GogaegVO vo) {
		System.out.println("Mybatis insertGogaeg");
		mybatis.insert("GogaegDAO.insertGogaeg", vo);
	}

	public void updateGogaeg(GogaegVO vo) {
		System.out.println(" Mybatis updateGogaeg ");
		mybatis.update("GogaegDAO.updateGogaeg", vo);
	}

	public void deleteGogaeg(GogaegVO vo) {
		System.out.println(" Mybatis deleteGogaeg ");
		mybatis.delete("GogaegDAO.deleteGogaeg", vo);
	}

	public GogaegVO getGogaeg(GogaegVO vo) {
		System.out.println(" Mybatis getGogaeg ");
		return (GogaegVO) mybatis.selectOne("GogaegDAO.getGogaeg", vo);
	}

	public List<GogaegVO> getGogaegList() {
		System.out.println("Mybatis getGogaegList ");
		return mybatis.selectList("GogaegDAO.getGogaegList");
	}
}