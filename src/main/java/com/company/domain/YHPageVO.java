package com.company.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class YHPageVO { // 페이지 나누깅와 관련된 모든 정보를 가지는 객체
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total;
	private YHCriteria cri;
	

	public YHPageVO(YHCriteria cri,int total) {
		this.total=total;  //젠체 게시물 수
		this.cri=cri;  // 현재 페이지 번호, 페이지당 게시물 갯수
		
		//3 눌렀으면  10이 된다음에 10으로 나눠 1 만들고 *10
		//12 누르면  20이 되고  
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage =endPage-9;
		
		//  3> 40개 1234
		int realEnd=(int)(Math.ceil((total/1.0)/cri.getAmount()));
		
		if(realEnd<this.endPage) {
			this.endPage=realEnd;
		}
		
		this.prev=this.startPage>1;
		this.next=this.endPage<realEnd;
	}
	
}
