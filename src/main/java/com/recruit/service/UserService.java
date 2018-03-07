package com.recruit.service;

import java.util.Date;

import com.recruit.domain.BoardVO;
import com.recruit.dto.LoginDTO;

public interface UserService {

	//633 start
	public BoardVO login(LoginDTO dto) throws Exception;
	//633 end

	//665 start
	/*  
	로그인 정보를 유지하는 keepLogin과 
	과거에 접속한 사용자인지 확인하는 기능
	*/
	public void keepLogin(String id, String sessionId, Date next)throws Exception;
	  
	public BoardVO checkLoginBefore(String value);  
	//665 end
	
}
