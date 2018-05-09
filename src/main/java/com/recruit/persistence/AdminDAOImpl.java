package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.UserVO;
import com.recruit.domain.StatisticVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.adminMapper";

	@Override
	public UserVO read(String id) throws Exception {
		return session.selectOne(namespace + ".read", id);
	}

	@Override
	public void update(UserVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(String id) throws Exception {
		session.delete(namespace + ".delete", id);
	}

	@Override
	public List<UserVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<UserVO> listCriteria(AdminCriteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public List<UserVO> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}

		page = (page - 1) * 10;
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public int countPaging(AdminCriteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<UserVO> listSearch(AdminSearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(AdminSearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public UserVO aread() throws Exception {
		return session.selectOne(namespace + ".aread");
	}

	@Override
	public void aupdate(UserVO vo) throws Exception {
		session.update(namespace + ".aupdate", vo);
	}
	
	@Override
	public String readpw(UserVO vo) throws Exception{
		return session.selectOne(namespace + ".readpw", vo);
	}
	
	@Override
	public int pcount()throws Exception{
		return session.selectOne(namespace+".pcount");
	}
	
	@Override
	public int ccount()throws Exception{
		return session.selectOne(namespace+".ccount");
	}

	@Override
	public List<StatisticVO> count_recruit() throws Exception{
		return session.selectList(namespace+".count_recruit");
	}
	
	@Override
	public List<StatisticVO> jobgroup_recruit() throws Exception{
		return session.selectList(namespace+".jobgroup_recruit");
	}
	
	@Override
	public List<StatisticVO> rgb_recruit() throws Exception{
		return session.selectList(namespace+".rgb_recruit");
	}
	
	@Override
	public List<StatisticVO> weekPerson() throws Exception{
		return session.selectList(namespace+".weekPerson");
	}
	
	@Override
	public List<StatisticVO> weekCompany() throws Exception{
		return session.selectList(namespace+".weekCompany");
	}
	
	@Override
	public void emailauth(UserVO vo) throws Exception{
		session.update(namespace+".emailauth", vo);
	}
	
	@Override
	public List<StatisticVO> weekResume() throws Exception{
		return session.selectList(namespace+".weekResume");
	}
	
	@Override
	public List<StatisticVO> jobgroup_resume() throws Exception{
		return session.selectList(namespace+".jobgroup_resume");
	}
	
	@Override
	public List<StatisticVO> rRgb_resume() throws Exception{
		return session.selectList(namespace+".rRgb_resume");
	}
	
	@Override
	public int weekPcount()throws Exception{
		return session.selectOne(namespace+".weekPcount");
	}
	
	@Override
	public int weekCcount()throws Exception{
		return session.selectOne(namespace+".weekCcount");
	}
	
	@Override
	public int weekResumeCount()throws Exception{
		return session.selectOne(namespace+".weekResumeCount");
	}
	
	@Override
	public int weekRecruitCount()throws Exception{
		return session.selectOne(namespace+".weekRecruitCount");
	}
}