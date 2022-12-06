package org.bigdata.task;


import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import org.bigdata.domain.AttachImageVO;
import org.bigdata.mapper.AdminMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TaskTest {

	@Autowired
	private AdminMapper mapper;
	
	
	private String getFolderYesterDay() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
	
	@Test
	public void taskTests() {
		
		List<AttachImageVO> fileList = mapper.checkFileList();
		
		log.info("fileList : ");
		fileList.forEach( list -> System.out.println(list));
		log.info("========================================");
		
		List<Path> checkFilePath = new ArrayList<Path>();
		
		fileList.forEach(vo -> {
			Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
			checkFilePath.add(path);
		});
		
		log.info("checkFilePath : ");
		checkFilePath.forEach(list -> System.out.println(list));
		log.info("========================================");
		
		fileList.forEach(vo -> {
			Path path = Paths.get("C:\\upload", vo.getUploadPath(),"s_" + vo.getUuid() + "_" + vo.getFileName());
			checkFilePath.add(path);
		});
		
		log.info("checkFilePath(썸네일 이미지 정보 추가 후) : ");
		checkFilePath.forEach(list -> System.out.println(list));
		log.info("========================================");
		
		
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		File[] targetFile = targetDir.listFiles();
		
		log.info("targetFile : ");
		for(File file : targetFile) {
			System.out.println(file);
		}
		log.info("========================================");
		
		
		
		List<File> removeFileList = new ArrayList<File>(Arrays.asList(targetFile));
		
		log.info("removeFileList(필터 전) : ");		
		removeFileList.forEach(file -> {
			log.info(file);
		});		
		log.info("========================================");		
		
		for(File file : targetFile){
			checkFilePath.forEach(checkFile ->{
				if(file.toPath().equals(checkFile)) 
					removeFileList.remove(file);	
			});
		}
		
		log.info("removeFileList(필터 후) : ");
		removeFileList.forEach(file -> {
			log.info(file);
		});
		log.info("========================================");
		
		// 파일 삭제 
		for(File file : removeFileList) {
			log.info("삭제 : " + file);
			file.delete();
		}
	}
}









