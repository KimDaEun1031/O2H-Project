package com.company.mapper;

public interface YHTicketMapper {
	public int insertTicket();
	public int getTicket();
	public int deleteTicket(int wait_ticket);
	public int getWaitNumBeforeMe(int wait_ticket);
	public int getWaitNum();
}
