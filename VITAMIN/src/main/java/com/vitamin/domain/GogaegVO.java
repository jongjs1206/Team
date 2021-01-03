package com.vitamin.domain;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class GogaegVO {
	private int b_id;
	private String b_title;
	private String b_content;
	private String b_email;
	private String b_date;	
	private String b_fname;

	
	
	

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
			this.b_fname = file.getOriginalFilename();
			
			
			//***********************************************
			// 해당 경로로 변경
			File f = new File("C:\\java\\spring\\team\\VITAMIN\\src\\main\\webapp\\resources\\upload\\"+b_fname);
			
			try {
				file.transferTo(f);
				
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
	}//end 파일 업로드
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_email() {
		return b_email;
	}
	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getB_fname() {
		return b_fname;
	}
	public void setB_fname(String b_fname) {
		this.b_fname = b_fname;
	}

	
	
	

}
