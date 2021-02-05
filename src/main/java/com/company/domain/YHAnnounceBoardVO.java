package com.company.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class YHAnnounceBoardVO {
	private int bno;
	private String writerId;
	private String content;
	private Date regDate;
	private Date updateDate;
	private List<YHAnnouceReplyVO> replys;
	private YHPageVO pageVo;
}
