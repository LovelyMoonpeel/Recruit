package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.ResumeEduVO;
import com.recruit.persistence.ResumeEduDAO;

@Service
public class ResumeEduServiceImpl implements ResumeEduService {

	@Inject
	private ResumeEduDAO dao;

	@Override
	public void regist(ResumeEduVO vo) throws Exception {
		dao.createResumeEdu(vo);
	}

	@Override
	public ResumeEduVO read(Integer bno) throws Exception {
		return dao.readResumeEdu(bno);
	}

	@Override
	public void modify(ResumeEduVO vo) throws Exception {
		dao.updateResumeEdu(vo);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteResumeEdu(bno);
	}

	@Override
	public void createResumeEdu(ResumeEduVO vo) throws Exception {
		dao.createResumeEdu(vo);
	}
	// r.code 03/13 추가
	@Override
	public List<ResumeEduVO> readResumeEduList(Integer bno) throws Exception {
		return dao.readResumeEduList(bno);
	}

	// r.code 03/14 추가
	@Override
	public void changeResumeEduList(Integer resumenum, List<ResumeEduVO> resumeEduVOList) throws Exception {

		dao.deleteResumeEduList(resumenum);
		if (resumeEduVOList != null) {
			int num = resumeEduVOList.size();
			for (int i = 0; i < num; i++)
				dao.createResumeEdu(resumeEduVOList.get(i));
		}
	}
	//소연
	@Override
	public void createResumeEduList(Integer resumenum, List<ResumeEduVO> resumeEduVOList) throws Exception {
		if (resumeEduVOList != null) {
			for (int i = 0; i < resumeEduVOList.size(); i++){
				System.out.println("그래서 되냐"+resumeEduVOList.get(i));
				System.out.println("그래서 되냐2"+resumenum);
				ResumeEduVO revl = resumeEduVOList.get(i);
				revl.setResumenum(resumenum);
				System.out.println("라라라라라"+revl.toString());
				dao.createResumeEdu(revl);
			}
		}
	}
}
