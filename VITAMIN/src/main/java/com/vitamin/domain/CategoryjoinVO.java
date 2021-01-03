package com.vitamin.domain;

public class CategoryjoinVO {
	private String p_num;			//상품번호
	private String p_name;			//상품명
	private int p_costprice;		//원가
	private int p_sellprice;		//판매가
	private int p_discountrate;		//할인율
	private String p_postdate;		//게시일
	private String p_content;		//내용
	private int p_stock;			//재고
	private String ca_smallcate;	//소분류
	private String p_mainimage; 	//메인이미지
	private String ca_smallcatee;	//category소분류
	private String ca_largecate;	//대분류
	private String count;
	private int po_optionnum;		//옵션번호
	private String po_optionname;	//옵션이름
	private int po_optionstock;		//옵션재고
	private int po_addprice; 		//옵션가격
	private String u_id;	//아이디
	private String u_pass;	//비번
	private String u_name;	//이름
	private String u_tel;	//전화번호
	private String u_addr;	//주소
	private String u_idnum;	//주민
	private int u_height;	//키
	private int u_weight;	//몸무게
	private String u_grade;	//등급
	private String u_rank;	//권한
	private int u_mileage;	//적립금
	private char u_black;	//블랙리스트 여부
	private String u_trainer;	//트레이너 아이디
	private String i_num;
	private String i_imgpath;
	private int o_num;
	private String o_tel;
	private int o_count;
	private String o_delivery;
	private String o_date;
	private String o_add;
	private String o_price;
	private String o_name;
	private int s_num;
	private int s_count;
	private String s_date;
	
	
	public String getO_price() {
		return o_price;
	}
	public void setO_price(String o_price) {
		this.o_price = o_price;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getS_count() {
		return s_count;
	}
	public void setS_count(int s_count) {
		this.s_count = s_count;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getO_add() {
		return o_add;
	}
	public void setO_add(String o_add) {
		this.o_add = o_add;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getO_tel() {
		return o_tel;
	}
	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
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
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getPo_optionnum() {
		return po_optionnum;
	}
	public void setPo_optionnum(int po_optionnum) {
		this.po_optionnum = po_optionnum;
	}
	public String getPo_optionname() {
		return po_optionname;
	}
	public void setPo_optionname(String po_optionname) {
		this.po_optionname = po_optionname;
	}
	public int getPo_optionstock() {
		return po_optionstock;
	}
	public void setPo_optionstock(int po_optionstock) {
		this.po_optionstock = po_optionstock;
	}
	public int getPo_addprice() {
		return po_addprice;
	}
	public void setPo_addprice(int po_addprice) {
		this.po_addprice = po_addprice;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public String getU_addr() {
		return u_addr;
	}
	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}
	public String getU_idnum() {
		return u_idnum;
	}
	public void setU_idnum(String u_idnum) {
		this.u_idnum = u_idnum;
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
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public String getU_rank() {
		return u_rank;
	}
	public void setU_rank(String u_rank) {
		this.u_rank = u_rank;
	}
	public int getU_mileage() {
		return u_mileage;
	}
	public void setU_mileage(int u_mileage) {
		this.u_mileage = u_mileage;
	}
	public char getU_black() {
		return u_black;
	}
	public void setU_black(char u_black) {
		this.u_black = u_black;
	}
	public String getU_trainer() {
		return u_trainer;
	}
	public void setU_trainer(String u_trainer) {
		this.u_trainer = u_trainer;
	}
	public String getI_num() {
		return i_num;
	}
	public void setI_num(String i_num) {
		this.i_num = i_num;
	}
	public String getI_imgpath() {
		return i_imgpath;
	}
	public void setI_imgpath(String i_imgpath) {
		this.i_imgpath = i_imgpath;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_costprice() {
		return p_costprice;
	}
	public void setP_costprice(int p_costprice) {
		this.p_costprice = p_costprice;
	}
	public int getP_sellprice() {
		return p_sellprice;
	}
	public void setP_sellprice(int p_sellprice) {
		this.p_sellprice = p_sellprice;
	}
	public int getP_discountrate() {
		return p_discountrate;
	}
	public void setP_discountrate(int p_discountrate) {
		this.p_discountrate = p_discountrate;
	}
	public String getP_postdate() {
		return p_postdate;
	}
	public void setP_postdate(String p_postdate) {
		this.p_postdate = p_postdate;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public String getP_mainimage() {
		return p_mainimage;
	}
	public void setP_mainimage(String p_mainimage) {
		this.p_mainimage = p_mainimage;
	}
	public String getCa_smallcatee() {
		return ca_smallcatee;
	}
	public void setCa_smallcatee(String ca_smallcatee) {
		this.ca_smallcatee = ca_smallcatee;
	}
	public String getCa_smallcate() {
		return ca_smallcate;
	}
	public void setCa_smallcate(String ca_smallcate) {
		this.ca_smallcate = ca_smallcate;
	}
	public String getCa_largecate() {
		return ca_largecate;
	}
	public void setCa_largecate(String ca_largecate) {
		this.ca_largecate = ca_largecate;
	}
	
	
}
