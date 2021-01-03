package com.vitamin.dao;

import java.util.List;

import com.vitamin.domain.GogaegVO;

public interface GogaegDAO {
	public void insertGogaeg(GogaegVO vo);

	public void updateGogaeg(GogaegVO vo) ;

	public void deleteGogaeg(GogaegVO vo);

	public GogaegVO getGogaeg(GogaegVO vo) ;

	public List<GogaegVO> getGogaegList() ;
}
