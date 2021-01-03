package com.vitamin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vitamin.domain.CategoryjoinVO;
import com.vitamin.domain.OptionVO;
import com.vitamin.domain.ProductVO;
import com.vitamin.domain.UserVO;
import com.vitamin.service.BasketService;
import com.vitamin.service.GoodsService;
import com.vitamin.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private BasketService basketService;

	@Autowired
	private GoodsService goodsService;

	List<ProductVO> anumber = new ArrayList<ProductVO>();
	List<String> ap_count = new ArrayList<String>();
	List<OptionVO> option = new ArrayList<OptionVO>();
	List<String> opcount = new ArrayList<String>();
	List<Integer> num = new ArrayList<Integer>();
	List<String> opnum = new ArrayList<String>();

	@RequestMapping("basketsave.do")
	public void basket(int number, String opnum1, String opcount1, String opnum2, String opcount2, String opnum3,
			String opcount3, String opnum4, String opcount4, String opnum5, String opcount5, String p_count,
			HttpSession session) {
		if (session.getAttribute("id") != null) {
			CategoryjoinVO cvo = new CategoryjoinVO();
			cvo.setP_num(Integer.toString(number));
			cvo.setU_id((session.getAttribute("id")).toString());
			if (opnum1 != null) {
				cvo.setPo_optionnum(Integer.parseInt(opnum1));
				cvo.setS_count(Integer.parseInt(opcount1));
				basketService.basketinsert(cvo);
				if (opnum2 != null) {
					cvo.setPo_optionnum(Integer.parseInt(opnum2));
					cvo.setS_count(Integer.parseInt(opcount2));
					basketService.basketinsert(cvo);
					if (opnum3 != null) {
						cvo.setPo_optionnum(Integer.parseInt(opnum3));
						cvo.setS_count(Integer.parseInt(opcount3));
						basketService.basketinsert(cvo);
						if (opnum4 != null) {
							cvo.setPo_optionnum(Integer.parseInt(opnum4));
							cvo.setS_count(Integer.parseInt(opcount4));
							basketService.basketinsert(cvo);
							if (opnum5 != null) {
								cvo.setPo_optionnum(Integer.parseInt(opnum5));
								cvo.setS_count(Integer.parseInt(opcount5));
								basketService.basketinsert(cvo);
							}
						}
					}
				}
			} else {
				cvo.setS_count(Integer.parseInt(p_count));
				basketService.basketinsert(cvo);
			}

		} else {
			if (opnum1 != null) {
				num.add(number);
				opnum.add(opnum1);
				anumber.add(goodsService.goodview(number));
				ap_count.add(opcount1);
				option.add(goodsService.goodoption(opnum1));
				opcount.add(opcount1);
				if (opnum2 != null) {
					num.add(number);
					opnum.add(opnum2);
					anumber.add(goodsService.goodview(number));
					ap_count.add(opcount2);
					option.add(goodsService.goodoption(opnum2));
					opcount.add(opcount2);
					if (opnum3 != null) {
						num.add(number);
						opnum.add(opnum3);
						anumber.add(goodsService.goodview(number));
						ap_count.add(opcount3);
						option.add(goodsService.goodoption(opnum3));
						opcount.add(opcount3);
						if (opnum4 != null) {
							num.add(number);
							opnum.add(opnum4);
							anumber.add(goodsService.goodview(number));
							ap_count.add(opcount4);
							option.add(goodsService.goodoption(opnum4));
							opcount.add(opcount4);
							if (opnum5 != null) {
								num.add(number);
								opnum.add(opnum5);
								anumber.add(goodsService.goodview(number));
								ap_count.add(opcount5);
								option.add(goodsService.goodoption(opnum5));
								opcount.add(opcount5);
							}
						}
					}
				}
			} else {
				num.add(number);
				anumber.add(goodsService.goodview(number));
				ap_count.add(p_count);
				option.add(null);
				opcount.add(null);
				opnum.add(null);
			}
			session.setAttribute("num", num);
			session.setAttribute("anumber", anumber);
			session.setAttribute("ap_count", ap_count);
			session.setAttribute("option", option);
			session.setAttribute("opcount", opcount);
			session.setAttribute("opnum", opnum);
		}
	}

	@RequestMapping("basketdelete.do")
	public String delete(HttpSession session) {
		if (session.getAttribute("id") != null) {
			basketService.basketdelect((String) (session.getAttribute("id")));
		}
		anumber.clear();
		ap_count.clear();
		option.clear();
		opcount.clear();
		num.clear();
		opnum.clear();

		session.removeAttribute("num");
		session.removeAttribute("anumber");
		session.removeAttribute("ap_count");
		session.removeAttribute("option");
		session.removeAttribute("opcount");
		session.removeAttribute("opnum");
		return "basket";
	}

	@RequestMapping("log.do")
	public String login(UserVO vo, HttpSession session, Model m) {

		UserVO result = userService.idCheck_Login(vo);

		String message = "로그인에 실패하였습니다.";

		if (result != null) {
			if (result.getU_black() == 'Y') {
				return "black";
			}
		}
		if (result == null || result.getU_id() == null) {
			m.addAttribute("message", message);
			return "login";
		} else {
			int height = result.getU_height();
			int weight = result.getU_weight();

			double bmi = weight * 10000 / height / height;
			String obesity;
			if (bmi < 18.5) {
				obesity = "저체중";
			} else if (bmi >= 18.5 && bmi < 23) {
				obesity = "보통";
			} else if (bmi >= 23 && bmi < 25) {
				obesity = "과체중";
			} else if (bmi >= 25 && bmi < 35) {
				obesity = "비만";
			} else {
				obesity = "고도비만";
			}
			if (session.getAttribute("anumber") != null) {
				List num = (ArrayList) session.getAttribute("num");
				List anumber = (ArrayList) session.getAttribute("anumber");
				List ap_count = (ArrayList) session.getAttribute("ap_count");
				List option = (ArrayList) session.getAttribute("option");
				List opcount = (ArrayList) session.getAttribute("opcount");
				List opnum = (ArrayList) session.getAttribute("opnum");

				for (int i = 0; i < anumber.size(); i++) {
					CategoryjoinVO cvo = new CategoryjoinVO();

					cvo.setP_num(((Integer) num.get(i)).toString());
					cvo.setU_id(result.getU_id());
					if (opcount.get(i) != null) {
						cvo.setPo_optionnum(Integer.parseInt(opnum.get(i).toString()));
						cvo.setS_count(Integer.parseInt(opcount.get(i).toString()));
					} else
						cvo.setS_count(Integer.parseInt(ap_count.get(i).toString()));
					basketService.basketinsert(cvo);
				}
				anumber.clear();
				ap_count.clear();
				option.clear();
				opcount.clear();
				num.clear();
				session.removeAttribute("num");
				session.removeAttribute("anumber");
				session.removeAttribute("ap_count");
				session.removeAttribute("option");
				session.removeAttribute("opcount");
				session.removeAttribute("opnum");
			}

			session.setAttribute("id", result.getU_id());
			session.setAttribute("name", result.getU_name());
			session.setAttribute("addr", result.getU_addr());
			session.setAttribute("rank", result.getU_rank());
			session.setAttribute("grade", result.getU_grade());
			session.setAttribute("tel", result.getU_tel());
			session.setAttribute("mileage", result.getU_mileage());
			session.setAttribute("obesity", obesity);

			return "homepage";
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		anumber.clear();
		ap_count.clear();
		option.clear();
		opcount.clear();
		num.clear();
		opnum.clear();
		return "homepage";
	}

	@RequestMapping("basket.do")
	public void basket(HttpSession session) {
		if (session.getAttribute("id") != null) {
			anumber.clear();
			ap_count.clear();
			option.clear();
			opcount.clear();
			num.clear();
			opnum.clear();

			CategoryjoinVO cvo = new CategoryjoinVO();
			cvo.setU_id((session.getAttribute("id")).toString());
			List<CategoryjoinVO> result = basketService.basketselect(cvo);

			for (int i = 0; i < result.size(); i++) {
				num.add(Integer.parseInt(result.get(i).getP_num()));
				anumber.add(goodsService.goodview(Integer.parseInt(result.get(i).getP_num())));
				ap_count.add(Integer.toString(result.get(i).getS_count()));

				if (result.get(i).getPo_optionnum() == 0) {
					option.add(null);
					opcount.add(null);
					opnum.add(null);
				} else {
					option.add(goodsService.goodoption(Integer.toString(result.get(i).getPo_optionnum())));
					opcount.add(Integer.toString(result.get(i).getS_count()));
					opnum.add(Integer.toString(result.get(i).getPo_optionnum()));
				}

			}

			session.setAttribute("num", num);
			session.setAttribute("anumber", anumber);
			session.setAttribute("ap_count", ap_count);
			session.setAttribute("option", option);
			session.setAttribute("opcount", opcount);
			session.setAttribute("opnum", opnum);
		}
	}

	@RequestMapping("orders.do")
	public Map orders(int number, String opnum1, String opcount1, String opnum2, String opcount2, String opnum3,
			String opcount3, String opnum4, String opcount4, String opnum5, String opcount5, String p_count,
			HttpSession session) {
		List<ProductVO> order = new ArrayList<ProductVO>();
		List<String> orcount = new ArrayList<String>();
		List<OptionVO> oroption = new ArrayList<OptionVO>();
		List<String> oropcount = new ArrayList<String>();

		if (opnum1 != null) {
			order.add(goodsService.goodview(number));
			orcount.add(opcount1);
			oroption.add(goodsService.goodoption(opnum1));
			oropcount.add(opcount1);
			if (opnum2 != null) {
				order.add(goodsService.goodview(number));
				orcount.add(opcount2);
				oroption.add(goodsService.goodoption(opnum2));
				oropcount.add(opcount2);
				if (opnum3 != null) {
					order.add(goodsService.goodview(number));
					orcount.add(opcount3);
					oroption.add(goodsService.goodoption(opnum3));
					oropcount.add(opcount3);
					if (opnum4 != null) {
						order.add(goodsService.goodview(number));
						orcount.add(opcount4);
						oroption.add(goodsService.goodoption(opnum4));
						oropcount.add(opcount4);
						if (opnum5 != null) {
							order.add(goodsService.goodview(number));
							orcount.add(opcount5);
							oroption.add(goodsService.goodoption(opnum5));
							oropcount.add(opcount5);
						}
					}
				}
			}
		} else {
			order.add(goodsService.goodview(number));
			orcount.add(p_count);
		}

		Map map = new HashMap();
		map.put("order", order);
		map.put("orcount", orcount);
		map.put("oroption", oroption);
		map.put("oropcount", oropcount);
		return map;
	}

	@RequestMapping("modelorder.do")
	public ModelAndView orderslist(HttpSession session) {
		ModelAndView view = new ModelAndView();
		view.setViewName("orders");

		view.addObject("order", anumber);
		view.addObject("orcount", ap_count);
		view.addObject("oroption", option);
		view.addObject("oropcount", opcount);
		view.addObject("ocheck", 1);
		return view;
	}

	@RequestMapping("pay.do")
	public void pay(String ocheck, String number, String opnum1, String opcount1, String opnum2, String opcount2,
			String opnum3, String opcount3, String opnum4, String opcount4, String opnum5, String opcount5,
			String p_count, String addr1, String addr2, String addr3, String tel, String rname, String all, String mile,
			HttpSession session) {
		CategoryjoinVO vo = new CategoryjoinVO();

		double mileage=0;
	      if ((String) session.getAttribute("id") != null) {
	         vo.setU_id((String) session.getAttribute("id"));
	         String upgrade = (String) session.getAttribute("grade");
	         if ("BRONZE".equals(upgrade)) {
	            mileage=0.01;
	         }else if ("SILVER".equals(upgrade)) {
	            mileage=0.02;
	         }else if ("GOLD".equals(upgrade)) {
	            mileage=0.03;
	         }else if("VIP".equals(upgrade)) {
	            mileage=0.05;
	         }	         
	      }
		else {
			vo.setU_id("비회원");
		}
		vo.setO_tel(tel);
		vo.setO_add(addr1 + " " + addr2 + " " + addr3);
		vo.setO_name(rname);
		if (mile == null) {
			mile = "0";
		}
		if ("".equals(mile)) {
			mile = "0";
		}
		if ("1".equals(ocheck)) {
			int rmile = Integer.parseInt(mile);
			for (int i = 0; i < anumber.size(); i++) {
				vo.setP_num(anumber.get(i).getP_num());
				OptionVO res = option.get(i);
				if (res != null) {
					if (rmile > (Integer.parseInt(opcount.get(i)))
							* (anumber.get(i).getP_sellprice() + option.get(i).getPo_addprice()) + 3000) {
						vo.setO_price("0");
						rmile = rmile - ((Integer.parseInt(opcount.get(i)))
								* (anumber.get(i).getP_sellprice() + option.get(i).getPo_addprice()) + 3000);
					} else {
						vo.setO_price(Integer.toString((Integer.parseInt(opcount.get(i)))
								* (anumber.get(i).getP_sellprice() + option.get(i).getPo_addprice()) + 3000 - rmile));
						rmile = 0;
					}
				} else {
					vo.setO_price(Integer.toString(
							(Integer.parseInt(ap_count.get(i))) * (anumber.get(i).getP_sellprice()) + 3000 - rmile));
				}
				if (opnum.get(i) != null)
					vo.setPo_optionnum(Integer.parseInt(opnum.get(i)));
				vo.setO_count(Integer.parseInt(ap_count.get(i)));
				goodsService.insertorder(vo);
				basketService.basketdelect((String) (session.getAttribute("id")));
				if ((String) session.getAttribute("id") != null) {
					vo.setO_price(Integer.toString((int)(Integer.parseInt(vo.getO_price())*mileage)));
					goodsService.addmile(vo);
				}
			}
			anumber.clear();
			ap_count.clear();
			option.clear();
			opcount.clear();
			num.clear();
			opnum.clear();
			if ((String) session.getAttribute("id") != null) {
				vo.setU_mileage(Integer.parseInt(mile));
				goodsService.submile(vo);
			}
		} else {
			if ((String) session.getAttribute("id") != null) {
				vo.setU_mileage(Integer.parseInt(mile));
				goodsService.submile(vo);
			}
			ProductVO result = goodsService.goodview(Integer.parseInt(number));
			vo.setP_num(number);
			int rmile = Integer.parseInt(mile);

			if (opnum1 != null) {
				OptionVO res1 = goodsService.goodoption(opnum1);
				if (rmile > Integer.parseInt(opcount1) * (result.getP_sellprice() + res1.getPo_addprice()) + 3000) {
					vo.setO_price("0");
					rmile = rmile
							- (Integer.parseInt(opcount1) * (result.getP_sellprice() + res1.getPo_addprice()) + 3000);
				} else {
					vo.setO_price(Integer
							.toString(Integer.parseInt(opcount1) * (result.getP_sellprice() + res1.getPo_addprice())
									+ 3000 - rmile));
					rmile = 0;
				}

				vo.setPo_optionnum(Integer.parseInt(opnum1));
				vo.setO_count(Integer.parseInt(opcount1));
				goodsService.insertorder(vo);
				if ((String) session.getAttribute("id") != null) {
					vo.setO_price(Integer.toString((int)(Integer.parseInt(vo.getO_price())*mileage)));
					goodsService.addmile(vo);
				}
				if (opnum2 != null) {
					OptionVO res2 = goodsService.goodoption(opnum2);
					if (rmile > Integer.parseInt(opcount2) * (result.getP_sellprice() + res2.getPo_addprice()) + 3000) {
						vo.setO_price("0");
						rmile = rmile - (Integer.parseInt(opcount2) * (result.getP_sellprice() + res2.getPo_addprice())
								+ 3000);
					} else {
						vo.setO_price(Integer
								.toString(Integer.parseInt(opcount2) * (result.getP_sellprice() + res2.getPo_addprice())
										+ 3000 - rmile));
						rmile = 0;
					}
					vo.setPo_optionnum(Integer.parseInt(opnum2));
					vo.setO_count(Integer.parseInt(opcount2));
					goodsService.insertorder(vo);
					if ((String) session.getAttribute("id") != null) {
						vo.setO_price(Integer.toString((int)(Integer.parseInt(vo.getO_price())*mileage)));
						goodsService.addmile(vo);
					}
					if (opnum3 != null) {
						OptionVO res3 = goodsService.goodoption(opnum3);
						if (rmile > Integer.parseInt(opcount3) * (result.getP_sellprice() + res3.getPo_addprice())
								+ 3000) {
							vo.setO_price("0");
							rmile = rmile
									- (Integer.parseInt(opcount3) * (result.getP_sellprice() + res3.getPo_addprice())
											+ 3000);
						} else {
							vo.setO_price(Integer.toString(
									Integer.parseInt(opcount3) * (result.getP_sellprice() + res3.getPo_addprice())
											+ 3000 - rmile));
							rmile = 0;
						}
						vo.setPo_optionnum(Integer.parseInt(opnum3));
						vo.setO_count(Integer.parseInt(opcount3));
						goodsService.insertorder(vo);
						if ((String) session.getAttribute("id") != null) {
							vo.setO_price(Integer.toString((int)(Integer.parseInt(vo.getO_price())*mileage)));
							goodsService.addmile(vo);
						}
						if (opnum4 != null) {
							OptionVO res4 = goodsService.goodoption(opnum4);
							if (rmile > Integer.parseInt(opcount4) * (result.getP_sellprice() + res4.getPo_addprice())
									+ 3000) {
								vo.setO_price("0");
								rmile = rmile - (Integer.parseInt(opcount4)
										* (result.getP_sellprice() + res4.getPo_addprice()) + 3000);
							} else {
								vo.setO_price(Integer.toString(
										Integer.parseInt(opcount4) * (result.getP_sellprice() + res4.getPo_addprice())
												+ 3000 - rmile));
								rmile = 0;
							}
							vo.setPo_optionnum(Integer.parseInt(opnum4));
							vo.setO_count(Integer.parseInt(opcount4));
							goodsService.insertorder(vo);
							if ((String) session.getAttribute("id") != null) {
								vo.setO_price(Integer.toString((int)(Integer.parseInt(vo.getO_price())*mileage)));
								goodsService.addmile(vo);
							}
							if (opnum5 != null) {
								OptionVO res5 = goodsService.goodoption(opnum5);
								if (rmile > Integer.parseInt(opcount5)
										* (result.getP_sellprice() + res5.getPo_addprice()) + 3000) {
									vo.setO_price("0");
									rmile = rmile - (Integer.parseInt(opcount5)
											* (result.getP_sellprice() + res5.getPo_addprice()) + 3000);
								} else {
									vo.setO_price(Integer.toString(Integer.parseInt(opcount5)
											* (result.getP_sellprice() + res5.getPo_addprice()) + 3000 - rmile));
									rmile = 0;
								}
								vo.setPo_optionnum(Integer.parseInt(opnum5));
								vo.setO_count(Integer.parseInt(opcount5));
								goodsService.insertorder(vo);
								if ((String) session.getAttribute("id") != null) {
									vo.setO_price(Integer.toString((int)(Integer.parseInt(vo.getO_price())*mileage)));
									goodsService.addmile(vo);
								}
							}
						}
					}
				}
			} else {
				vo.setP_num(number);
				vo.setO_count(Integer.parseInt(p_count));
				vo.setO_price(Integer.toString(Integer.parseInt(all) - Integer.parseInt(mile)));
				goodsService.insertorder(vo);
				if ((String) session.getAttribute("id") != null) {
					vo.setO_price(Integer.toString((int)(Integer.parseInt(vo.getO_price())*mileage)));
					goodsService.addmile(vo);
				}
			}
		}
		if ((String) session.getAttribute("id") != null) {
			int user_pay = Integer.parseInt(userService.userpay((String) session.getAttribute("id")));
			session.setAttribute("user_pay", user_pay);
			String upgrade = (String) session.getAttribute("grade");
			if ("BRONZE".equals(upgrade) && user_pay >= 300000 && user_pay < 1000000) {
				goodsService.supdategrade((String) session.getAttribute("id"));
				session.setAttribute("grade", "SILVER");
			} else if (("SILVER".equals(upgrade) || "BRONZE".equals(upgrade)) && user_pay >= 1000000
					&& user_pay < 2000000) {
				session.setAttribute("grade", "GOLD");
			} else if (("GOLD".equals(upgrade) || "SILVER".equals(upgrade) || "BRONZE".equals(upgrade))
					&& user_pay >= 2000000) {
				session.setAttribute("grade", "VIP");
			}
		}
	}

	//회원가입
	@RequestMapping(value= "/join_step2.do", method=RequestMethod.POST)
	@ResponseBody
	public String getUserJoin(@RequestParam("id_ch") String e1,@RequestParam("u_pass") String u_pass, 
			HttpServletRequest request, UserVO vo) throws Exception { 
		userService.userJoin(vo); 

		return "";
	}      


	//회원가입
	@RequestMapping(value= "/join_step3.do", method=RequestMethod.POST)
	public String postUserJoin(String u_id, String u_pass, String u_name, String u_tel1, String u_tel2, String u_tel3, String u_height, String u_weight, String birth_year, String birth_month, String birth_day, String u_addr1, String u_addr2, String u_addr3, String u_addr4) throws Exception{


		UserVO vo = new UserVO();
		vo.setU_id(u_id);
		vo.setU_pass(u_pass);
		vo.setU_name(u_name);
		vo.setU_tel(u_tel1+"-"+u_tel2+"-"+u_tel3);
		vo.setU_height(Integer.parseInt(u_height));
		vo.setU_weight(Integer.parseInt(u_weight));
		vo.setU_idnum(birth_year+"/"+birth_month+"/"+birth_day);
		vo.setU_addr(u_addr1+"/"+u_addr2+"/"+u_addr3);
		
		System.out.println(vo.getU_id());
		
		userService.userJoin(vo);
		
		return "/join_step3";
	}

	//회원정보 수정 다른페이지에서 userUpdate 페이지로가기위해서 회원정보눌렀을떄 userUpdate.do를 요청해서 vo가져오고 userUpdate.jsp에
	@RequestMapping("/userUpdate.do")
	public Map registerUpdate(HttpSession session) throws Exception{

		Map map = new HashMap();

		System.out.println(session.getAttribute("id"));
		String id = (String) session.getAttribute("id");
		UserVO vo = userService.getuserinfo(id);
		map.put("userUpdate",vo);

		System.out.println(vo.getU_idnum());
		return map;
	}

	//꼭 요청이랑 돌려주는 페이지가 같을 필요 없이 mypage로 리턴만
	@RequestMapping("/userInfoChange.do")
	public String userInfoChange(String u_id, String u_pass, String u_name, String u_tel1, String u_tel2, String u_tel3, int u_height, int u_weight, String birth_year, String birth_month, String birth_day, String u_addr1, String u_addr2, String u_addr3, String u_addr4) throws Exception{
		System.out.println("userInfoChange요청");
		
		UserVO vo = new UserVO();
		vo.setU_id(u_id);
		vo.setU_pass(u_pass);
		vo.setU_name(u_name);
		vo.setU_tel(u_tel1+"-"+u_tel2+"-"+u_tel3);
		vo.setU_height(u_height);
		vo.setU_weight(u_weight);
		vo.setU_idnum(birth_year+"/"+birth_month+"/"+birth_day);
		vo.setU_addr(u_addr1+"/"+u_addr2+"/"+u_addr3);

		userService.userUpdate(vo);
		return "/mypage";
	} 

	
	@RequestMapping("/userDeleteView.do")
	public Map userDelete(HttpSession session) throws Exception{

		Map map = new HashMap();

		System.out.println(session.getAttribute("id"));
		String id = (String) session.getAttribute("id");
		UserVO vo = userService.getuserinfo(id);
		map.put("userDelete",vo);

		System.out.println(vo.getU_idnum());
		return map;
	}

//	// 회원 탈퇴 post
//	@RequestMapping(value="/userDelete.do")
//	public String userDelete(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
//
//		// 세션에 있는 user를 가져와 user변수에 넣어줍니다.
//		UserVO user = (UserVO) session.getAttribute("user");
//		// 세션에있는 비밀번호
//		String sessionPass = user.getU_pass();
//		// vo로 들어오는 비밀번호
//		String voPass = vo.getU_pass();
//
//		if(!(sessionPass.equals(voPass))) {
//			rttr.addFlashAttribute("msg", false);
//			System.out.println("비번틀림탈퇴실패");
//			return "redirect:/userDeleteView";
//		}
//		userService.userDelete(vo);
//		session.invalidate();
//		System.out.println("탈퇴성공");
//		return "redirect:/homepage.do";
//	}
	
}
