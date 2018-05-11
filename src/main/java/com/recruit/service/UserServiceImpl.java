package com.recruit.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.UserVO;
import com.recruit.domain.MessageVO;
import com.recruit.dto.LoginDTO;
import com.recruit.persistence.UserDAO;
import com.recruit.util.MailHandler;
import com.recruit.util.TempKey;

@EnableAsync
@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO dao;

	@Inject
	private JavaMailSender mailSender;
	
    @Inject
    private PasswordEncoder passwordEncoder;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		String pw = ""; //디비값
		String rawPw = "";  //입력받은 값
		if(dao.getId(dto) != null){
			pw = dao.getPw(dto).getPw();
			rawPw = dto.getPw();			
		}
		if(passwordEncoder.matches(rawPw, pw)){
			dto.setPw(pw);
		}else{
		}
		return dao.login(dto);
	}

	@Override
	public UserVO idoverlap(String id) throws Exception {
		return dao.idoverlap(id);
	}

	@Async
	@Transactional
	@Override
	public void pregist(UserVO board) throws Exception {
		String encPassword = passwordEncoder.encode(board.getPw());
		board.setPw(encPassword);
		
		dao.create(board);

		String key = new TempKey().getKey(50, false); // 인증키 생성

		dao.createAuthKey(board.getEmail(), key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[RecruIT 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1><br><br>")
				.append("<span>하단의 링크를 클릭하여 가입을 완료하여 주세요.</span><br><br>")
				.append("<a href='http://recru-it.xyz/user/emailConfirm?email=").append(board.getEmail())
				.append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>")
				.append("<br><br><span>RecruIT에 가입하신것을 환영합니다.</span><br><br>")
				.toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "RecruIT 관리자");
		sendMail.setTo(board.getEmail());
		sendMail.send();
	}

	@Async
	@Transactional
	@Override
	public void cregist(UserVO board) throws Exception {
		String encPassword = passwordEncoder.encode(board.getPw());
		board.setPw(encPassword);
		
		dao.create(board);
		dao.Ccreate(board);

		String key = new TempKey().getKey(50, false); // 인증키 생성

		dao.createAuthKey(board.getEmail(), key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[RecruIT 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1><br><br>")
				.append("<span>하단의 링크를 클릭하여 가입을 완료하여 주세요.</span><br><br>")
				.append("<a href='http://recru-it.xyz/user/emailConfirm?email=").append(board.getEmail())
				.append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>")
				.append("<br><br><span>RecruIT에 가입하신것을 환영합니다.</span><br><br>")
				.toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "RecruIT 관리자");
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
	public UserVO checkLoginBefore(String value) {

		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public void userAuth(String email) throws Exception {
		dao.userAuth(email);
	}

	@Override
	public UserVO pread(LoginDTO dto) throws Exception {
		return dao.pread(dto);
	}

	@Override
	public UserVO cread(LoginDTO dto) throws Exception {
		return dao.cread(dto);
	}
	
	@Override
	public UserVO emailoverlap(String email) throws Exception {
		return dao.emailoverlap(email);
	}
	
	@Async
	@Transactional
	@Override
	public void ppwchk(LoginDTO dto) throws Exception{
		
		String key = new TempKey().getPw(10, false); // 인증키 생성

		String encPassword = passwordEncoder.encode(key);
		
		dao.ppwchk(dto, encPassword); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[RecruIT 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>임시비밀번호 발급 입니다.</h1>")
				.append("당신의 임시 비밀번호는 <br><br><h3>").append(key)
				.append("</h3><br><br><span>입니다.</span><br><br><span>로그인 하여 비밀번호를 바꿔주세요.</span><br><br>")
				.append("<a href='http://recru-it.xyz/'>RecruIT 홈페이지</a>").toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "RecruIT 관리자");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
	}
	
	@Async
	@Transactional
	@Override
	public void cpwchk(LoginDTO dto) throws Exception{
		
		String key = new TempKey().getKey(10, false); // 인증키 생성
		
		String encPassword = passwordEncoder.encode(key);

		dao.cpwchk(dto, encPassword); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[RecruIT 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>임시비밀번호 발급 입니다.</h1>")
				.append("당신의 임시 비밀번호는 <br><br><h3>").append(key)
				.append("</h3><br><br><span>입니다.</span><br><br><span>로그인 하여 비밀번호를 바꿔주세요.</span><br><br>")
				.append("<a href='http://recru-it.xyz/'>RecruIT 홈페이지</a>").toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "RecruIT 관리자");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
	}
	
	@Override
	public UserVO userread(String id) throws Exception{
		return dao.userread(id);
	}
	
	@Override
	public UserVO getppw(LoginDTO dto) throws Exception{
		return dao.getppw(dto);
	}
	
	@Override
	public UserVO getcpw(LoginDTO dto) throws Exception{
		return dao.getcpw(dto);
	}
	
	@Async
	@Transactional
	@Override
	public void pRead(LoginDTO dto) throws Exception{
		String id = ""; 
		id = dao.pread(dto).getId();
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[RecruIT 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>아이디 찾기 입니다.</h1>")
				.append("당신의 아이디는 <br><br><h3>").append(id)
				.append("</h3><br><br><span>입니다.</span><br><br><span>아래의 링크를 이용하여 홈페이지에 접속해주세요.</span><br><br>")
				.append("<a href='http://recru-it.xyz/'>RecruIT 홈페이지</a>").toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "RecruIT 관리자");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
	}
	
	@Async
	@Transactional
	@Override
	public void cRead(LoginDTO dto) throws Exception{
		String id = ""; 
		id = dao.cread(dto).getId();
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[RecruIT 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>아이디 찾기 입니다.</h1>")
				.append("당신의 아이디는 <br><br><h3>").append(id)
				.append("</h3><br><br><span>입니다.</span><br><br><span>아래의 링크를 이용하여 홈페이지에 접속해주세요.</span><br><br>")
				.append("<a href='http://recru-it.xyz/'>RecruIT 홈페이지</a>").toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "RecruIT 관리자");
		sendMail.setTo(dto.getEmail());
		sendMail.send();
	}
	
	@Override//소연
	public int countURmessage(String id)throws Exception{
		return dao.countURmessage(id);
	}

	@Override
	public List<MessageVO> readFivemessage(String id) throws Exception{
		return dao.readFivemessage(id);
	}
	
	@Override
	public List<MessageVO> readAllmessage(String id) throws Exception{
		return dao.readAllmessage(id);
	}
	
	@Override
	public List<MessageVO> Readmessage_paging(MessageVO msvo)throws Exception{
		return dao.Readmessage_paging(msvo);
	}//페이징처리
	
	@Override
	public String Minmessagebno(MessageVO msvo)throws Exception{
		return dao.Minmessagebno(msvo);
	}
	
	@Override
	public void CreadAPRmessage(MessageVO msvo)throws Exception{//소연 이력서 열람했다는 알림
		dao.CreadAPRmessage(msvo);
	}
	
	@Override
	public void PAppliedmessage(MessageVO msvo)throws Exception{//소연 이력서 지원했다는 알림
		dao.PAppliedmessage(msvo);
	}
	
	@Override
	public void Readedmessage(MessageVO msvo)throws Exception{//메시지 읽었다 확인 버튼
		dao.Readedmessage(msvo);
	}

	@Override
	public void AreadQNAmessage(MessageVO msvo)throws Exception{//지훈 Q&A 등록했다는 알림
		dao.AreadQNAmessage(msvo);
	}
	
	@Override
	public void readQNAReplymessage(MessageVO msvo)throws Exception{ //지훈 Q&A 댓글 등록했다는 알림
		dao.readQNAReplymessage(msvo);
	}

	@Override
	public void modifyAdminMessage(MessageVO msvo) throws Exception{ //지훈  admin에서 개인정보 수정알림
		dao.modifyAdminMessage(msvo);
	}
	
	@Override
	public void modifyResumeAdminMessage(MessageVO msvo) throws Exception{ //지훈  admin에서 이력서 수정
		dao.modifyResumeAdminMessage(msvo);
	}
	
	@Override
	public void modifyRecruitAdminMessage(MessageVO msvo) throws Exception{ //지훈  admin에서 채용공고 수정
		dao.modifyRecruitAdminMessage(msvo);
	}
}
