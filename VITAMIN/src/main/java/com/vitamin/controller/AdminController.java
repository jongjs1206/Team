package com.vitamin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vitamin.domain.CategoryjoinVO;
import com.vitamin.domain.OptionVO;
import com.vitamin.domain.ProductVO;
import com.vitamin.domain.PsImageVO;
import com.vitamin.domain.UserVO;
import com.vitamin.service.GoodsService;
import com.vitamin.service.OrderService;
import com.vitamin.service.ProductService;
import com.vitamin.service.UserService;

@Controller
public class AdminController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping("admin_view/{step}.do")
	public String viewadminPage(@PathVariable String step) {
		System.out.println("어드민컨트롤러를 타고갔다.");
		
		return "admin_view/"+step;
	}
	@RequestMapping("admin_view/insertproduct.do")
	@ResponseBody
	public void productinsert(ProductVO vo,HttpServletRequest request,MultipartHttpServletRequest mtfRequest) {
		
		int result = productService.insertProduct(vo); //상품 테이블에 등록!
		System.out.println(result);
		
		List<String> subfilelist = new ArrayList<String>();
		

		//***************************************멀티파일 업로드 코드 시작 
		List<MultipartFile> fileList = mtfRequest.getFiles("subfileInput");
		String path = "C:\\Users\\kosmo_11\\git\\VITAMIN\\VITAMIN\\src\\main\\webapp\\resources\\admin\\product\\subimages\\";
		for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

//       중복안되게하고싶으면이코드 이거안하면 덮어씌움 / String safeFile = path + System.currentTimeMillis() + originFileName;
            String safeFile = path + System.currentTimeMillis()+ originFileName;
            subfilelist.add(System.currentTimeMillis()+ originFileName);
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
//		for(String data : subfilelist) {
//			System.out.println(data);
//		}
		//멀티파일 업로드 코드 끝 
		//이미지 등록 시작
		System.out.println("상품넘버 : "+vo.getP_num());
		int imgResult = 0;
		if(result != 0) {	//상품등록이 완료됬을때만 이미지등록하겠다.
			imgResult = productService.insertImage(subfilelist,vo);
		}
		System.out.println("이미지를 넣는데 성공해도 0이나온다 : "+imgResult);	 //결과가 0이나온다 성공했는데도 메퍼를 주의깊게보자. 
//		//이미지등록 끝 
		
		//옵션 등록 시작
		int optionresult = productService.insertProductOption(request,vo);
		if(optionresult ==0) { System.out.println("옵션없음");}
		
		//옵션 등록 끝
//		request.setAttribute("category","아령,덤벨");
		
	//	return "admin_view/products";
	}
	@RequestMapping(value = "admin_view/category.do", method=RequestMethod.POST)
	@ResponseBody
	public List<String> category(String largecate) {
		System.out.println("카테고리리퀘스트 매핑.");
		System.out.println(largecate);
		List<String> smallCateList = productService.categorysearch(largecate);
		
		for(String data : smallCateList) {
			System.out.println(data);
		}
		return smallCateList;
	}
	
		// 상품처음들어왔을때 파라메터없을때 아령,덤벨  
		@RequestMapping("admin_view/products.do")
		public Map productlist(String category) {
			System.out.println("으악");
			
			ProductVO vo = new ProductVO();
			vo.setCa_smallcate(category);
			List<ProductVO> list = goodsService.productlist(vo);
			Map map = new HashMap();
			map.put("goodsList", list);
			
//			for(ProductVO data : list) {
//				System.out.println(data.getCa_smallcate());
//			}
			return map;
		}
		
		@RequestMapping("admin_view/edit-product.do")
		public Map editproductform(String p_num) {
			System.out.println("edit-pdoduct 요청");
			
			 
			ProductVO productVO = productService.getOneProduct(p_num);
			List<OptionVO> optionVOList = productService.getOption(p_num);
			List<PsImageVO> imgList = productService.getImage(p_num);
			
			for(PsImageVO data : imgList) {
				System.out.println("경로"+data.getI_imgpath());
			}
			
			Map map = new HashMap();
			map.put("updatevo", productVO);
			map.put("optionvolist", optionVOList);
			map.put("imgvolist", imgList);
			System.out.println("끝");
			return map;
		}
		@RequestMapping(value = "admin_view/mainimagechange.do", method=RequestMethod.POST)
		@ResponseBody
		public String mainimagechange(ProductVO vo) {
			System.out.println("메인이미지 체인지 요청");
			System.out.println(vo.getP_num());
			productService.deletemainImage(vo.getP_num());
			productService.updatemainImage(vo);
			
			return "힘들다";
		}
		

		@RequestMapping(value = "admin_view/subimagedel.do", method=RequestMethod.POST)
			@ResponseBody
			public String editproduct(@RequestParam(value="delist[]")List<String> subimgdelist) {
				System.out.println("서브이미지 삭제 요청");
				for(String data : subimgdelist) {
					System.out.println(data);
				}
				int result = productService.subimgdelte(subimgdelist);
				
				return "호잇";
			}
			
			@RequestMapping(value = "admin_view/productupdate.do", method=RequestMethod.POST)
			@ResponseBody
			public String productupdate(ProductVO vo,HttpServletRequest request,MultipartHttpServletRequest mtfRequest) {
				System.out.println("productupdate 요청");
				//옵션 전부다 지우기
				productService.oneDelOptions(vo.getP_num());
				//옵션 전부다 지우기
				//옵션 등록 시작
				int optionresult = productService.insertProductOption(request,vo);
				if(optionresult ==0) { System.out.println("옵션없음");}
				//옵션 등록 끝
				//추가된 서브이미지 업로드 시작
					List<String> subfilelist = new ArrayList<String>();
					List<MultipartFile> fileList = mtfRequest.getFiles("subfileInput");
					String path = "C:\\Users\\kosmo_11\\git\\VITAMIN\\VITAMIN\\src\\main\\webapp\\resources\\admin\\product\\subimages\\";
					for (MultipartFile mf : fileList) {
			            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			            long fileSize = mf.getSize(); // 파일 사이즈
		
			            System.out.println("originFileName : " + originFileName);
			            System.out.println("fileSize : " + fileSize);
		
		//	       중복안되게하고싶으면이코드 이거안하면 덮어씌움 / String safeFile = path + System.currentTimeMillis() + originFileName;
			            String safeFile = path + System.currentTimeMillis()+ originFileName;
			            subfilelist.add(System.currentTimeMillis()+ originFileName);
			            try {
			                mf.transferTo(new File(safeFile));
			            } catch (IllegalStateException e) {
			                // TODO Auto-generated catch block
			                e.printStackTrace();
			            } catch (IOException e) {
			                // TODO Auto-generated catch block
			                e.printStackTrace();
			            }
			        }
					System.out.println(subfilelist);
					for(String data : subfilelist) {
						System.out.println("있는건가??****************???????????????"+data);
					}
					if(subfilelist.size()>0) {
				//추가된 서브이미지 업로드 끝
					//이미지 등록 시작
					System.out.println("상품넘버 : "+vo.getP_num());
					//int imgResult = 0;
					//if(result != 0) {	//상품등록이 완료됬을때만 이미지등록하겠다.
						productService.insertImage(subfilelist,vo);
					//}
					}
					//System.out.println("이미지를 넣는데 성공해도 0이나온다 : "+imgResult);	 //결과가 0이나온다 성공했는데도 메퍼를 주의깊게보자. 
//					//이미지등록 끝 
					//product테이블 수정 코드 시작
							int updateresult = productService.productupdate(vo);
							System.out.println(updateresult);
					//product테이블 수정 코드 끝 
					System.out.println("뭐야?"+vo.getP_num());
					
				return vo.getP_num();
			}

		
		@RequestMapping(value = "admin_view/delete.do", method=RequestMethod.POST)
		@ResponseBody
		public String deleteProduct(@RequestParam(value="delist[]")List<String> delist) {
			System.out.println("delete컨트롤러 요청");
			
			for(String data : delist) {
				System.out.println(data);
			}
			
			//서브이미지 테이블 / 파일  지우기  코드 시작
			int imgdelrusult = productService.deleteImage(delist);
			System.out.println("서브이미지레코드 지우기결과값 : "+imgdelrusult);
			//서브이미지 테이블 / 파일지우기  코드 끝
			
			//옵션 지우기 코드 시작 
			int optdelruselt = productService.deleteOption(delist);
			System.out.println("옵션지우기 결과값 : "+optdelruselt);
			//옵션 지우기 코드 끝 
			
			//상품 테이블 / 이미지 지우기 코드시작
			int productdelruselt = productService.deleteProduct(delist);
			System.out.println("상품레코드 지우기결과값 : "+productdelruselt);
			//상품 테이블 / 이미지 지우기 코드끝
			
			return "시발";
		}
		@RequestMapping("admin_view/adminorder.do")
	      public Map adminorder(String o_name,String select) {
	         CategoryjoinVO vo = new CategoryjoinVO();
	         if(o_name!=null) {
	        	 vo.setCa_smallcate(o_name);
	        	 vo.setCa_largecate(select);	        	 
	         }
	         List<CategoryjoinVO> list = goodsService.orderlist(vo);
	         Map map = new HashMap();
	         map.put("list", list);
	         return map;
	      }
		//회원 관리 페이지 요청 
		@RequestMapping("admin_view/accounts.do")
		public Map accountform() {
			System.out.println("회원관리페이지 요청");
			List<UserVO> list = userService.alluser();
 			
			Map map = new HashMap();
	         map.put("list", list);
	         return map;
		}
		
		//회원 관리 페이지 검색 요청 
		@RequestMapping("admin_view/accountsearch.do")
		@ResponseBody
		public List<UserVO> accountsearch(String keyselects, String accountsearch, String rankselect,String gradeselect) {
			System.out.println(keyselects);
			System.out.println(accountsearch);
			System.out.println(rankselect);
			System.out.println(gradeselect);
			
			List<UserVO> list = userService.userSerach(keyselects,accountsearch,rankselect,gradeselect);
 			
//			for(UserVO data : list) {
//				System.out.println(data.getU_id());
//				System.out.println(data.getU_height());
//				System.out.println(data.getU_tel());
//				
//			}
			System.out.println("슈방");
//			Map map = new HashMap();
//	         map.put("list", list);
	         return list;			
			
		}
		//회원 블랙요청 
		@RequestMapping("admin_view/blackupdate.do")
		@ResponseBody
		public String blockchange(String blackid,String blackstate) {
			System.out.println("블랙할 id"+blackid);
			System.out.println("블랙할 상태" + blackstate);
			
			int result = userService.blackchange(blackid,blackstate);
			System.out.println(result);
			return "ajax 성공";
		}
		//회원 권한수정요청 
		@RequestMapping("admin_view/rankupdate.do")
		@ResponseBody
		public String rankchange(String rankid,String rankstate) {
			System.out.println("권한수정할 id"+rankid);
			System.out.println("바꿀 권한" + rankstate);
			
			int result = userService.rankchange(rankid,rankstate);
			System.out.println(result);
			return "ajax 성공";
		}
		//주문 상태 수정 
		@RequestMapping("admin_view/orderstateupdate.do")
		@ResponseBody
		public String orderstateupdate(String updateordernum, String orderstate) {
			System.out.println(updateordernum);
			System.out.println(orderstate);
			orderService.orderstateupdate(updateordernum,orderstate);
			
			
	        return orderstate;
			
		}
		//주문 관리자 취소
		@RequestMapping("admin_view/orderstatecancle.do")
		@ResponseBody
		public String orderstatecancle(String updateordernum, String orderstate) {
			System.out.println(updateordernum);
			System.out.println(orderstate);
			orderService.orderstatecancle(updateordernum,orderstate);
			
	        return orderstate;
		}
		//주문 상세 요청 
		@RequestMapping("admin_view/orderdetail.do")
		public Map orderdetail(String o_num) {
			System.out.println("오잉?"+o_num);
			
			Map<String,Object> map = new HashMap();
			
			map = orderService.getorderinfo(o_num);
			System.out.println(map);
			
			return  map;
		}	

			
		
		
}


















