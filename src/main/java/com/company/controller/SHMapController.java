package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.company.domain.SHMapLocationListVO;
import com.company.service.SHMapLocationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SHMapController {
	
	@Autowired
	private SHMapLocationService service;
	
	@GetMapping(path = "/map/healthMap")
	public void healthMap() {
		log.info("healthMap");
	}
	
	@GetMapping(path = "/map/list/{page}/{pageCount}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<SHMapLocationListVO> getMapLocation(@PathVariable(name = "page")int page, @PathVariable(name = "pageCount")int pageCount) {
		log.info("mapLocation" + page + pageCount);
		
		SHMapLocationListVO lvo = service.getMapLocationList(page, pageCount);
		
		log.info(String.valueOf(lvo.getList().size()));
		
		if (!lvo.getList().isEmpty()) {
			return new ResponseEntity<SHMapLocationListVO>(lvo, HttpStatus.OK);
		} else {
			return new ResponseEntity<SHMapLocationListVO>(lvo, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
