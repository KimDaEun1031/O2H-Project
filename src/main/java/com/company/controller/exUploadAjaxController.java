package com.company.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.HYFileAttach;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
public class exUploadAjaxController {

	
	@GetMapping("/displays")
	public ResponseEntity<byte[]> getFile(String fileName,HttpServletRequest req){
		log.info("썸네일 요청 "+fileName);
		
		
		String uploadFolder = req.getServletContext().getRealPath("/photo/");
		File f = new File(uploadFolder+"\\"+fileName);
		
		ResponseEntity<byte[]> entity = null;
		log.info("썸네일 요청f "+f);
		
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(f.toPath())); // image/jpg
			log.info("썸네일 요청h "+headers);
			entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f),
					headers,HttpStatus.OK);
			log.info("썸네일 요청e "+entity);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	
	//서버에 저장한 파일이 이미지인지 일반 파일인지 확인
	// .jsp, .sql, => 다른 마인이 필요함-일반적이지 않은 것은 null남
	private boolean checkImagedType(File file) { // ~.txt => text/plain, text/html, image/jpeg, image/png
		
		MimetypesFileTypeMap m = new MimetypesFileTypeMap(); // 요즘 방식이지만 11버전에서는 라이브러리가 또 빠졌음.
		m.addMimeTypes("image png jpg jpeg git");
		return m.getContentType(file).contains("image");

	} // checkImageType end
	
	
	//날짜에 따라 폴더 생성하기
	private String getdFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(); // 시간,날짜가 길게 나옴
		String str = sdf.format(date); // 2021-01-21
		return str.replace("-", File.separator); // 2021\01\20, "_"이렇게 했을 때 없으니까 yyyy-MM-dd 이런 형식 그대로 폴더 생겼었음
	} // getFolder end
	
	
	
	
	
	
	
	
}
