package com.company.controller;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.company.domain.KDLoginInfoVO;
import com.company.service.SHKakaoLoginService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/register")
@Controller
public class SHKakaoLoginController {

	private static final String authHost = "https://kauth.kakao.com";
	private static final String apiHost = "https://kapi.kakao.com";
	
	private static final String apiKey = "9bf8cc4c07693c5a08ffb5ad815b19e7";
	//private static final String redirectURI = "http://localhost:8071/register/login_kakaoprocess";
	
	@Autowired
	private SHKakaoLoginService service;
	
	@GetMapping("/login_kakao")
	public void login_kakao() {
		log.info("로그인 페이지 요청");	
	}
	
	@RequestMapping(value = "/login_kakaopage")
	public @ResponseBody String login_kakaopage(HttpServletRequest request) throws Exception {
		String serverPath = request.getScheme()+ "://" +request.getServerName()+ ":" + request.getServerPort();
		String contextPath = "";
		
		if (request.getContextPath() != "") {
			contextPath = request.getContextPath();
		}

		String redirectURI = serverPath + contextPath + "/register/login_kakaoprocess";
		
		log.info(redirectURI);
		
		String requestURI = authHost + "/oauth/authorize?client_id=" + apiKey + "&redirect_uri=" + redirectURI + "&response_type=code";
		
		return requestURI;
	}
	
	@RequestMapping(value = "/login_kakaoprocess")
	public String login_kakaoprocess(String code, String error,	String error_description, HttpServletRequest request) throws Exception {
		String serverPath = request.getScheme()+ "://" +request.getServerName()+ ":" + request.getServerPort();
		String contextPath = "";
		
		if (request.getContextPath() != "") {
			contextPath = request.getContextPath();
		}

		String redirectURI = serverPath + contextPath + "/register/login_kakaoprocess";
		
		log.info(redirectURI);
		
		HttpSession session = request.getSession();
		
		if (error == null) {
			log.info(code);
			
			Map<String, String> token = getToken(code, redirectURI);
			
			String accessToken = token.get("accessToken");
			String refreshToken = token.get("refreshToken");

			log.info(accessToken + "\n" + refreshToken);
			
			Map<String, String> map = getKakaoProperty(accessToken);
			
		    String KakaoPropertyId = map.get("id");
		    String KakaoPropertyName = map.get("name");
		    
			log.info(accessToken + "\n" + KakaoPropertyId + "\n" + KakaoPropertyName);
			
			KDLoginInfoVO vo = service.isRegistered(KakaoPropertyId);
			
			if (vo != null) {
				log.info("isRegistered");
				
				log.info(vo.toString());
				
				session.setAttribute("loginInfo", vo);
				session.removeAttribute("loginFail");
				
				session.setAttribute("accessToken", accessToken);
				session.setAttribute("refreshToken", refreshToken);
				
				return "/register/loginSuccess";
			} else {
				log.info("isNotRegistered");
				
				vo = new KDLoginInfoVO();
				
				vo.setUserName(KakaoPropertyName);
				vo.setUserId(KakaoPropertyId);
				vo.setPassword(randomPassword(30));
				vo.setAddress("선택x");
				vo.setPhoneNumber("선택x");
				vo.setUserEmail("선택x");
				vo.setUserBirth("선택x");
				vo.setInterest1("선택x");
				vo.setInterest2("선택x");
				vo.setInterest3("선택x");
				
				if(service.register(vo)) {
					vo = service.isRegistered(KakaoPropertyId);
					
					if(vo != null) {
						log.info(vo.toString());
						
						session.setAttribute("loginInfo", vo);
						session.removeAttribute("loginFail");
						
						session.setAttribute("accessToken", accessToken);
						session.setAttribute("refreshToken", refreshToken);
						
						return "/register/loginSuccess";
					} else {
						session.setAttribute("loginFail", "fail");
						
						return "/login_kakao";
					}
				} else {
					session.setAttribute("loginFail", "fail");
					
					return "/login_kakao";
				}
			}
		} else {
			log.info(error);
			log.info(error_description);
			
			session.setAttribute("loginFail", "fail");
			
			return "redirect:/register/login_kakao";
		}
	}
	
	@GetMapping("/logout_kakao") 
	public String logout_kakao(HttpSession session) throws ParseException {
		String KakaoPropertyId = "";
		
		String accessToken = (String) session.getAttribute("accessToken");
		
		if (accessToken == null) {
			return "redirect:/register/login_kakao";
		}
		
		log.info(accessToken);
		
		if (!isAccessTokenExpired(accessToken)) {
			String refreshToken = (String) session.getAttribute("refreshToken");
			
			Map<String, String> map = refreshAccessToken(refreshToken);
			
			session.setAttribute("accessToken", map.get("accessToken"));
			
			if (map.get("refreshToken") != null) {
				session.setAttribute("refreshToken", map.get("refreshToken"));
			}
			
			accessToken = (String) session.getAttribute("accessToken");
		}
		
		RestTemplate restTemplate = new RestTemplate();
	    URI uri = URI.create(apiHost + "/v1/user/logout");
	    
	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Authorization", "bearer " + accessToken);
	    
	    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
	    
	    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<MultiValueMap<String, Object>>(parameters, headers);
	    
	    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
	    JSONObject responseBody = apiResponse.getBody();
	    
	    log.info(responseBody.toJSONString());
	    
	    KakaoPropertyId = ((Integer) responseBody.get("id")).toString();
	    
	    log.info(KakaoPropertyId);
	    
	    session.removeAttribute("accessToken");
	    session.removeAttribute("refreshToken");
		session.removeAttribute("loginInfo");
		
		return "redirect:/";
	}
	
	@GetMapping("/leave_kakao")
	public void leave_kakao() {
		log.info("로그아웃 페이지 요청");	
	}
	
	@PostMapping("/leave_kakao")
	public String leave_kakaoprocess(HttpSession session) throws ParseException {
		String accessToken = (String) session.getAttribute("accessToken");
		
		if (accessToken == null) {
			return "redirect:/register/login_kakao";
		}
		
		log.info(accessToken);
		
		if (!isAccessTokenExpired(accessToken)) {
			String refreshToken = (String) session.getAttribute("refreshToken");
			
			Map<String, String> map = refreshAccessToken(refreshToken);
			
			session.setAttribute("accessToken", map.get("accessToken"));
			
			if (map.get("refreshToken") != null) {
				session.setAttribute("refreshToken", map.get("refreshToken"));
			}
			
			accessToken = (String) session.getAttribute("accessToken");
		}
		
		Map<String, String> map = getKakaoProperty(accessToken);
		
	    String KakaoPropertyId = map.get("id");
	    String KakaoPropertyName = map.get("name");
		
	    log.info(KakaoPropertyId + KakaoPropertyName);
	    
		if (service.isRegistered(KakaoPropertyId) != null) {
			if (service.leave(KakaoPropertyId)) {
				RestTemplate restTemplate = new RestTemplate();
			    URI uri = URI.create(apiHost + "/v1/user/unlink");
			    
			    HttpHeaders headers = new HttpHeaders();
			    headers.set("Authorization", "bearer " + accessToken);
			    
			    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
			    
			    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<MultiValueMap<String, Object>>(parameters, headers);
			    
			    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
			    JSONObject responseBody = apiResponse.getBody();
			    
			    log.info(responseBody.toJSONString());
			    
			    KakaoPropertyId = ((Integer) responseBody.get("id")).toString();
			    
			    log.info(KakaoPropertyId);
			    
			    session.invalidate();
			    
			    return "redirect:/";
			} else {
				return "redirect:/register/leave_kakao";	
			}
		} else {
			return "redirect:/register/leave_kakao";	
		}
	}
	
	private String randomPassword(int length) {
		StringBuilder builder = new StringBuilder();
		
		Random rnd = new Random();
		
		for (int i = 0; i < length; i++) {
		    int rIndex = rnd.nextInt(3);
		    
		    switch (rIndex) {
		    case 0:
		        // a-z
		    	builder.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		    	builder.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		    	builder.append((rnd.nextInt(10)));
		        break;
		    }
		}
		
		return builder.toString();
	}
	
	private Map<String, String> getToken(String code, String redirectURI) {
		String accessToken = "";
		String refreshToken = "";
		
		RestTemplate restTemplate = new RestTemplate();
	    URI uri = URI.create(authHost + "/oauth/token");
	    
	    HttpHeaders headers = new HttpHeaders();
	    
	    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
	    
	    parameters.set("grant_type", "authorization_code");
	    parameters.set("client_id", apiKey);
	    parameters.set("redirect_uri", redirectURI);
	    parameters.set("code", code);
	    
	    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<MultiValueMap<String, Object>>(parameters, headers);
	    
	    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
	    
	    JSONObject responseBody = apiResponse.getBody();
	    
	    accessToken = (String) responseBody.get("access_token");
	    refreshToken = (String) responseBody.get("refresh_token");
	    
	    Map<String, String> map = new HashMap<String, String>();
	    
	    map.put("accessToken", accessToken);
	    map.put("refreshToken", refreshToken);
	    
	    return map;
	}
	
	private Map<String, String> getKakaoProperty(String accessToken) {
		String KakaoPropertyId = "";
		String KakaoPropertyName = "";

		RestTemplate restTemplate = new RestTemplate();
		URI uri = URI.create(apiHost + "/v2/user/me");

	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Authorization", "bearer " + accessToken);

	    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
	    
	    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<MultiValueMap<String, Object>>(parameters, headers);
	    
	    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
	    JSONObject responseBody = apiResponse.getBody();
	    
	    log.info(responseBody.toJSONString());
	    
	    KakaoPropertyId = ((Integer) responseBody.get("id")).toString();

	    JSONObject kakao_account = new JSONObject((Map<String, String>) responseBody.get("kakao_account"));
	    JSONObject profile = new JSONObject((Map<String, String>) kakao_account.get("profile"));
	    
	    KakaoPropertyName = profile.get("nickname").toString();

	    Map<String, String> map = new HashMap<String, String>();
	    
	    map.put("id", KakaoPropertyId);
	    map.put("name", KakaoPropertyName);
	    
	    return map;
	}
	
	private boolean isAccessTokenExpired(String accessToken) throws ParseException {
		RestTemplate restTemplate = new RestTemplate();
		URI uri = URI.create(apiHost + "/v1/user/access_token_info");
		
		HttpHeaders headers = new HttpHeaders();
	    headers.set("Authorization", "bearer " + accessToken);
	    
	    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
	    
	    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<MultiValueMap<String, Object>>(parameters, headers);
	    
	    try {
	    	ResponseEntity<JSONObject> apiResponse = restTemplate.exchange(uri, HttpMethod.GET, restRequest, JSONObject.class);
	    	
	    	JSONObject responseBody = apiResponse.getBody();
		    
		    log.info(responseBody.toJSONString());
		    
		    String appId = ((Integer) responseBody.get("appId")).toString();
		    String id = ((Integer) responseBody.get("id")).toString();
		    int expires_in = ((Integer) responseBody.get("expires_in"));
		    
		    log.info(appId + "\n" + id + "\n" + expires_in);
		    
		    if (expires_in < 60) {
		    	return false;
		    } else {
		    	return true;
		    }
		    
	    } catch(HttpClientErrorException httpException) {
	    	JSONParser jsonParser = new JSONParser();
	    	
	    	HttpStatus status = httpException.getStatusCode();
    		
    		JSONObject statusText = (JSONObject) jsonParser.parse(httpException.getResponseBodyAsString());
    		
    		String msg = statusText.get("msg").toString();
    		int code = (Integer) statusText.get("code");
    		
    		log.info(status.toString() + "\n" + msg + "\n" + code);
    		
    		return false;
	    }
	}
	
	private Map<String, String> refreshAccessToken(String refreshToken) {
		RestTemplate restTemplate = new RestTemplate();
		URI uri = URI.create(authHost + "/oauth/token");

	    HttpHeaders headers = new HttpHeaders();

	    MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
	    
	    parameters.set("grant_type", "refresh_token");
	    parameters.set("client_id", apiKey);
	    parameters.set("refresh_token", refreshToken);
	    
	    HttpEntity<MultiValueMap<String, Object>> restRequest = new HttpEntity<MultiValueMap<String, Object>>(parameters, headers);
	    
	    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(uri, restRequest, JSONObject.class);
	    JSONObject responseBody = apiResponse.getBody();
	    
	    log.info(responseBody.toJSONString());
	    
	    Map<String, String> map = new HashMap<String, String>();
	    
	    String access_token = responseBody.get("access_token").toString();
	    String expires_in = ((Integer) responseBody.get("expires_in")).toString();

	    map.put("access_token", access_token);
	    map.put("expires_in", expires_in);
	    
	    log.info(access_token + "\n" + expires_in);
	    
	    String refresh_token = "";
	    String refresh_token_expires_in = "";

	    if (responseBody.get("refresh_token") != null && responseBody.get("refresh_token_expires_in") != null) {
	    	refresh_token = responseBody.get("refresh_token").toString();
	    	refresh_token_expires_in = ((Integer) responseBody.get("refresh_token_expires_in")).toString();
	    	
	    	log.info(refresh_token + "\n" + refresh_token_expires_in);
	    	
	    	map.put("refresh_token", refresh_token);
		    map.put("refresh_token_expires_in", refresh_token_expires_in);
	    }

	    return map;
	}
}
