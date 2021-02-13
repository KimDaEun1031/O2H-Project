package com.company.domain;

import lombok.Data;

@Data
public class HYFileAttach {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private String userId;	
}
