package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.StatisticVO;
import com.recruit.domain.UserVO;
import com.recruit.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	@Override
	public UserVO read(String id) throws Exception {
		return dao.read(id);
	}

	@Override
	public void modify(UserVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(String id) throws Exception {
		dao.delete(id);
	}

	@Override
	public List<UserVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<UserVO> listCriteria(AdminCriteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(AdminCriteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<UserVO> listSearchCriteria(AdminSearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(AdminSearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public UserVO aread() throws Exception {
		return dao.aread();
	}

	@Override
	public void amodify(UserVO vo) throws Exception {
		dao.aupdate(vo);
	}
	
	@Override
	public String readpw(UserVO vo) throws Exception{
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
	public void emailauth(UserVO vo) throws Exception{
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