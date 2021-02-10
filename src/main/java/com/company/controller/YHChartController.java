package com.company.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.domain.YHCalVO;
import com.company.service.YHCalService;

import lombok.extern.slf4j.Slf4j;
import oracle.sql.DATE;

@Controller
@Slf4j
@RequestMapping("/helloworld/*")
public class YHChartController {
	@Autowired
	private YHCalService service;
	
	@RequestMapping("/see")
	public String hellochart(Model model,YHCalVO vo) {
		
		Date now=new Date();
		int day=now.getDate();
		int month=now.getMonth()+1;
		int year=now.getYear()+1900;
		System.out.println(day);
		System.out.println(month);
		System.out.println(year);
		int fullday=year*10000+month*100+day;
		
		vo.setDates(fullday);
		vo.setUser_id("temp");
		List<YHCalVO> list=service.select(vo);
		System.out.println(list);
		int arr[]=new int[31];
		
		for(int i=0;i<31;i++) {
			arr[i]=0;
		}
		
		for(int i=0;i<list.size();i++) {
			
			
			
			int temp= list.get(i).getDates();
			if(temp/100==month+100*year) {
			temp= temp%100;
			arr[temp]=list.get(i).getCal();
			}
			}
		

		
		List<Integer> list2=new ArrayList<Integer>();
		for(int i=0;i<arr.length;i++) {
			list2.add(arr[i]);
		}
	    log.info(list2.toString());
		model.addAttribute("list",list2);
		
		
		return "graph/graph";
	}
}
