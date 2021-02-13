package com.company.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.company.domain.KDLoginInfoVO;
import com.company.domain.SHProfileVO;
import com.company.service.SHTeacherService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component(value = "SHTeacherInterceptor")
public class SHTeacherInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private SHTeacherService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getRequestURI();
		String method = request.getMethod();
		
		log.info(uri + method);
		
		if (method == "POST") {
			return true;
		} else {
			HttpSession session = request.getSession();
			
			KDLoginInfoVO loginInfo = (KDLoginInfoVO) session.getAttribute("loginInfo");
			
			if (loginInfo == null) {
				response.sendRedirect("/");
				
				return false;
			} else {
				SHProfileVO shProfileVO = service.getProfileRow(loginInfo.getUserId());
				
				if (shProfileVO != null) {
					if (shProfileVO.getUser_level() == "teacher") { //강사 회원 가입 조건 -> 관리자 승인 요청 필요						
						request.setAttribute("profile", shProfileVO);
						
						return true;
					} else {
						response.sendRedirect("/user/teacher_access_teacher");						
						return false;
					}
				} else {
					response.sendRedirect("/user/teacher_access_user");
					
					return false;
				}
			}
		}
	}
}
