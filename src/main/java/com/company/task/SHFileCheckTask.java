package com.company.task;

import java.io.File;
import java.io.FileFilter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.company.controller.SHTeacherUploadController;
import com.company.service.SHTeacherService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SHFileCheckTask {
	
	@Autowired
	private SHTeacherService service;

	public void cleanInvalidFile(String directory, List<String> userList) {
		log.info("cleanInvalidFile" + directory + userList);
		
		File dir = new File(directory);

		FileFilter filter = (file) -> {
			if (file.isDirectory()) {
				return false;
			}
			
			String longFileName = file.getName();
			int extensionIndex = longFileName.lastIndexOf(".");
			String shortFilename = longFileName.substring(0, extensionIndex);

			for(String userId : userList) {
				if (shortFilename.equals(userId) || shortFilename.equals("s_" + userId)) {
					return false;
				}
			}
			
			log.info(file.getName());
			
			return true;
		};
		
		File[] files = dir.listFiles(filter);
		
		for(File selectedFile : files) {
			if (selectedFile.exists()) {
				selectedFile.delete();
			}
		}
	}
	
	public void cleanProfileFolder(String directory, List<String> userList) {
		log.info("cleanProfileFolder" + directory + userList);
		
		File dir = new File(directory);
		
		for(String userId : userList) {
			FileFilter filter = (file) -> {
				if (file.isDirectory()) {
					return false;
				}
				
				String longFileName = file.getName();
				int extensionIndex = longFileName.lastIndexOf(".");
				String shortFilename = longFileName.substring(0, extensionIndex);

				return shortFilename.equals(userId);
			};
			
			File[] files = dir.listFiles(filter);
			
			if (files.length > 0) {
				File file = files[0];
				
				for(File selectedFile : files) {
					file = selectedFile.lastModified() > file.lastModified() ? selectedFile : file;
				}
				
				for(File selectedFile : files) {
					if (!selectedFile.equals(file)) {
						selectedFile.delete();
						
						File thumbnail = new File(directory, "s_" + selectedFile.getName());
						
						if (thumbnail.exists()) {
							thumbnail.delete();
						}
					}
				}
			}
		}
	}
	
	public void cleanTemporaryFolder(String directory) {
		log.info("cleanTemporaryFolder" + directory);
		
		File dir = new File(directory);
		
		File[] files = dir.listFiles();
		
		for (File selectedFile : files) {
			if (selectedFile.exists()) {
				selectedFile.delete();
			}
		}
	}
	
	@Scheduled(cron = "0 * * * * *")
	public void cleanFolder() {
		log.info("cleanFolder");
		
		List<String> list = service.getValidUserId();
		
		if(!list.isEmpty()) {
			cleanInvalidFile(SHTeacherUploadController.profileUploadFolder, list);
			cleanProfileFolder(SHTeacherUploadController.profileUploadFolder, list);
		}
		
		cleanTemporaryFolder(SHTeacherUploadController.temporaryUploadFolder);
	}

}
