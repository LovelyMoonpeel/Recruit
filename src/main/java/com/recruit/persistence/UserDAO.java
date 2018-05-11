package com.recruit.persistence;

import java.util.Date;
import java.util.List;

import com.recruit.domain.UserVO;
import com.recruit.domain.MessageVO;
import com.recruit.dto.LoginDTO;

public interface UserDAO {

	public UserVO login(LoginDTO dto) throws Exception;

	public UserVO idoverlap(String id) throws Exception;
	
	public void create(UserVO vo)throws Exception;

	public void Ccreate(UserVO vo) throws Exception;
	
	public void keepLogin(String id, String sessionId, Date next);

	public UserVO checkUserWithSessionKey(String value);
	
	public void insertUser(UserVO vo) throws Exception;
	
	public void createAuthKey(String email, String authCode) throws Exception;
	
	public void userAuth(String email) throws Exception;
	
	public UserVO pread(LoginDTO dto) throws Exception;
	
	public UserVO cread(LoginDTO dto) throws Exception;
	
	public UserVO emailoverlap(String email) throws Exception;
	
	public void ppwchk(LoginDTO dto, String pw) throws Exception;
	
	public void cpwchk(LoginDTO dto, String pw) throws Exception;
	
	public UserVO getPw(LoginDTO dto) throws Exception;
	
	public String getId(LoginDTO dto) throws Exception;
	
	public UserVO userread(String id) throws Exception;
	
	public UserVO getppw(LoginDTO dto) throws Exception;
	
	public UserVO getcpw(LoginDTO dto) throws Exception;
	
	public int countURmessage(String id)throws Exception;//소연
	
	public List<MessageVO> readFivemessage(String id) throws Exception;//소연
	
	public List<MessageVO> readAllmessage(String id) throws Exception;//소연
	
	public List<MessageVO> Readmessage_paging(MessageVO msvo)throws Exception;//페이징
	
	public String Minmessagebno(MessageVO msvo)throws Exception;
	
	public void CreadAPRmessage(MessageVO msvo)throws Exception;//소연 이력서 열람했다는 알림
	
	public void PAppliedmessage(MessageVO msvo)throws Exception;//소연 이력서 지원했다는 알림
	
	public void Readedmessage(MessageVO msvo)throws Exception;//메시지 확인 알림
	
	public void AreadQNAmessage(MessageVO msvo)throws Exception;//지훈 Q&A 등록했다는 알림
	
	public void readQNAReplymessage(MessageVO msvo)throws Exception;//지훈 Q&A 댓글 등록했다는 알림
	
	public void modifyAdminMessage(MessageVO msvo) throws Exception; //지훈  admin에서 개인정보 수정알림
	
	public void modifyResumeAdminMessage(MessageVO msvo) throws Exception; //지훈  admin에서 이력서 수정
	
	public void modifyRecruitAdminMessage(MessageVO msvo) throws Exception; //지훈  admin에서 채용공고 수정
}
