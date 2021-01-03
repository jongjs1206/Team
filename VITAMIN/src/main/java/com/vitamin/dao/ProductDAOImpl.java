package com.vitamin.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitamin.domain.OptionVO;
import com.vitamin.domain.ProductOptionVO;
import com.vitamin.domain.ProductVO;
import com.vitamin.domain.PsImageVO;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<String> categorysearch(String largecate) {
		System.out.println("카테고리서치 다오");
		System.out.println(largecate);
		
		return mybatis.selectList("product.categoryget", largecate);
	}

	@Override
	public int insertProduct(ProductVO vo) {
		System.out.println("insertProduct 다오");
		
		return mybatis.insert("product.insertproduct", vo);
	}

	@Override
	public int insertImage(List<String> list, ProductVO vo) {
		HashMap<String,Object> map = new HashMap<>();
			map.put("list", list);
			map.put("vo", vo);
		System.out.println("제발되라..");
		
		return mybatis.insert("product.insertsubimage",map);
	}

	@Override
	public int insertProductOption(HttpServletRequest request, ProductVO vo) {
		System.out.println("옵션등록다오");
		String[] optionName = request.getParameterValues("po_optionName");
		String[] optionStock = request.getParameterValues("po_optionstock");
		String[] addPrice = request.getParameterValues("po_addprice");
		if(optionName == null) {
			return 0;
		}
		
		List<ProductOptionVO> list = new ArrayList<ProductOptionVO>();
		
		for(int i=0;i<optionName.length;i++) {
			ProductOptionVO optvo =  new ProductOptionVO();
			optvo.setPo_optionname(optionName[i]);
			optvo.setPo_optionstock(Integer.parseInt(optionStock[i]));
			optvo.setPo_addprice(Integer.parseInt(addPrice[i]));
			optvo.setP_num(vo.getP_num());
			list.add(optvo);
		}
		
		return mybatis.insert("product.insertproductoption",list);
	}

	@Override
	public void getfilepath(List<String> deletelist) {
		
 		for(String data:deletelist) {
 			List<String> paths = mybatis.selectList("product.getfilepath",Integer.parseInt(data));
 			
 			for(String path : paths) {
 				File file = new File("C:\\Users\\kosmo_11\\git\\VITAMIN\\VITAMIN\\src\\main\\webapp\\resources\\admin\\product\\subimages\\"+path);
 		        
 		    	if( file.exists() ){
 		    		if(file.delete()){
 		    			System.out.println("서브이미지 삭제 성공");
 		    		}else{
 		    			System.out.println("서브이미지 삭제 실패");
 		    		}
 		    	}else{
 		    		System.out.println("서브이미지 파일이 존재하지 않습니다.");
 		    	}

 			}
		}	
		
	}
	@Override
	public int deleteImage(List<String> deletelist) {
		int result = 0;
		for(String data:deletelist) {
			result += mybatis.delete("product.deleteimage", Integer.parseInt(data));
		}
		return result;
	}

	@Override
	public int deleteOption(List<String> deletelist) {
		int result = 0;
		for(String data:deletelist) {
			result += mybatis.delete("product.deleteoption", Integer.parseInt(data));
		}
		return result;
	}

	
	@Override
	public void getmainfilepath(List<String> deletelist) {
		
		for(String data:deletelist) {
			String path = mybatis.selectOne("product.getmainfilepath",Integer.parseInt(data));
			
			File file = new File("C:\\Users\\kosmo_11\\git\\VITAMIN\\VITAMIN\\src\\main\\webapp\\resources\\admin\\product\\mainimages\\"+path);
		        
		    	if( file.exists() ){
		    		if(file.delete()){
		    			System.out.println("메인이미지삭제 성공");
		    		}else{
		    			System.out.println("메인이미지삭제 실패");
		    		}
		    	}else{
		    		System.out.println("메인이미지 파일이 존재하지 않습니다.");
		    	}
		}
	}
	
	@Override
	public int deleteProduct(List<String> deletelist) {
		int result = 0;
		for(String data:deletelist) {
			result += mybatis.delete("product.deleteproduct", Integer.parseInt(data));
		}
		return result;
	}

	@Override
	public ProductVO getOneProduct(String p_num) {
		
		return mybatis.selectOne("product.goodview",Integer.parseInt(p_num));
	}

	@Override
	public List<OptionVO> getOption(String p_num) {
		return mybatis.selectList("product.option",Integer.parseInt(p_num));
	}

	@Override
	public List<PsImageVO> getImage(String p_num) {
		return mybatis.selectList("product.subimage",Integer.parseInt(p_num));
	}

	@Override
	public int changemainimage(ProductVO vo) {
		return mybatis.update("product.changemainimage",vo);
	}

	@Override
	public int subimgdelete(List<String> dellist) {
		return mybatis.update("product.deletesubimage",dellist);
	}

	@Override
	public int oneDelOptions(String p_num) {
		return mybatis.delete("product.onedeloptions",p_num);
	}

	@Override
	public int productupdate(ProductVO vo) {
		return mybatis.update("product.updateproductval",vo);
	}


}
