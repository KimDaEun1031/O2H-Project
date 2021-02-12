package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.mapper.YHTicketMapper;

@Service
public class YHTicketServiceImp implements YHTicketService {
	
	@Autowired
	YHTicketMapper mapper;
	
	@Override
	public int insertTicket() {
		// TODO Auto-generated method stub
		return mapper.insertTicket();
	}

	@Override
	public int getTicket() {
		// TODO Auto-generated method stub
		return mapper.getTicket();
	}

	@Override
	public int deleteTicket(int wait_ticket) {
		// TODO Auto-generated method stub
		return mapper.deleteTicket(wait_ticket);
	}

	@Override
	public int getWaitNumBeforeMe(int wait_ticket) {
		// TODO Auto-generated method stub
		return mapper.getWaitNumBeforeMe(wait_ticket);
	}

	@Override
	public int getWaitNum() {
		// TODO Auto-generated method stub
		return mapper.getWaitNum();
	}

}
