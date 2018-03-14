package com.recruit.persistence;

import java.util.Date;
import java.util.List;

import com.recruit.domain.BoardVO;
import com.recruit.domain.UserVO;
import com.recruit.dto.LoginDTO;

public interface UserDAO {

	public BoardVO read(String id) throws Exception;
	public List<BoardVO> listAll() throws Exception;
	
	//3.14 문필꺼 확인
	public BoardVO login(LoginDTO dto)throws Exception;
	
	//3.14 문필꺼 확인
	public void keepLogin(String id, String sessionId, Date next);
	
	//3.14 문필꺼 확인
	public BoardVO checkUserWithSessionKey(String value);	

}
