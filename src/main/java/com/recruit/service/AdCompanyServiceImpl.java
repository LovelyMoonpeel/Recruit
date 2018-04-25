package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.BoardVO;
import com.recruit.domain.RecruitVO;
import com.recruit.persistence.AdCompanyDAO;
import com.recruit.util.MailHandler;

@EnableAsync
@Service
public class AdCompanyServiceImpl implements AdCompanyService {

	@Inject
	private AdCompanyDAO dao;
	
	@Inject
	private JavaMailSender mailSender;

	@Override
	public BoardVO read(String id) throws Exception {
		return dao.read(id);
	}

	@Async
	@Transactional
	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.update(vo);
		dao.cnameupdate(vo);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[RecruIT 정보 변경 알림]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1><br><br>")
				.append("<span>개인정보의 변경이 확인되었음을 알립니다.</span><br><br>")
				.append("<span>아래의 링크를 통해 변경된 내용을 확인해보세요.</span><br><br>")
				.append("<a href='http://192.168.0.64:8080'>RecruIT 홈페이지</a>")
				.append("<br><br><span>항상 이용해 주셔서 감사합니다.</span><br><br>")
				.toString());
		sendMail.setFrom("ProJ.B.Team@gmail.com", "RecruIT 관리자");
		sendMail.setTo(vo.getEmail());
		sendMail.send();
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(AdminCriteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(AdminCriteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(AdminSearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(AdminSearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public void modify(RecruitVO vo) throws Exception {
		System.out.println("service test");
		dao.update(vo);
	}
	
	@Override
	public void remove(int bno) throws Exception {
		dao.delete(bno);
	}
}