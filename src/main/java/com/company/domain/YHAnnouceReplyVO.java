package com.company.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class YHAnnouceReplyVO {
	
	private int rno;
	private int bno;
	
	private String replyer;
	private Date regdate;
	private String content;
}
