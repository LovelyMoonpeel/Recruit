package com.recruit.persistence;

import java.util.Date;
import java.util.List;

import com.recruit.domain.BoardVO;
import com.recruit.domain.MessageVO;
import com.recruit.dto.LoginDTO;

public interface UserDAO {

	public BoardVO login(LoginDTO dto) throws Exception;

	public BoardVO idoverlap(String id) throws Exception;
	
	public void create(BoardVO vo)throws Exception;

	public void Ccreate(BoardVO vo) throws Exception;
	
	public void keepLogin(String id, String sessionId, Date next);

	public BoardVO checkUserWithSessionKey(String value);
	
	public void insertUser(BoardVO vo) throws Exception;
	
	public void createAuthKey(String email, String authCode) throws Exception;
	
	public void userAuth(String email) throws Exception;
	
	public BoardVO pread(LoginDTO dto) throws Exception;
	
	public BoardVO cread(LoginDTO dto) throws Exception;
	
	public BoardVO emailoverlap(String email) throws Exception;
	
	public void ppwchk(LoginDTO dto, String pw) throws Exception;
	
	public void cpwchk(LoginDTO dto, String pw) throws Exception;
	
	public BoardVO getPw(LoginDTO dto) throws Exception;
	
	public String getId(LoginDTO dto) throws Exception;
	
	public BoardVO userread(String id) throws Exception;
	
	public BoardVO getppw(LoginDTO dto) throws Exception;
	
	public BoardVO getcpw(LoginDTO dto) throws Exception;
	
	public int countURmessage(String id)throws Exception;//소연
	
	public List<MessageVO> readFivemessage(String id) throws Exception;//소연
	
	public List<MessageVO> readAllmessage(String id) throws Exception;//소연
	
	public List<MessageVO> Readmessage_paging(MessageVO msvo)throws Exception;//페이징
	
	public String Maxmassagebno(MessageVO msvo)throws Exception;
	
	public void CreadAPRmessage(MessageVO msvo)throws Exception;//소연 이력서 열람했다는 알림
	
	public void PAppliedmessage(MessageVO msvo)throws Exception;//소연 이력서 지원했다는 알림
	
	public void Readedmessage(MessageVO msvo)throws Exception;//메시지 확인 알림
	
	public void AreadQNAmessage(MessageVO msvo)throws Exception;//지훈 Q&A 등록했다는 알림
	
}
