package com.company.service;

public interface YHTicketService {

	public int insertTicket();
	public int getTicket();
	public int deleteTicket(int wait_ticket);
	public int getWaitNumBeforeMe(int wait_ticket);
}
