package com.vitamin.domain;

public class OptionVO {
	private String p_num;			//상품번호
	private int po_optionnum;		//옵션번호
	private String po_optionname;	//옵션이름
	private int po_optionstock;		//옵션재고
	private int po_addprice; 		//옵션가격
	
	
	public int getPo_optionnum() {
		return po_optionnum;
	}
	public void setPo_optionnum(int po_optionnum) {
		this.po_optionnum = po_optionnum;
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
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
}
