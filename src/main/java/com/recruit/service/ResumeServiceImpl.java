package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.AdminResumeVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.PUserVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
import com.recruit.persistence.ResumeDAO;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Inject
	private ResumeDAO dao;

	@Transactional
	@Override
	public Integer createROne(ResumeVO resume, PUserVO puser) throws Exception {
		// 안소연
		System.out.println("ResumeServiceImpl + createROne Transactional 실행");

		System.out.println("dao.createROne(resume) 실행 전");
		dao.createROne(resume);
		System.out.println("dao.createROne(resume) 실행");

		String img = resume.getImg();
		System.out.println("resume.getImg()" + img);

		if (img == null) {
			System.out.println("fullName==null");
		}

		System.out.println("resume" + resume);
		dao.addRimgAttach(resume); // insert말고 update로 함

		System.out.println("puser.getId()" + puser.getId());
		System.out.println("resume.getBno()" + dao.readRLastCreatedOne(puser.getId()));

		return dao.readRLastCreatedOne(puser.getId());
	}

	@Override
	public void updateROne(ResumeVO resume) throws Exception {
		// 안소연
		System.out.println("라 ResumeServiceImpl dao updateROne");
		dao.updateROne(resume);
	}
	@Override
	public AdminResumeVO read(String id) throws Exception {
		return dao.read(id);
	}

	@Override
	public void modify(AdminResumeVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(String id) throws Exception {
		dao.delete(id);
	}

	@Override
	public List<AdminResumeVO> listAll(String id) throws Exception {
		return dao.listAll(id);
	}

	@Override
	public ResumeVO readROne(Integer bno) throws Exception {
		return dao.readROne(bno);
	}

	@Override
	public void deleteROne(Integer bno) throws Exception {
		System.out.println("service" + bno);
		dao.deleteROne(bno);
	}

	@Override
	public List<ResumeVO> selectRList(String id) throws Exception {

		System.out.println("ResumeServiceImpl" + id);
		return dao.selectRList(id);
	}

	public List<CodeVO> selectRCodeList() throws Exception {
		return dao.selectRCodeList();
	}

	@Override
	public List<JobGroupVO> selectRGPList() throws Exception {
		return dao.selectRGPList();
	}

	@Override
	public List<RegionVO> selectRegionList() throws Exception {
		return dao.selectRegionList();
	}
	
	@Override
	public ResumeVO resumeRead(Integer bno) throws Exception {
		return dao.resumeRead(bno);
	}//민경
	
}