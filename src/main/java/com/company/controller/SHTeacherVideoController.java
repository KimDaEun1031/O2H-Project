package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.company.domain.SHVideoListVO;
import com.company.domain.SHVideoVO;
import com.company.service.SHTeacherService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SHTeacherVideoController {
	
	@Autowired
	private SHTeacherService service;
	
	@GetMapping("/user/teacher_video")
	public void teacher_video_setting() {	
		log.info("강사 비디오 페이지 요청");
		
	}
	
	@GetMapping(path = "/video/list/{userId}/{page}/{pageCount}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<SHVideoListVO> getList(@PathVariable(name = "userId")String userId, @PathVariable(name = "page")int page, @PathVariable(name = "pageCount")int pageCount) {
		log.info("list" + userId + page + pageCount);
		
		SHVideoListVO lvo = service.getVideoList(userId, page, pageCount);
		
		log.info(String.valueOf(lvo.getList().size()));
		
		if (!lvo.getList().isEmpty()) {
			return new ResponseEntity<SHVideoListVO>(lvo, HttpStatus.OK);
		} else {
			return new ResponseEntity<SHVideoListVO>(lvo, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@GetMapping(path = "/video/movie/{userId}/{videoId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<SHVideoVO> getRow(@PathVariable(name = "userId")String userId, @PathVariable(name = "videoId")String videoId) {
		log.info("row" + userId + videoId);
		
		SHVideoVO vo = service.getVideoRow(userId, videoId);

		if (vo != null) {
			log.info("VideoVO vo : " + vo.toString());
			
			return new ResponseEntity<SHVideoVO>(vo, HttpStatus.OK);
		} else {
			log.info("VideoVO vo : " + null);
			
			return new ResponseEntity<SHVideoVO>(vo, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping(path = "/video/movie", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody SHVideoVO vo) {
		log.info("post" + vo);
		
		try {
			if (service.insertVideo(vo)) {
				return new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} catch(RuntimeException e) {
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PatchMapping(path = "/video/movie/{userId}/{videoId}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> update(@PathVariable(name = "userId")String userId, @PathVariable(name = "videoId") String videoId, @RequestBody SHVideoVO vo) {
		log.info("patch" + userId + videoId + vo);

		try {
			if (service.updateVideo(vo)) {
				return new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} catch(RuntimeException e) {
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@DeleteMapping(path = "/video/movie/{userId}/{videoId}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> delete(@PathVariable(name = "userId")String userId, @PathVariable(name = "videoId") String videoId) {
		log.info("delete" + userId + videoId);

		if (service.deleteVideo(userId, videoId)) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
