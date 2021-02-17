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

@Slf4j
@Controller
public class HYUploadAjaxController {
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("ajax 업로드 폼 요청");
	}	

	@PostMapping(value = "/uploadAjax", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) //json 형태로 브라우저로 보내기
	public ResponseEntity<HYFileAttach> uploadPost(MultipartFile[] uploadFile,HttpServletRequest req) {
		log.info("업로드 요청");

		String uploadFolder = req.getServletContext().getRealPath("/photo/");
		String uploadFileName = null;
		
		//폴더 생성
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder,uploadFolderPath); 
		
		log.info("uploadFolder "+uploadFolder);
		
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}	
		
		HYFileAttach attach = null;
		
		
		for (MultipartFile f : uploadFile) {
			log.info("-------------");
			log.info("upload file name : " + f.getOriginalFilename());
			log.info("upload file size : " + f.getSize());
			
			//파일명 중복 해결
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+f.getOriginalFilename();

			attach = new HYFileAttach();
			attach.setFileName(f.getOriginalFilename());
			attach.setUploadPath(uploadFolderPath);
			attach.setUuid(uuid.toString());

			//File saveFile = new File(uploadPath, f.getOriginalFilename());
			File saveFile = new File(uploadPath, uploadFileName);

			try {
				//서버에 저장
				//이미지인지 일반 파일인지 확인
				if(checkImageType(saveFile)) {
					attach.setFileType(true);
					//이미지라면 썸네일로 한번 더 저장
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					InputStream in = f.getInputStream();
					Thumbnailator.createThumbnail(in, thumbnail, 200,200);
					in.close();
					thumbnail.close();				
				}
				//서버에 저장
				f.transferTo(saveFile);				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return new ResponseEntity<HYFileAttach>(attach,HttpStatus.OK); 
	}
	
	
	@GetMapping("/display")
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
	// .jsp, .sql, => 다른 Mime이 필요함
	private boolean checkImageType(File file) { // ~.txt => text/plain, text/html, image/jpeg, image/png
		
		MimetypesFileTypeMap m = new MimetypesFileTypeMap();
		m.addMimeTypes("image png jpg jpeg git");
		
		return m.getContentType(file).contains("image");
	}
		
	//날짜에 따라 폴더 생성하기
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date); // 2021-01-21
		return str.replace("-", File.separator);
	}	
}
