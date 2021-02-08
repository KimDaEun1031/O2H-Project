package com.company.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KDCalexVO {
	private String cal_title;
	private Date cal_start;
	private Date cal_end;
	private String cal_description;
	private String cal_type;
	private String cal_username;
	private String cal_backgroundColor;
	private String cal_textColor;
	private char cal_allDay;
}
