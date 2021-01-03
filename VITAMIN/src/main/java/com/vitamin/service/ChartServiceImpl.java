package com.vitamin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitamin.dao.BasketDAOImpl;
import com.vitamin.dao.ChartDAO;

@Service("chartService")
public class ChartServiceImpl implements ChartService{

	
	@Autowired
	private ChartDAO chartDAO;

	@Override
	public List<Map<String,Object>> getmonthsalesdata() {
		return chartDAO.getmonthsalesdata();
	}

	@Override
	public List<Map<String, Object>> getdaysalesdata() {
		return chartDAO.getdaysalesdata();
	}

	@Override
	public List<Map<String, Object>> getcategorycount() {
		return chartDAO.getcategorycount();
	}

	@Override
	public List<Map<String, Object>> gethitfivepname() {
		return chartDAO.gethitfivepname();
	}

	@Override
	public Map<String, Object> getmaindata() {
		return chartDAO.getmaindata();
	}
	
}
