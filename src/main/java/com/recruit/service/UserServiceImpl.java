package com.recruit.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	
    @Inject
    private PasswordEncoder passwordEncoder;

	@Override
	public BoardVO login(LoginDTO dto) throws Exception {
		String pw = ""; //디비값
		String rawPw = "";  //입력받은 값
		if(dao.getId(dto) != null){
			pw = dao.getPw(dto).getPw();
			rawPw = dto.getPw();			
		}
		if(passwordEncoder.matches(rawPw, pw)){
			System.out.println("비밀번호 일치");
			dto.setPw(pw);
		}else{
			System.out.println("비밀번호 불일치");
		}
		return dao.login(dto);
	}

	@Override
	public BoardVO idoverlap(String id) throws Exception {
		return dao.idoverlap(id);
	}

	@Transactional
	@Override
	public void pregist(BoardVO board) throws Exception {
		String encPassword = passwordEncoder.encode(board.getPw());
		board.setPw(encPassword);
		System.out.println("비밀번호 테스트 : "+board.getPw());
		
		dao.create(board);

		String key = new TempKey().getKey(50, false); // 인증키 생성

		dao.createAuthKey(board.getEmail(), key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[퍼팩트 매칭 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1><br><br>")
				.append("<span>하단의 링크를 클릭하여 가입을 완료하여 주세요.</span><br><br>")
				.append("<a href='http://192.168.104.9:8080/user/emailConfirm?email=").append(board.getEmail())
				.append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>")
				.append("<br><br><span>퍼팩트 매칭에 가입하신것을 환영합니다.</span><br><br>")
				.toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "퍼팩트 매칭 관리자");
		sendMail.setTo(board.getEmail());
		sendMail.send();
	}

	@Transactional
	@Override
	public void cregist(BoardVO board) throws Exception {
		String encPassword = passwordEncoder.encode(board.getPw());
		board.setPw(encPassword);
		System.out.println("비밀번호 테스트 : "+board.getPw());
		
		dao.create(board);
		dao.Ccreate(board);

		String key = new TempKey().getKey(50, false); // 인증키 생성

		dao.createAuthKey(board.getEmail(), key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[퍼팩트 매칭 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1><br><br>")
				.append("<span>하단의 링크를 클릭하여 가입을 완료하여 주세요.</span><br><br>")
				.append("<a href='http://192.168.104.9:8080/user/emailConfirm?email=").append(board.getEmail())
				.append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>")
				.append("<br><br><span>퍼팩트 매칭에 가입하신것을 환영합니다.</span><br><br>")
				.toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "퍼팩트 매칭 관리자");
		sendMail.setTo(board.getEmail());
		sendMail.send();
	}

	// 문> 로그인 정보를 유지
	@Override
	public void keepLogin(String id, String sessionId, Date next) throws Exception {

		dao.keepLogin(id, sessionId, next);

	}

	// 문> 과거에 접속한 사용자인지 확인
	@Override
	public BoardVO checkLoginBefore(String value) {

		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public void userAuth(String email) throws Exception {
		dao.userAuth(email);
	}

	@Override
	public BoardVO pread(LoginDTO dto) throws Exception {
		return dao.pread(dto);
	}

	@Override
	public BoardVO cread(LoginDTO dto) throws Exception {
		return dao.cread(dto);
	}
	
	@Override
	public BoardVO emailoverlap(String email) throws Exception {
		return dao.emailoverlap(email);
	}
	
	@Transactional
	@Override
	public void ppwchk(LoginDTO dto) throws Exception{
//		dao.ppwchk(dto);
		
		String key = new TempKey().getPw(10, false); // 인증키 생성

		dao.ppwchk(dto, key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[퍼팩트 매칭 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>임시비밀번호 발급 입니다.</h1>")
				.append("당신의 임시 비밀번호는 <br><br><h3>").append(key)
				.append("</h3><br><br><span>입니다.</span><br><br><span>로그인 하여 비밀번호를 바꿔주세요.</span><br><br>")
				.append("<a href='http://192.168.104.9:8080/cs/S_faq'>퍼팩트 매칭 홈페이지</a>").toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "퍼팩트 매칭 관리자");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
	}
	
	@Transactional
	@Override
	public void cpwchk(LoginDTO dto) throws Exception{
//		dao.cpwchk(dto);
		
		String key = new TempKey().getKey(10, false); // 인증키 생성

		dao.cpwchk(dto, key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[퍼팩트 매칭 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>임시비밀번호 발급 입니다.</h1>")
				.append("당신의 임시 비밀번호는 <br><br><h3>").append(key)
				.append("</h3><br><br><span>입니다.</span><br><br><span>로그인 하여 비밀번호를 바꿔주세요.</span><br><br>")
				.append("<a href='http://192.168.104.9:8080/cs/S_faq'>퍼팩트 매칭 홈페이지</a>").toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "퍼팩트 매칭 관리자");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
	}
}
