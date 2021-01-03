package com.vitamin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chartDAO")
public class ChartDAOImpl implements ChartDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<Map<String,Object>> getmonthsalesdata() {
		return mybatis.selectList("chartdata.getmonthsalesdata");
	}

	@Override
	public List<Map<String, Object>> getdaysalesdata() {
		return mybatis.selectList("chartdata.getdaysalesdata");
	}

	@Override
	public List<Map<String, Object>> getcategorycount() {
		return mybatis.selectList("chartdata.getcategorycount");
	}

	@Override
	public List<Map<String, Object>> gethitfivepname() {
		return mybatis.selectList("chartdata.gethitfivepname");
	}

	@Override
	public Map<String, Object> getmaindata() {
		Map map = new HashMap();
		
		
		int monthtotalprice = mybatis.selectOne("chartdata.monthtotalsale");
		System.out.println("월 매출 합계"+monthtotalprice);
		int daytotalprice = mybatis.selectOne("chartdata.daytotalsale");
		System.out.println("일 매출 합계"+daytotalprice);	
		double userdelcount = mybatis.selectOne("chartdata.userdelcount");
		double usercount = mybatis.selectOne("chartdata.usercount");
		System.out.println("탈퇴수"+userdelcount);
		System.out.println("회원수"+usercount);
		double userkeeprate = ((usercount/(usercount+userdelcount))*100);
		System.out.println("회원유지율" + userkeeprate);
		
		map.put("monthtotalprice", monthtotalprice);
		map.put("daytotalprice", daytotalprice);
		map.put("userkeeprate", String.format("%.2f", userkeeprate));
		
		return map;
	}

}
