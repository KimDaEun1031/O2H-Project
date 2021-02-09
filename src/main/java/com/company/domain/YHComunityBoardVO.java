package com.company.domain;

import java.util.Date;

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
public class YHComunityBoardVO {
	int bno;
	String title;
	String writer_id;
	String filename;
	String content;
	Date regdate;
	int seen;
}
