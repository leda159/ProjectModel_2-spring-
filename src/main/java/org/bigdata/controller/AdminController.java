package org.bigdata.controller;

import org.bigdata.domain.CoatVO;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;
import org.bigdata.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;

	// 관리자 메인 페이지 이동
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public void adminMainGET() throws Exception {

		log.info("관리자 페이지로 이동");
	}

	
	  //상의 관리 페이지 접속
	  @RequestMapping(value="/productCoatManage", method=RequestMethod.GET) public
	  void productCoatManageGET() throws Exception{
	  
	  log.info("상의 등록 페이지 접속"); }
	  
	  
	  //상의 등록페이지 접속
	  @GetMapping("/productCoat") public void productCoat() {
	  
	  }
	  
	  //상의 등록페이지
	  @PostMapping("/productCoat") public String productCoatPOST(CoatVO
	  coat,RedirectAttributes rttr) {
	  
	  log.info("productCoatPOST" + coat);
	  
	  adminService.productCoat(coat);
	  
	  rttr.addFlashAttribute("productCoatPOST_result",coat.getCoatName());
	  
	  return "redirect:/admin/productCoatManage"; }
	  
	  
	  
	  
	  
	  
	  //하의 관리 페이지 접속
	  @RequestMapping(value="/productPantsManage", method=RequestMethod.GET) public
	  void productPantsManageGET() throws Exception{
	  
	  log.info("하의 등록 페이지 접속"); }
	  
	  
	  //하의 관리 페이지 접속
	  @GetMapping("/productPants") public void productPants() {
	  
	  }
	  
	  //하의 등록
	  @PostMapping("/productPants") public String productPantsPOST(PantsVO
	  pants,RedirectAttributes rttr) {
	  
	  log.info("productPantsPOST" + pants);
	  
	  adminService.productPants(pants);
	  
	  rttr.addFlashAttribute("productPantsPOST_result",pants.getPantsName());
	  
	  return "redirect:/admin/productPantsManage"; 
	  
	  }
	  
	 
	// 신발 관리 페이지 접속
	@RequestMapping(value = "/productShoesManage", method = RequestMethod.GET)
	public void productShoesManageGET() throws Exception {

		log.info("신발 등록 페이지 접속");
	}

	// 신발 등록
	@GetMapping("/productShoes")
	public void productShoes() {

	}

	@PostMapping("/productShoes")
	public String productShoesPOST(ShoesVO shoes, RedirectAttributes rttr) {

		log.info("productShoesPOST" + shoes);

		adminService.ProductShoes(shoes);

		rttr.addFlashAttribute("productShoesPOST_result", shoes.getShoesName());

		return "redirect:/admin/productShoesManage";
	}
}
