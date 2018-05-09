package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.UserVO;
import com.recruit.domain.StatisticVO;

public interface AdminDAO {

	public UserVO read(String id) throws Exception;

	public void update(UserVO vo) throws Exception;

	public void delete(String id) throws Exception;

	public List<UserVO> listAll() throws Exception;

	public List<UserVO> listPage(int page) throws Exception;

	public List<UserVO> listCriteria(AdminCriteria cri) throws Exception;

	public int countPaging(AdminCriteria cri) throws Exception;

	public List<UserVO> listSearch(AdminSearchCriteria cri) throws Exception;

	public int listSearchCount(AdminSearchCriteria cri) throws Exception;

	public UserVO aread() throws Exception;

	public void aupdate(UserVO vo) throws Exception;
	
	public String readpw(UserVO vo) throws Exception;
	
	public int pcount()throws Exception;
	
	public int ccount()throws Exception;
	
	public List<StatisticVO> count_recruit() throws Exception;
	
	public List<StatisticVO> jobgroup_recruit() throws Exception;
	
	public List<StatisticVO> rgb_recruit() throws Exception;
	
	public List<StatisticVO> weekPerson() throws Exception;
	
	public List<StatisticVO> weekCompany() throws Exception;
	
	public void emailauth(UserVO vo) throws Exception;
	
	public List<StatisticVO> weekResume() throws Exception;
	
	public List<StatisticVO> jobgroup_resume() throws Exception;
	
	public List<StatisticVO> rRgb_resume() throws Exception;
	
	public int weekPcount()throws Exception;
	
	public int weekCcount()throws Exception;
	
	public int weekResumeCount()throws Exception;
	
	public int weekRecruitCount()throws Exception;
	
}