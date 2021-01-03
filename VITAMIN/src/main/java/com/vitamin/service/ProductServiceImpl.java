package com.vitamin.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitamin.dao.ProductDAOImpl;
import com.vitamin.domain.OptionVO;
import com.vitamin.domain.ProductVO;
import com.vitamin.domain.PsImageVO;

@Service("productService")
public class ProductServiceImpl implements ProductService{

	
	@Autowired
	private ProductDAOImpl productDAO;
	
	@Override
	public List<String> categorysearch(String largecate) {
		System.out.println("카테고리서치 서비스");
		System.out.println(largecate);
		
		return productDAO.categorysearch(largecate);
	}

	@Override
	public int insertProduct(ProductVO vo) {
		
		
		return productDAO.insertProduct(vo);
	}

	@Override
	public int insertImage(List<String> list, ProductVO vo) {
		//System.out.println("zzzs" +list.get(0));
			productDAO.insertImage(list, vo);
		
		return 0;
	}

	@Override
	public int insertProductOption(HttpServletRequest request, ProductVO vo) {

		System.out.println("옵션등록서비스");
		return productDAO.insertProductOption(request,vo);
	}

	@Override
	public int deleteImage(List<String> deletelist) {
		
		//서브이미지 경로얻어와서 삭제 
		 productDAO.getfilepath(deletelist);
		
		return productDAO.deleteImage(deletelist);
	}

	@Override
	public int deleteOption(List<String> deletelist) {
		return productDAO.deleteOption(deletelist);
	}

	@Override
	public int deleteProduct(List<String> deletelist) {
		
		//메인이미지 지우기 
		 
		productDAO.getmainfilepath(deletelist);
		
		return productDAO.deleteProduct(deletelist);
	}

	@Override
	public ProductVO getOneProduct(String p_num) {
		
		return productDAO.getOneProduct(p_num);
	}

	@Override
	public List<OptionVO> getOption(String p_num) {
		return productDAO.getOption(p_num);
	}

	@Override
	public List<PsImageVO> getImage(String p_num) {
		return productDAO.getImage(p_num);
	}

	@Override
	public void deletemainImage(String p_num) {
		
		ProductVO pvo = productDAO.getOneProduct(p_num);
		File delfile = new File("C:\\Users\\kosmo_11\\git\\VITAMIN\\VITAMIN\\src\\main\\webapp\\resources\\admin\\product\\mainimages\\"+pvo.getP_mainimage());
		System.out.println("삭제될 메인이미지 이름 : "+pvo.getP_mainimage());
		System.out.print("메인이미지삭제결과 : ");
		System.out.println(delfile.delete());
	}

	@Override
	public int updatemainImage(ProductVO vo) {
		
		return productDAO.changemainimage(vo);
	}

	@Override
	public int subimgdelte(List<String> dellist) {
		for(String data : dellist) {
			File delfile = new File("C:\\Users\\kosmo_11\\git\\VITAMIN\\VITAMIN\\src\\main\\webapp\\resources\\admin\\product\\subimages\\"+data);
			System.out.println("삭제될 서브이미지 이름 : "+ data);
			System.out.print("서브이미지삭제결과 : ");
			System.out.println(delfile.delete());
		}
		
		return productDAO.subimgdelete(dellist);
	}

	@Override
	public int oneDelOptions(String p_num) {
		return productDAO.oneDelOptions(p_num);
	}

	@Override
	public int productupdate(ProductVO vo) {
		return productDAO.productupdate(vo);
	}
	
	


}
