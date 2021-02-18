package com.company.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.company.domain.HYFileAttach;
import com.company.domain.HYPhotoBoardFileAttach;
import com.company.mapper.HYMapper;
import com.company.mapper.HYPhotoBoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class HYFileCheckTask {
	
	@Autowired
	private HYPhotoBoardMapper photoBoardMapper;
	
	@Autowired
	private HYMapper profileMapper;
	
	@Autowired
	ServletContext servletContext;
	

	private String getFolerYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		
		c.add(Calendar.DATE, -1);
		String str = sdf.format(c.getTime());
		
		return str.replace("-", File.separator);
	}
	
	
	@Scheduled(cron = "* * 2 * * *") //새벽 2시 // 0***** 1분마다 0 * * * * *
	public void photoBoardCheckFiles() {
		log.warn("photoBoard File Check Task run...");
				
		String uploadFolder = servletContext.getRealPath("/photoBoard/");
		
		List<HYPhotoBoardFileAttach> fileList = photoBoardMapper.getOldFiles();
		
		Stream<HYPhotoBoardFileAttach> stream = fileList.stream();
		
		Stream<Path> filePath = stream.map(vo -> 
						Paths.get(uploadFolder,vo.getUploadPath(),vo.getUuid()+"_"+vo.getFileName()));
		
		List<Path> fileListPath = filePath.collect(Collectors.toList());
		
		//썸네일 부분에 해당하는 파일을 fileListPath 에 추가
		fileList.stream()
			    .filter(vo -> vo.isFileType() == true)
		        .map(vo -> Paths.get(uploadFolder, vo.getUploadPath(),"s_"+vo.getUuid()+"_"+vo.getFileName()))
		        .forEach(p -> fileListPath.add(p));
		
		
		fileListPath.forEach(p -> log.warn(""+p));		
		
		File targetDir = Paths.get(uploadFolder,getFolerYesterDay()).toFile();

		File[] removeFiles = targetDir.listFiles(file -> fileListPath.contains(file.toPath())==false);
		
						
		for(File file:removeFiles){
			log.warn(file.getAbsolutePath());
			file.delete();
		}
		
	}	
	

	@Scheduled(cron = "* * 2 * * *") //새벽 2시 // 0***** 1분마다 0 * * * * *
	public void profileCheckFiles() {
		log.warn("profile File Check Task run...");
		
		String uploadFolder = servletContext.getRealPath("/photo/");
		
		List<HYFileAttach> fileList = profileMapper.getOldFiles();
		
		Stream<HYFileAttach> stream = fileList.stream();
		
		Stream<Path> filePath = stream.map(vo -> 
		Paths.get(uploadFolder,vo.getUploadPath(),vo.getUuid()+"_"+vo.getFileName()));
		
		List<Path> fileListPath = filePath.collect(Collectors.toList());
		
		//썸네일 부분에 해당하는 파일을 fileListPath 에 추가
		fileList.stream()
		.filter(vo -> vo.isFileType() == true)
		.map(vo -> Paths.get(uploadFolder, vo.getUploadPath(),"s_"+vo.getUuid()+"_"+vo.getFileName()))
		.forEach(p -> fileListPath.add(p));
		
		
		fileListPath.forEach(p -> log.warn(""+p));		
		
		File targetDir = Paths.get(uploadFolder,getFolerYesterDay()).toFile();

		File[] removeFiles = targetDir.listFiles(file -> fileListPath.contains(file.toPath())==false);		
		
		
		for(File file:removeFiles){
			log.warn(file.getAbsolutePath());
			file.delete();
		}		
	}	
	
}
