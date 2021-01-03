package com.vitamin.domain;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
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
	
	//*************************************************
	MultipartFile mainfile;	// write.jsp에 파일첨부시 name="file"과 동일한 변수명
	
	public MultipartFile getMainfile() {
		return mainfile;
	}
	public void setMainfile(MultipartFile file) {
		System.out.println("메인이미지세터");
		this.mainfile = file;
		
		// 업로드 파일 접근
		if(! file.isEmpty()){
			this.p_mainimage = System.currentTimeMillis()+file.getOriginalFilename();
//			this.b_fsize = file.getSize();
			
			//***********************************************
			// 해당 경로로 변경
			File f = new File("C:\\Users\\kosmo_11\\git\\VITAMIN\\VITAMIN\\src\\main\\webapp\\resources\\admin\\product\\mainimages\\"+p_mainimage);
			
			try {
				file.transferTo(f);
				
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
	}
	
	public String getP_mainimage() {
		return p_mainimage;
	}
	public void setP_mainimage(String p_mainimage) {
		this.p_mainimage = p_mainimage;
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
	public String getCa_smallcate() {
		return ca_smallcate;
	}
	public void setCa_smallcate(String ca_smallcate) {
		this.ca_smallcate = ca_smallcate;
	}
	
	
}
