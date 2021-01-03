package com.vitamin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vitamin.domain.OptionVO;
import com.vitamin.domain.ProductVO;
import com.vitamin.domain.PsImageVO;

public interface ProductService {
	
	public List<String> categorysearch(String largecate);
	
	public int insertProduct(ProductVO vo);
	
	
	public int insertImage(List<String> subfilelist,ProductVO vo);
	
	public int insertProductOption(HttpServletRequest request, ProductVO vo);
	
	public int deleteImage(List<String> deletelist);
	public int deleteOption(List<String> deletelist);
	public int deleteProduct(List<String> deletelist);
	
	public ProductVO getOneProduct(String p_num);
	public List<OptionVO> getOption(String p_num); 
	public List<PsImageVO> getImage(String p_num);
	
	public void deletemainImage(String p_num);
	public int updatemainImage(ProductVO vo);
	
	public int subimgdelte(List<String> dellist);
	public int oneDelOptions(String p_num);
	public int productupdate(ProductVO vo);

}
