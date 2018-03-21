package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.AdminResumeVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;

@Repository
public class ResumeDAOImpl implements ResumeDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.ResumeMapper";

	@Override
	public AdminResumeVO read(String id) throws Exception {
		return session.selectOne(namespace + ".read", id);
	}

	@Override
	public void update(AdminResumeVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(String id) throws Exception {
		session.delete(namespace + ".delete", id);
	}

	@Override
	public List<AdminResumeVO> listAll(String id) throws Exception {
		return session.selectList(namespace + ".listAll", id);
	}

	@Override
	public void createROne(ResumeVO resume) throws Exception {
		System.out.println("Service createROne");
		session.insert(namespace + ".createROne", resume);
	}
	
	@Override
	public int readRLastCreatedOne(String id) throws Exception {
		System.out.println("ResumeDAOImpl readLRLastCreatedOne(String id)");
		return session.selectOne(namespace + ".readRLastCreatedOne", id);
	}

	@Override
	public ResumeVO readROne(Integer bno) throws Exception {
		System.out.println("Service readROne");
		return session.selectOne(namespace + ".readROne", bno);
	}

	
	
	
	@Override
	public void updateROne(ResumeVO vo) throws Exception {
		//안소연
		System.out.println("라 ResumeDAOImpl updateROne");
		session.update(namespace + ".updateROne", vo);
	}
	
	@Override
	public void deleteROne(Integer bno) throws Exception {
		System.out.println("dao" + bno);
		System.out.println("Service deleteROne");
		session.delete(namespace + ".deleteROne", bno);
	}

	@Override
	public List<ResumeVO> selectRList(String id) throws Exception {
		System.out.println("ResumeDAOImpl selectRList" + id);
		return session.selectList(namespace + ".selectRList", id);
	}
	
	@Override//민경
	public ResumeVO resumeRead(Integer bno) throws Exception {
		System.out.println("ResumeDAOImpl selectRList" + bno);
		return session.selectOne(namespace+".resumeRead", bno);
	}
	
	@Override
	public List<CodeVO> selectRCodeList() throws Exception {
		return session.selectList(namespace + ".selectRCodeList");
	}
	
	@Override
	public List<JobGroupVO> selectRGPList() throws Exception {
		return session.selectList(namespace + ".selectRGPList");
	}
	
	@Override
	public List<RegionVO> selectRegionList() throws Exception {
		return session.selectList(namespace + ".selectRegionList");
	}

	@Override
	public void addRimgAttach(ResumeVO resume)throws Exception{
		System.out.println("addRimgAttach ResumeDAOImpl 실행");
		session.update(namespace+".addRimgAttach", resume);
	};
}