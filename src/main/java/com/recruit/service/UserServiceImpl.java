package com.recruit.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.BoardVO;
import com.recruit.dto.LoginDTO;
import com.recruit.persistence.UserDAO;


@Service
public class UserServiceImpl implements UserService {

	 //633 start
	 @Inject
	  private UserDAO dao;

	  @Override
	  public BoardVO login(LoginDTO dto) throws Exception {

	    return dao.login(dto);
	  }
	  //633 end
	  
	  //666 start
	  @Override
	  public void keepLogin(String id, String sessionId, Date next)
	      throws Exception {
	    
	    dao.keepLogin(id, sessionId, next);
	    
	  }

	  @Override
	  public BoardVO checkLoginBefore(String value) {
	    
	    return dao.checkUserWithSessionKey(value);
	  }
	  //666 end
}
