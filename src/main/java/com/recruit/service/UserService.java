package com.recruit.service;

import java.util.Date;

import com.recruit.domain.BoardVO;
import com.recruit.dto.LoginDTO;

public interface UserService {

	//
	public BoardVO login(LoginDTO dto) throws Exception;

	//로그인 정보를 유지
	public void keepLogin(String id, String sessionId, Date next)throws Exception;
	  
	//과거에 접속한 사용자인지 확인
	public BoardVO checkLoginBefore(String value);  
	
}
