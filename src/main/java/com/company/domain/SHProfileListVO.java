package com.company.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class SHProfileListVO {
	private int profileCnt;
	private List<SHProfileVO> list;
}
