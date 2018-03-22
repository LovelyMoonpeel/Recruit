package com.recruit.persistence;

import java.util.Date;

import com.recruit.domain.BoardVO;
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
}
