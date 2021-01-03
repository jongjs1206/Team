package com.vitamin.domain;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class GogaegVO {
	private int gb_id;
	private String gb_title;
	private String gb_content;
	private String gb_email;
	private String gb_date;	
	private String gb_fname;


	public int getGb_id() {
		return gb_id;
	}
	public void setGb_id(int gb_id) {
		this.gb_id = gb_id;
	}
	public String getGb_title() {
		return gb_title;
	}
	public void setGb_title(String gb_title) {
		this.gb_title = gb_title;
	}
	public String getGb_content() {
		return gb_content;
	}
	public void setGb_content(String gb_content) {
		this.gb_content = gb_content;
	}
	public String getGb_email() {
		return gb_email;
	}
	public void setGb_email(String gb_email) {
		this.gb_email = gb_email;
	}
	public String getGb_date() {
		return gb_date;
	}
	public void setGb_date(String gb_date) {
		this.gb_date = gb_date;
	}
	public String getGb_fname() {
		return gb_fname;
	}
	public void setGb_fname(String gb_fname) {
		this.gb_fname = gb_fname;
	}
	
	//*************************************************
	//파일 없로드:
	MultipartFile file;   // write.jsp에 파일첨부시 name="file"과 동일한 변수명

	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		// 업로드 파일 접근
		if(! file.isEmpty()){
			this.gb_fname = file.getOriginalFilename();
			
			
			//***********************************************
			// 해당 경로로 변경
			File f = new File("C:\\java\\spring\\team\\VITAMIN\\src\\main\\webapp\\resources\\upload\\"+gb_fname);
			
			try {
				file.transferTo(f);
				
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
	}//end 파일 업로드
	

	
	
	

}
