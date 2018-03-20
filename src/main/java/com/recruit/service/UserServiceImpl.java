package com.recruit.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.BoardVO;
import com.recruit.dto.LoginDTO;
import com.recruit.persistence.UserDAO;


@Service
public class UserServiceImpl implements UserService {

	 
	  @Inject
	  private UserDAO dao;

	  
	  @Override
	  public BoardVO login(LoginDTO dto) throws Exception {

	    return dao.login(dto);
	  }

	  //문> 로그인 정보를 유지
	  @Override
	  public void keepLogin(String id, String sessionId, Date next)
	      throws Exception {
	    
	    dao.keepLogin(id, sessionId, next);
	    
	  }

	  //문> 과거에 접속한 사용자인지 확인
	  @Override
	  public BoardVO checkLoginBefore(String value) {
	    
	    return dao.checkUserWithSessionKey(value);
	  }

}
