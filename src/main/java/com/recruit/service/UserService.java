package com.recruit.service;

import java.util.Date;

import com.recruit.domain.BoardVO;
import com.recruit.dto.LoginDTO;

public interface UserService {

	//
	public BoardVO login(LoginDTO dto) throws Exception;

	public BoardVO idoverlap(String id) throws Exception;
	
	public void pregist(BoardVO board) throws Exception;

	public void cregist(BoardVO board) throws Exception;
	
	//로그인 정보를 유지
	public void keepLogin(String id, String sessionId, Date next)throws Exception;
	  
	//과거에 접속한 사용자인지 확인
	public BoardVO checkLoginBefore(String value);
	
	public void userAuth(String email) throws Exception;
	
	public BoardVO pread(LoginDTO dto) throws Exception;
	
	public BoardVO cread(LoginDTO dto) throws Exception;
	
	public BoardVO emailoverlap(String email) throws Exception;
	
	public void ppwchk(LoginDTO dto) throws Exception;
	
	public void cpwchk(LoginDTO dto) throws Exception;
	
	public BoardVO userread(String id) throws Exception;
	
	public BoardVO getppw(LoginDTO dto) throws Exception;
	
	public BoardVO getcpw(LoginDTO dto) throws Exception;
}
