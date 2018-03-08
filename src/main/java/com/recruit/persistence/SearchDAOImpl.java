package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.RecruitVO;
import com.recruit.domain.ResumeVO;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.SearchMapper";

	@Override
	public List<RecruitVO> selectRecruits(String skey) throws Exception {
		return session.selectList(namespace + ".selectRecruits", skey);
	}

	@Override
	public List<ResumeVO> selectResumes(String skey) throws Exception {
		return session.selectList(namespace + ".selectResumes", skey);
	}

	@Override
	public List<RecruitVO> selectRecruits_sel(List<String> sel_skeys) throws Exception {
		System.out.println("service1: " + sel_skeys);
		sel_skeys.set(0, "ㄹ");
		System.out.println("service2: " + sel_skeys);
		return session.selectList(namespace + ".selectRecruits_sel", sel_skeys);
	}

	@Override
	public List<ResumeVO> selectResumes_sel(List<String> sel_skeys) throws Exception {
		return session.selectList(namespace + ".selectResumes_sel", sel_skeys);
	}
}
