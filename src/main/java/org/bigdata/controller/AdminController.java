package org.bigdata.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.bigdata.domain.CoatAttachImageVO;
import org.bigdata.domain.CoatVO;
import org.bigdata.domain.Criteria;
import org.bigdata.domain.PageDTO;
import org.bigdata.domain.PantsVO;
import org.bigdata.domain.ShoesVO;
import org.bigdata.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin")
@Log4j
@AllArgsConstructor
public class AdminController {

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;

	// 관리자 메인 페이지 이동
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public void adminMainGET() throws Exception {

		log.info("관리자 페이지로 이동");
	}
	
	
	  //상의 관리(리스트) 페이지 접속
	  @RequestMapping(value="/productCoatManage", method=RequestMethod.GET) 
	  public void productCoatManageGET(Criteria cri, Model model) throws Exception{
	  
		  log.info("상의 등록 페이지 접속"); 

		  List coatList = adminService.productCoatGetList(cri);
	  
		  if(!coatList.isEmpty()) {
			  model.addAttribute("coatList",coatList);
		  }else{
			  model.addAttribute("coatListCheck","empty");
			  return;
		  }
	  
		  //페이지 이동 인터페이스 데이터
		  model.addAttribute("pageMaker", new PageDTO(cri, adminService.productCoatGetTotal(cri)));
	  
	  }
	  
	  
	  //상의 등록페이지 접속
	  @GetMapping("/productCoat") public void productCoat() {
	  
	  }
	  
	  //상의 등록
	  @PostMapping("/productCoat") public String productCoatPOST(CoatVO
	  coat,RedirectAttributes rttr) {
	  
	  log.info("productCoatPOST" + coat);
	  
	  adminService.productCoat(coat);
	  
	  rttr.addFlashAttribute("productCoatPOST_result",coat.getCoatName());
	  
	  return "redirect:/admin/productCoatManage"; 
	  
	  }
	  
	  //상의 조회 , 수정 페이지
	  @GetMapping({"/productCoatDetail" , "/productCoatUpdate"})
	  public void productCoatDetailGet(int coatNumber, Criteria cri, Model model) {
		  
		  log.info("productCoatDetailGet 메서드" + coatNumber);
		  
		  //목록 페이지 조건 정보
		  model.addAttribute("cri",cri);
		  //조회 페이지 정보
		  model.addAttribute("productInfo", adminService.productCoatGetDetail(coatNumber));
		  
	  }
	  
	  //상의 정보 수정
	  @PostMapping("/productCoatUpdate")
	  public String productCoatUpdatePost(CoatVO coat, RedirectAttributes rttr) {
		  
		  log.info("productCoatUpdatePost메서드 실행" + coat);
		  
		  int result = adminService.productCoatUpdate(coat);
		  
		  rttr.addFlashAttribute("update_result",result);
		  
		  return"redirect:/admin/productCoatManage";
	  }
	  
	  //상의 정보 삭제
	  @PostMapping("/productCoatDelete")
	  public String productCoatDeletePost(int coatNumber, RedirectAttributes rttr) {
		  
		  log.info("productCoatUpdatePost메서드 실행" + coatNumber);
		  
		  int result = adminService.productCoatDelete(coatNumber);
		  
		  rttr.addFlashAttribute("delete_result",result);
		  
		  return"redirect:/admin/productCoatManage";
	  }
	  
	  //파일 업로드
	  @PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	  public ResponseEntity<List<CoatAttachImageVO>> uploadAjaxActionPost(MultipartFile[] uploadFile) {
		  
		  log.info("uploadAjaxActionPost메서드 실행");
		  
		  //이미지 파일 체크
		  for(MultipartFile multipartFile : uploadFile) {
			  
			  File checkfile = new File(multipartFile.getOriginalFilename());
			  String type = null;
			  
			  try {
				  
				type = Files.probeContentType(checkfile.toPath()); 
				
				log.info("MIME TYPE : " + type);
				
			  }catch(IOException e) {
				  
				  e.printStackTrace();
			  }
			  
			  if(!type.startsWith("image")) {
				  
				  List<CoatAttachImageVO> list = null;
				  
				  return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			  }
		  }
		  
		  
		  String uploadFolder = "C:\\upload";
		  
		  
		  //날짜 폴더 경로
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		  
		  Date date = new Date();
		  
		  String str = sdf.format(date);
		  
		  String datePath = str.replace("-",File.separator);
		  
		  
		  //폴더 생성
		  // C:\ upload\2022\11\30
		  File uploadPath = new File(uploadFolder, datePath);
		  
		  if(uploadPath.exists() == false) {
			  uploadPath.mkdirs();
		  }
		  
		  
		  //이미지 정보를 담는 객체
		  List<CoatAttachImageVO> list = new ArrayList();
		  
		  for(MultipartFile multipartFile : uploadFile) {
			  
			  //이미지 정보 객체
			  CoatAttachImageVO vo = new CoatAttachImageVO();
			  
			  //파일 이름
			  String uploadFileName = multipartFile.getOriginalFilename();
			  vo.setFileName(uploadFileName);
			  vo.setUploadPath(datePath);
			  
			  //uuid(고유 번호) 적용 파일 이름
			  String uuid = UUID.randomUUID().toString();
			  vo.setUuid(uuid);
			  
			  uploadFileName = uuid + "_" + uploadFileName;
			  
			  //파일 위치, 파일 이름을 합친 File 객체
			  File saveFile = new File(uploadPath, uploadFileName);
			  
			  //파일 저장
			  try {
				  multipartFile.transferTo(saveFile);
				  
				  //썸네일 생성(ImageIO)
				  File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				  
				  BufferedImage bo_image = ImageIO.read(saveFile);
				  
				  double ratio = 3;
				  
				  //넓이 높이 
				  int width = (int)(bo_image.getWidth() / ratio); 
				  int height = (int)(bo_image.getHeight() / ratio);
				  
				  Thumbnails.of(saveFile)
				  .size(300, 400)
				  .toFile(thumbnailFile);
				  
			  }catch(Exception e){
				  e.printStackTrace();
			  }
			  list.add(vo);
			  
		  }//for
		  
		  ResponseEntity<List<CoatAttachImageVO>> result = new ResponseEntity<List<CoatAttachImageVO>>(list,HttpStatus.OK);
		  
		  return result;
	  }
	  
	  //이미지 파일 삭제
	  @PostMapping("/deleteFile")
	  public ResponseEntity<String> deleteFile(String fileName){
		  log.info("deleteFile 메서드 실행" +fileName);
		  
		  File file = null;
		  
		  try{
			  //썸네일 파일 삭제
			  file = new File("c:\\upload\\" + URLDecoder.decode(fileName,"UTF-8"));
			  file.delete();
			  
			  
			  //원본 파일 삭제
			  String originFileName = file.getAbsolutePath().replace("s_","");
			  
			  log.info("originFileName :" +originFileName);
			  
			  file = new File(originFileName);
			  file.delete();
			  
		  }catch(Exception e) {
			  
			  e.printStackTrace();
			  return new ResponseEntity<String>("fali", HttpStatus.NOT_IMPLEMENTED);
			  
		  }//catch
		  
		  return new ResponseEntity<String>("success", HttpStatus.OK);
	  }
	  

	  
	  
	  
	  
	  
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
