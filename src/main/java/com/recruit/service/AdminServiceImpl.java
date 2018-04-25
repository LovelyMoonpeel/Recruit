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
import com.recruit.domain.StatisticVO;
import com.recruit.persistence.AdminDAO;
import com.recruit.util.MailHandler;
import com.recruit.util.TempKey;

@EnableAsync
@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	
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
	public void remove(String id) throws Exception {
		dao.delete(id);
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
	public BoardVO aread() throws Exception {
		return dao.aread();
	}

	@Override
	public void amodify(BoardVO vo) throws Exception {
		dao.aupdate(vo);
	}
	
	@Override
	public String readpw(BoardVO vo) throws Exception{
		return dao.readpw(vo);
	}
	
	@Override
	public int pcount()throws Exception{
		return dao.pcount();
	}
	
	@Override
	public int ccount()throws Exception{
		return dao.ccount();
	}

	@Override
	public List<StatisticVO> count_recruit() throws Exception{
		return dao.count_recruit();
	}
	
	@Override
	public List<StatisticVO> jobgroup_recruit() throws Exception{
		return dao.jobgroup_recruit();
	}
	
	@Override
	public List<StatisticVO> rgb_recruit() throws Exception{
		return dao.rgb_recruit();
	}
	
	@Override
	public List<StatisticVO> weekPerson() throws Exception{
		return dao.weekPerson();
	}
	
	@Override
	public List<StatisticVO> weekCompany() throws Exception{
		return dao.weekCompany();
	}
	
	@Override
	public void emailauth(BoardVO vo) throws Exception{
		dao.emailauth(vo);
	}
	
	@Override
	public List<StatisticVO> weekResume() throws Exception{
		return dao.weekResume();
	}
	
	@Override
	public List<StatisticVO> jobgroup_resume() throws Exception{
		return dao.jobgroup_resume();
	}
	
	@Override
	public List<StatisticVO> rRgb_resume() throws Exception{
		return dao.rRgb_resume();
	}
	
	@Override
	public int weekPcount()throws Exception{
		return dao.weekPcount();
	}
	
	@Override
	public int weekCcount()throws Exception{
		return dao.weekCcount();
	}
	
	@Override
	public int weekResumeCount()throws Exception{
		return dao.weekResumeCount();
	}
	
	@Override
	public int weekRecruitCount()throws Exception{
		return dao.weekRecruitCount();
	}
	
}