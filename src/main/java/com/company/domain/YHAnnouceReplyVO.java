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
	
	
	private String replyWriterId;
	private Date replyRegDate;
	private Date replyUpdateDate; 
	private String replyContent;
}
