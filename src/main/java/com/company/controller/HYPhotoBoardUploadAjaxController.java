package com.company.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
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
public class HYPhotoBoardUploadAjaxController {
	
	@GetMapping("/photoBoardUploadAjax")
	public void uploadAjax() {
		log.info("ajax 업로드 폼 요청");
	}
	

	@PostMapping(value = "/photoBoardUploadAjax", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) //json 형태로 브라우저에 보내겠습니다.명시함
	public ResponseEntity<HYFileAttach> uploadPost(MultipartFile[] uploadFile,HttpServletRequest req) {
		log.info("업로드 요청");

		String uploadFolder = req.getServletContext().getRealPath("/photoBoard/");
		String uploadFileName = null;
		
		//폴더 생성
		String uploadFolderPath = getFolder(); // 
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
					
					attach.setFileType(true);
					//이미지라면 썸네일로 한번 더 저장
					// C:\\upload\\2021\\01\\20\\s_12315sdfkijl_원본파일명.jsp
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					InputStream in = f.getInputStream();
					Thumbnailator.createThumbnail(in, thumbnail, 200,200);
					in.close();
					thumbnail.close();				
				
				//서버에 저장 - 에러나서 서버에 저장을 나중에 함
				f.transferTo(saveFile);				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return new ResponseEntity<HYFileAttach>(attach,HttpStatus.OK); 
	} // uploadPost end
	
//	@GetMapping("/photoBoardDisplay") //원본
//	public ResponseEntity<byte[]> getFile(String fileName,HttpServletRequest req){
//		log.info("썸네일 요청 "+fileName);
//		
//		
//		String uploadFolder = req.getServletContext().getRealPath("/photoBoard/");
//		File f = new File(uploadFolder+"\\"+fileName);
//		
//		ResponseEntity<byte[]> entity = null;
//		
//		HttpHeaders headers = new HttpHeaders();
//		try {
//			headers.add("Content-Type", Files.probeContentType(f.toPath())); // image/jpg
//			entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f),
//					headers,HttpStatus.OK);
//		} catch (IOException e) {
//			e.printStackTrace();
//		} 
//		return entity;
//	}

	
	@GetMapping("/photoBoardDisplay") //파일 없을 때 상태로 값으로 예외처리하기
	public ResponseEntity<byte[]> getFile(String fileName,HttpServletRequest req){
		log.info("썸네일 요청 "+fileName);
		
		
		String uploadFolder = req.getServletContext().getRealPath("/photoBoard/");
		File f = new File(uploadFolder+"\\"+fileName);
		File fx = new File(uploadFolder+"\\"+"Koala.jpg");
		
		ResponseEntity<byte[]> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(f.toPath())); // image/jpg
			entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f),
					headers,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
			try {
				entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(fx),
						headers,HttpStatus.OK);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} 
		return entity;
	}

	
	//다운로드
	@GetMapping(value = "/photoBoardDownload", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> download(String fileName) {
		log.info("다운로드 요청 "+fileName);
		
		Resource resource = new FileSystemResource("/photoBoard/"+fileName);
		
		//uuid 값 제거 후 파일 다운로드 하기
		String resourceUidName = resource.getFilename();
		String resourceName = resourceUidName.substring(resourceUidName.indexOf("_")+1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			//uuid+원본파일명으로 다운로드
			headers.add("Content-Disposition", 
					"attachment;filename="+new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	} 
	
	
	//서버에서 파일 삭제
	@PostMapping("/photoBoardDeleteFile")
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
		log.info("파일 삭제 "+fileName+" 타입 : "+type);
		
		try {
			File file = new File("/photoBoard/"+URLDecoder.decode(fileName,"utf-8"));
			
			//파일(썸네일, 일반파) 삭제
			file.delete();
			
			if (type.equals("image")) { //이미지였다면 원본 이미지 삭제
				String oString = file.getAbsolutePath().replace("s_", "");
				file = new File(oString);
				file.delete();				
			} 
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail",HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("success",HttpStatus.OK);
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
