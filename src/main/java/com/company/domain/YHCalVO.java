package com.company.domain;

import java.util.Date;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
public class YHCalVO {
	private String user_id;
	private int dates;
	private int cal;
	private int extime;
	private String flag;
}
