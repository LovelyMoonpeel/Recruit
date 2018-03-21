package com.recruit.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.BoardVO;
import com.recruit.dto.LoginDTO;
import com.recruit.persistence.UserDAO;
import com.recruit.util.MailHandler;
import com.recruit.util.TempKey;


@Service
public class UserServiceImpl implements UserService {

	 
	  @Inject
	  private UserDAO dao;

	  @Inject
	  private JavaMailSender mailSender;
	  
	  @Override
	  public BoardVO login(LoginDTO dto) throws Exception {

	    return dao.login(dto);
	  }

	  @Override
	  public BoardVO idoverlap(String id) throws Exception{
		  return dao.idoverlap(id);
	  }
	  
	  @Transactional
	  @Override
	  public void pregist(BoardVO board) throws Exception {
	    dao.create(board);
	    
	    String key = new TempKey().getKey(50, false); // 인증키 생성

	    dao.createAuthKey(board.getEmail(), key); // 인증키 DB저장

	    MailHandler sendMail = new MailHandler(mailSender);
	    sendMail.setSubject("[퍼팩트 매칭 서비스 이메일 인증]");
	    sendMail.setText(
	    		new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/user/emailConfirm?email=").append(board.getEmail()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
	    sendMail.setFrom("ProJ.B.Team@gmail.com", "퍼팩트 매칭 관리자");
	    sendMail.setTo(board.getEmail());
	    sendMail.send();
	  }
	  
	  @Transactional
	  @Override
	  public void cregist(BoardVO board) throws Exception {
	    dao.create(board);
	    dao.Ccreate(board);
	    
	    String key = new TempKey().getKey(50, false); // 인증키 생성

	    dao.createAuthKey(board.getEmail(), key); // 인증키 DB저장

	    MailHandler sendMail = new MailHandler(mailSender);
	    sendMail.setSubject("[퍼팩트 매칭 서비스 이메일 인증]");
	    sendMail.setText(
	    		new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/user/emailConfirm?email=").append(board.getEmail()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
	    sendMail.setFrom("ProJ.B.Team@gmail.com", "퍼팩트 매칭 관리자");
	    sendMail.setTo(board.getEmail());
	    sendMail.send();
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
	  
	  @Override
		public void userAuth(String email) throws Exception {
			dao.userAuth(email);
	  }
}
