package com.vitamin.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OrderVO {

   private int o_num;
   private String u_id;
   private int p_num;
   private String o_tel;
   private String o_add;
   private int o_count;
   private String o_delivery;
   private Date o_date;
   private int po_optionNum;
   private int o_price;//총가격
   private int p_sellprice;		//판매가
   private String po_optionname;	//옵션명
   private String o_startDate;
   private String o_endDate;
   private String p_name;
   private String o_name;
    
   
   	public OrderVO() {}
   
	public OrderVO(int o_num, String u_id, int p_num, String o_tel, String o_add, int o_count, String o_delivery,
			Date o_date, int po_optionNum, int o_price, int p_sellprice, String po_optionname, String o_startDate,
			String o_endDate, String p_name, String o_name) {
		super();
		this.o_num = o_num;
		this.u_id = u_id;
		this.p_num = p_num;
		this.o_tel = o_tel;
		this.o_add = o_add;
		this.o_count = o_count;
		this.o_delivery = o_delivery;
		this.o_date = o_date;
		this.po_optionNum = po_optionNum;
		this.o_price = o_price;
		this.p_sellprice = p_sellprice;
		this.po_optionname = po_optionname;
		this.o_startDate = o_startDate;
		this.o_endDate = o_endDate;
		this.p_name = p_name;
		this.o_name = o_name;
	}
	
	
	
	public int getO_num() {
		return o_num;
	}
	
	
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	
	
	public String getU_id() {
		return u_id;
	}
	
	
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	
	public int getP_num() {
		return p_num;
	}
	
	
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	
	
	public String getO_tel() {
		return o_tel;
	}
	
	
	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}
	
	
	public String getO_add() {
		return o_add;
	}
	
	
	public void setO_add(String o_add) {
		this.o_add = o_add;
	}
	
	
	public int getO_count() {
		return o_count;
	}
	
	
	public void setO_count(int o_count) {
		this.o_count = o_count;
	}
	
	
	public String getO_delivery() {
		return o_delivery;
	}
	
	
	public void setO_delivery(String o_delivery) {
		this.o_delivery = o_delivery;
	}
	
	
	public Date getO_date() {
		return o_date;
	}
	
	
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	
	
	public int getPo_optionNum() {
		return po_optionNum;
	}
	
	
	public void setPo_optionNum(int po_optionNum) {
		this.po_optionNum = po_optionNum;
	}
	
	
	public int getO_price() {
		return o_price;
	}
	
	
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	
	
	public int getP_sellprice() {
		return p_sellprice;
	}
	
	
	public void setP_sellprice(int p_sellprice) {
		this.p_sellprice = p_sellprice;
	}
	
	
	public String getPo_optionname() {
		return po_optionname;
	}
	
	
	public void setPo_optionname(String po_optionname) {
		this.po_optionname = po_optionname;
	}
	
	
	public String getO_startDate() {
		return o_startDate;
	}
	
	
	public void setO_startDate(String o_startDate) {
		this.o_startDate = o_startDate;
	}
	
	
	public String getO_endDate() {
		return o_endDate;
	}
	
	
	public void setO_endDate(String o_endDate) {
		this.o_endDate = o_endDate;
	}
	
	
	public String getP_name() {
		return p_name;
	}
	
	
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	
	public String getO_name() {
		return o_name;
	}
	
	
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	
	
	@Override
	public String toString() {
		return "OrderVO [o_num=" + o_num + ", u_id=" + u_id + ", p_num=" + p_num + ", o_tel=" + o_tel + ", o_add=" + o_add
				+ ", o_count=" + o_count + ", o_delivery=" + o_delivery + ", o_date=" + o_date + ", po_optionNum="
				+ po_optionNum + ", o_price=" + o_price + ", p_sellprice=" + p_sellprice + ", po_optionname="
				+ po_optionname + ", o_startDate=" + o_startDate + ", o_endDate=" + o_endDate + ", p_name=" + p_name
				+ ", o_name=" + o_name + "]";
	}
   
   


   
 
}