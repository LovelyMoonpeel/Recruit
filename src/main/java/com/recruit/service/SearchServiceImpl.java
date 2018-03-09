package com.recruit.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.CUserVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.PUserVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.ResumeVO;
import com.recruit.persistence.CUserDAO;
import com.recruit.persistence.CodeDAO;
import com.recruit.persistence.PUserDAO;
import com.recruit.persistence.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	private PUserDAO puserdao;

	@Inject
	private CUserDAO cuserdao;

	@Inject
	private CodeDAO codedao;

	@Inject
	private SearchDAO searchDAO;

	@Override
	public PUserVO selectPUser(String skeyword) throws Exception {
		return puserdao.selectPUser(skeyword);
	}

	@Override
	public List<PUserVO> selectPUserAll() throws Exception {
		return puserdao.selectPUserAll();
	}

	@Override
	public List<PUserVO> selectPUsers(String skey) throws Exception {
		return puserdao.selectPUsers(skey);
	}

	@Override
	public CUserVO selectCUser(String skeyword) throws Exception {
		return cuserdao.selectCUser(skeyword);
	}

	@Override
	public List<CUserVO> selectCUserAll() throws Exception {
		return cuserdao.selectCUserAll();
	}

	@Override
	public List<CUserVO> selectCUsers(String skey) throws Exception {
		return cuserdao.selectCUsers(skey);
	}

	@Override
	public List<CodeVO> CodeList(int tid) throws Exception {
		return codedao.CodeList(tid);
	}

	@Override
	public List<RecruitVO> selectRecruits(String skey) throws Exception {
		return searchDAO.selectRecruits(skey);
	}

	@Override
	public List<ResumeVO> selectResumes(String skey) throws Exception {
		return searchDAO.selectResumes(skey);
	}

	@Override
	public List<RecruitVO> selectRecruits_sel(List<String> sel_skeys) throws Exception {

		List<RecruitVO> list_tmp = searchDAO.selectRecruits_selJob(sel_skeys);
		list_tmp = intersection(list_tmp, searchDAO.selectRecruits_selRgn(sel_skeys));
		list_tmp = intersection(list_tmp, searchDAO.selectRecruits_selEmp(sel_skeys));
		list_tmp = intersection(list_tmp, searchDAO.selectRecruits_selExp(sel_skeys));
		list_tmp = intersection(list_tmp, searchDAO.selectRecruits_selEdu(sel_skeys));

		if (list_tmp.size() == 0 || list_tmp.get(0).getBno() == -1)
			list_tmp = new ArrayList<RecruitVO>();
		return list_tmp;
	}

	@Override
	public List<ResumeVO> selectResumes_sel(List<String> sel_skeys) throws Exception {
		return searchDAO.selectResumes_sel(sel_skeys);
	}

	public List<RecruitVO> intersection(List<RecruitVO> list1, List<RecruitVO> list2) {

		// list have no element.
		if (list1.size() == 0 || list2.size() == 0)
			return new ArrayList<RecruitVO>();

		// criteria isn't selected.
		if (list1.get(0).getBno() == -1)
			return list2;
		else if (list2.get(0).getBno() == -1)
			return list1;

		List<RecruitVO> list = new ArrayList<RecruitVO>();
		for (RecruitVO t : list1) {
			if (list2.contains(t))
				list.add(t);
		}
		return list;
	}
}
