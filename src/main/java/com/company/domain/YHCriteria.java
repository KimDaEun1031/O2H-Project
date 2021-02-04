package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class YHCriteria {
	private int pageNum;
	private int amount;
	
	private String type;
	
	private String keyword;
	
	public YHCriteria() {
		this(1,10);
	}
	
	public YHCriteria(int pageNum,int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}

	public String[] getTypeArr() {
		
		return type==null?new String[] {}: type.split("");
		
	}
	
}
