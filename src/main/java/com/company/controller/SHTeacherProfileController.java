package com.company.controller;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.company.domain.SHProfileVO;
import com.company.service.SHTeacherService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SHTeacherProfileController {

	@Autowired
	private SHTeacherService service;
	
	@GetMapping("/user/teacher_page")
	public void teacher_page() {
		log.info("강사 페이지");
	}
	
	@GetMapping("/user/teacher_profile")
	public void teacher_profile_setting() {	
		log.info("강사 프로필 페이지 요청");
		
	}
	
	@PostMapping("/user/teacher_profile")
	public String modify(@ModelAttribute(name = "profile")SHProfileVO vo, HttpServletRequest request) throws IOException {
		String profileUploadFolder = request.getServletContext().getRealPath("/profile");
		String temporaryUploadFolder = request.getServletContext().getRealPath("/profile/temp");
		
		log.info("Access : " + "/user/teacher_profile");
		
		log.info("ProfileVO : " + vo);

		if (service.updateTeacher(vo)) {
			//File dir = new File(SHTeacherUploadController.temporaryUploadFolder);
			File dir = new File(temporaryUploadFolder);
			
			FileFilter filter = (file) -> {
				if (file.isDirectory()) {
					return false;
				}
				
				String longFileName = file.getName();
				int extensionIndex = longFileName.lastIndexOf(".");
				String shortFilename = longFileName.substring(0, extensionIndex);

				return shortFilename.equals(vo.getUserId());
			};

			File[] files = dir.listFiles(filter);
			
			if (files != null && files.length > 0) {
				File chkDir = new File(profileUploadFolder);
				
				if (!chkDir.exists()) {
					chkDir.mkdirs();
				}
				
				File file = files[0];
				
				for(File selectedfile : files) {
					file = selectedfile.lastModified() > file.lastModified() ? selectedfile : file;
				}
				
				String longFileName = file.getName();
				int extensionIndex = longFileName.lastIndexOf(".");
				String extension = longFileName.substring(extensionIndex);
				
				//File srcImage = new File(SHTeacherUploadController.temporaryUploadFolder + "\\" + vo.getUserId() + extension);
				//File destImage = new File(SHTeacherUploadController.profileUploadFolder + "\\" + vo.getUserId() + extension);
				
				File srcImage = new File(temporaryUploadFolder + "\\" + vo.getUserId() + extension);
				File destImage = new File(profileUploadFolder + "\\" + vo.getUserId() + extension);
				
				if (destImage.exists()) {
					destImage.delete();
				}
				
				Files.copy(srcImage.toPath(), destImage.toPath());
				
				//File srcThumbnail = new File(SHTeacherUploadController.temporaryUploadFolder + "\\s_" + vo.getUserId() + extension);
				//File destThumbnail = new File(SHTeacherUploadController.profileUploadFolder + "\\s_" + vo.getUserId() + extension);
				
				File srcThumbnail = new File(temporaryUploadFolder + "\\s_" + vo.getUserId() + extension);
				File destThumbnail = new File(profileUploadFolder + "\\s_" + vo.getUserId() + extension);
				
				if (destImage.exists()) {
					destThumbnail.delete();
				}
				
				Files.copy(srcThumbnail.toPath(), destThumbnail.toPath());
			}
			
			log.info("Go : " + "teacher_page.jsp");
			
			return "redirect:/user/teacher_page";
		} else {
			log.info("Go : " + "teacher_profile.jsp");
			
			return "redirect:/user/teacher_profile";
		}
	}
	
	@GetMapping(path = "/user/teacher_access_user")
	public void accessUser() {
		log.info("Go to : /user/teacher_access_user.jsp");
	}
	
	@GetMapping(path = "/user/teacher_access_teacher")
	public void accessTeacher() {
		log.info("Go to : /user/teacher_access_teacher.jsp");
	}
}
