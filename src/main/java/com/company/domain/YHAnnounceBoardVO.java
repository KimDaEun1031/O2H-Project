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
	private String writer_id;
	private String content;
	private Date regdate;
	private int written;
	private int replycnt;
	private String title;
	private List<YHAnnouceReplyVO> replys;
	private YHPageVO pageVo;
}
