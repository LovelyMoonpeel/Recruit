package com.recruit.persistence;

import java.util.ArrayList;
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
	public List<RecruitVO> selectRecruits_selJob(List<String> sel_skeys) throws Exception {

		List<String> list = new ArrayList();

		// System.out.println("Search DAO1: " + sel_skeys);
		int num = sel_skeys.size();
		for (int i = 0; i < num; i++) {
			if (sel_skeys.get(i).substring(0, 1).equals("J")) {
				list.add(sel_skeys.get(i).substring(1));
			}
		}
		// System.out.println("Search DAO2: " + sel_skeys);
		// System.out.println("list.size(): " + list.size());
		// System.out.println("list: " + list);
		if (list.size() == 0)
			return noCriteria();
		return session.selectList(namespace + ".selectRecruits_selJob", list);
	}

	@Override
	public List<RecruitVO> selectRecruits_selRgn(List<String> sel_skeys) throws Exception {

		// Map<String, String> map = new HashMap();
		List<RecruitVO> list = new ArrayList();

		// System.out.println("Search DAO1: " + sel_skeys);
		int num = sel_skeys.size();
		for (int i = 0; i < num; i++) {
			if (sel_skeys.get(i).substring(0, 1).equals("R")) {

				RecruitVO rtmp = new RecruitVO();
				rtmp.setRgbid(sel_skeys.get(i).substring(1, 2));
				rtmp.setRgsid(sel_skeys.get(i).substring(2));
				list.add(rtmp);

				// map.put(sel_skeys.get(i).substring(1, 2),
				// sel_skeys.get(i).substring(2));
			}
		}
		// System.out.println("Search DAO2: " + sel_skeys);
		// System.out.println("Search DAO2: " + list);
		if (list.size() == 0)
			return noCriteria();
		return session.selectList(namespace + ".selectRecruits_selRgn", list);
	}

	@Override
	public List<RecruitVO> selectRecruits_selEmp(List<String> sel_skeys) throws Exception {

		List<Integer> list = new ArrayList();

		System.out.println("Search DAO1: " + sel_skeys);
		int num = sel_skeys.size();
		for (int i = 0; i < num; i++) {
			try {
				int code = Integer.parseInt(sel_skeys.get(i));
				if (code > 19 && code < 27) // Emp 20~26
					list.add(code);
			} catch (NumberFormatException e) {
			}
		}
		if (list.size() == 0)
			return noCriteria();
		return session.selectList(namespace + ".selectRecruits_selEmp", list);
	}

	@Override
	public List<RecruitVO> selectRecruits_selExp(List<String> sel_skeys) throws Exception {

		List<Integer> list = new ArrayList();

		System.out.println("Search DAO1: " + sel_skeys);
		int num = sel_skeys.size();
		for (int i = 0; i < num; i++) {
			try {
				int code = Integer.parseInt(sel_skeys.get(i));
				if (code > 0 && code < 9) // exp 1~8
					list.add(code);
			} catch (NumberFormatException e) {
			}
		}
		if (list.size() == 0)
			return noCriteria();
		return session.selectList(namespace + ".selectRecruits_selExp", list);
	}

	@Override
	public List<RecruitVO> selectRecruits_selEdu(List<String> sel_skeys) throws Exception {

		List<Integer> list = new ArrayList();

		System.out.println("Search DAO1: " + sel_skeys);
		int num = sel_skeys.size();
		for (int i = 0; i < num; i++) {
			try {
				int code = Integer.parseInt(sel_skeys.get(i));
				if (code > 8 && code < 15) // edu 9~14
					list.add(code);
			} catch (NumberFormatException e) {
			}
		}
		if (list.size() == 0)
			return noCriteria();
		return session.selectList(namespace + ".selectRecruits_selEdu", list);
	}

	@Override
	public List<ResumeVO> selectResumes_sel(List<String> sel_skeys) throws Exception {
		return session.selectList(namespace + ".selectResumes_sel", sel_skeys);
	}

	public List<RecruitVO> noCriteria() {
		List<RecruitVO> tmplist = new ArrayList<RecruitVO>();
		RecruitVO tmp = new RecruitVO();
		tmp.setBno(-1);
		tmplist.add(tmp);
		return tmplist;
	}
}
