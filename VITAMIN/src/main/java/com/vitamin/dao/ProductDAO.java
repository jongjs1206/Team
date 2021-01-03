package com.vitamin.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.vitamin.domain.OptionVO;
import com.vitamin.domain.ProductVO;
import com.vitamin.domain.PsImageVO;

public interface ProductDAO {
	
	public List<String> categorysearch(String largecate);
	
	public int insertProduct(ProductVO vo);
	
	
	public int insertImage(List<String> list, ProductVO vo);
	
	public int insertProductOption(HttpServletRequest request, ProductVO vo);
	
	public void getfilepath(List<String> deletelist);
	public int deleteImage(List<String> deletelist);
	public int deleteOption(List<String> deletelist);
	public void getmainfilepath(List<String> deletelist);
	public int deleteProduct(List<String> deletelist);
	
	public ProductVO getOneProduct(String p_num);
	public List<OptionVO> getOption(String p_num);
	public List<PsImageVO> getImage(String p_num);
	
	public int changemainimage(ProductVO vo);
	public int subimgdelete(List<String> dellist);
	public int oneDelOptions(String p_num);
	public int productupdate(ProductVO vo);
}
