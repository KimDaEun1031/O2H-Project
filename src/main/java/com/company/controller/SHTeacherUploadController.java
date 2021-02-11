package com.company.controller;

import java.io.File;
import java.io.FileFilter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.KDLoginInfoVO;
import com.company.service.SHTeacherService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Controller
public class SHTeacherUploadController {
	
	// 강사 프로필 이미지 폴더  "D:\\projectFiles\\profile";
	public static final String profileUploadFolder = "D:\\projectFiles\\profile";
	// 강사 프로필 이미지 임시파일 폴더 "D:\\projectFiles\\profile\\temp";
	public static final String temporaryUploadFolder = "D:\\projectFiles\\profile\\temp";
	// 강사 기본 프로필 이미지 파일 "D:\\projectFiles\\profile\\default\\default.jpg";
	public static final String defaultImageFile = "D:\\projectFiles\\profile\\default\\default.jpg";
	
	@Autowired
	private SHTeacherService service;

	@ResponseBody
	@GetMapping(path = "/user/teacherProfileDisplay", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> teacherProfileDisplay(@RequestParam(name = "fileName")String fileName) throws IOException {
		return fileDisplay(profileUploadFolder, fileName);
	}
	
	@ResponseBody
	@GetMapping(path = "/user/teacherTemporaryDisplay", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> teacherTemporaryDisplay(@RequestParam(name = "fileName")String fileName) throws IOException {
		return fileDisplay(temporaryUploadFolder, fileName);
	}

	@RequestMapping(value = "/user/teacherProfileUpload", method = RequestMethod.POST)
	public ResponseEntity<String> teacherProfileUpload(@RequestBody @RequestParam(name = "uploadFile")MultipartFile mfile, HttpServletRequest request) throws IOException {
		String userId = ((KDLoginInfoVO) request.getSession().getAttribute("loginInfo")).getUserId();
		
		log.info("userId : " + userId);
		
		log.info("uploadFile : " + mfile);

		File check = new File(mfile.getOriginalFilename());
		
		log.info(check.toString());
		
		MimetypesFileTypeMap map = new MimetypesFileTypeMap();
		map.addMimeTypes("image jpg jpeg gif png");
		
		log.info(map.getContentType(check));
		
		if (map.getContentType(check).contains("image")) {
			String extension = mfile.getOriginalFilename().substring(mfile.getOriginalFilename().lastIndexOf('.'));
			
			InputStream imageStream = mfile.getInputStream();
			
			File thumbnailFile = new File(temporaryUploadFolder + "\\s_" + userId + extension);
			
			log.info(thumbnailFile.toString());
			
			FileOutputStream thumbnailStream = new FileOutputStream(thumbnailFile);

			Thumbnailator.createThumbnail(imageStream , thumbnailStream, 100, 100);
			
			thumbnailStream.close();
			imageStream.close();
			
			File file = new File(temporaryUploadFolder + "\\" + userId + extension);
			
			mfile.transferTo(file);
			
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
		}
	}
	
	private ResponseEntity<Resource> fileDisplay(String folder, String fileName) throws IOException {
		log.info(folder);

		File dir = new File(folder);
		
		FileFilter filter = (file) -> {
			if (file.isDirectory()) {
				return false;
			}
			
			String longFileName = file.getName();

			int extensionIndex = longFileName.lastIndexOf(".");
			String shortFilename = longFileName.substring(0, extensionIndex);

			return shortFilename.equals(fileName);
		};

		File[] files = dir.listFiles(filter);

		if (files.length > 0) {
			File file = files[0];
			
			for(File selectedfile : files) {
				file = selectedfile.lastModified() > file.lastModified() ? selectedfile : file;
			}
			
			Resource resource = new FileSystemResource(folder + "\\" + file.getName()); // 파일 리솟스 객체 생성

			String contentType = null;
			
			File content = new File(file.getName());
			
			contentType = Files.probeContentType(content.toPath()); // 파일 타입
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", contentType); // 헤더 설정
			
			return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
		} else {
			/*
			Resource resource = new FileSystemResource(defaultImageFile); // 파일 리솟스 객체 생성
			
			String contentType = null;
			
			File content = new File(defaultImageFile);
			
			contentType = Files.probeContentType(content.toPath()); // 파일 타입
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", contentType); // 헤더 설정
			
			return new ResponseEntity<Resource>(resource, headers, HttpStatus.NOT_FOUND);
			*/
			return new ResponseEntity<Resource>(null, null, HttpStatus.NOT_FOUND);
		}		
	}


}