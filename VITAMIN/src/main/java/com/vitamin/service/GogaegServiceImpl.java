package com.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitamin.dao.GogaegDAOImpl;
import com.vitamin.domain.GogaegVO;




@Service("GogaegService")
public class GogaegServiceImpl implements GogaegService {
	@Autowired
	private GogaegDAOImpl GogaegDAO;

	public void insertGogaeg(GogaegVO vo) {

		GogaegDAO.insertGogaeg(vo);
	}

	public void updateGogaeg(GogaegVO vo) {
		GogaegDAO.updateGogaeg(vo);
	}

	public void deleteGogaeg(GogaegVO vo) {
		GogaegDAO.deleteGogaeg(vo);
	}

	public GogaegVO getGogaeg(GogaegVO vo) {
		return GogaegDAO.getGogaeg(vo);
	}

	public List<GogaegVO> getGogaegList() {
		return GogaegDAO.getGogaegList();
	}
}