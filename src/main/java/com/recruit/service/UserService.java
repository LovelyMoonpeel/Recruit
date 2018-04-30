package com.recruit.service;

import java.util.Date;
import java.util.List;

import com.recruit.domain.BoardVO;
import com.recruit.domain.MessageVO;
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
	
	public void pRead(LoginDTO dto) throws Exception;
	
	public void cRead(LoginDTO dto) throws Exception;
	
	public int countURmessage(String id)throws Exception;//소연
	
	public List<MessageVO> readFivemessage(String id) throws Exception;//소연
	
	public List<MessageVO> readAllmessage(String id) throws Exception;//소연

	public List<MessageVO> Readmessage_paging(MessageVO msvo)throws Exception;
	
	public void CreadAPRmessage(MessageVO msvo)throws Exception;//소연 이력서 열람했다는 알림
	
	public void PAppliedmessage(MessageVO msvo)throws Exception;//이력서 지원했다는 알림
	
	public void Readedmessage(MessageVO msvo)throws Exception;//메시지 확인 서비스
	
}
