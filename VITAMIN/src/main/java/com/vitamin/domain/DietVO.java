package com.vitamin.domain;

import java.util.Date;

public class DietVO {
	private String d_season;  	//아침,점심,저녁
	private int d_num;		  	//번호
	private String d_name;		//식단내용
	private String d_type;		//체형타입
	private Date d_date;		//날짜
	private int d_calorie;		//킬로리
	private String u_id;
	private String u_name;	//이름
	private int u_height;	//키
	private int u_weight;	//몸무게
	private String u_idnum;	//주민
	
	public DietVO() {}

	public String getD_season() {
		return d_season;
	}

	public void setD_season(String d_season) {
		this.d_season = d_season;
	}

	public int getD_num() {
		return d_num;
	}

	public void setD_num(int d_num) {
		this.d_num = d_num;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	public String getD_type() {
		return d_type;
	}

	public void setD_type(String d_type) {
		this.d_type = d_type;
	}

	public Date getD_date() {
		return d_date;
	}

	public void setD_date(Date d_date) {
		this.d_date = d_date;
	}

	public int getD_calorie() {
		return d_calorie;
	}

	public void setD_calorie(int d_calorie) {
		this.d_calorie = d_calorie;
	}

	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public int getU_height() {
		return u_height;
	}

	public void setU_height(int u_height) {
		this.u_height = u_height;
	}

	public int getU_weight() {
		return u_weight;
	}

	public void setU_weight(int u_weight) {
		this.u_weight = u_weight;
	}

	public String getU_idnum() {
		return u_idnum;
	}

	public void setU_idnum(String u_idnum) {
		this.u_idnum = u_idnum;
	}

	@Override
	public String toString() {
		return "DietVO [d_season=" + d_season + ", d_num=" + d_num + ", d_name=" + d_name + ", d_type=" + d_type
				+ ", d_date=" + d_date + ", d_calorie=" + d_calorie + ", u_id=" + u_id + ", u_name=" + u_name
				+ ", u_height=" + u_height + ", u_weight=" + u_weight + ", u_idnum=" + u_idnum + "]";
	}




	
	
}
