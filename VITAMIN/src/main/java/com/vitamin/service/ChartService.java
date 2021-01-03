package com.vitamin.service;

import java.util.List;
import java.util.Map;

public interface ChartService {

	public List<Map<String,Object>> getmonthsalesdata();
	public List<Map<String,Object>> getdaysalesdata();
	public List<Map<String,Object>> getcategorycount();
	public List<Map<String,Object>> gethitfivepname();
	public Map<String,Object> getmaindata();
}
