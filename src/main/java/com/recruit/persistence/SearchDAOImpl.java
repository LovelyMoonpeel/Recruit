package com.recruit.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.Bnoble;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.ResumeVO;

@Repository
public class SearchDAOImpl implements SearchDAO {

	int[] empArr = { 20, 26 }; // emp 20~26
	int[] expArr = { 1, 8 }; // exp 1~8
	int[] eduArr = { 9, 14 }; // edu 9~14

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

	// r.code 03/14 Recruit
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
			return noCriteria(new RecruitVO());
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
			return noCriteria(new RecruitVO());
		return session.selectList(namespace + ".selectRecruits_selRgn", list);
	}

	@Override
	public List<RecruitVO> selectRecruits_selCod(List<String> sel_skeys, int[] arr) throws Exception {

		List<Integer> list = new ArrayList();

		System.out.println("Search DAO1: " + sel_skeys);
		int num = sel_skeys.size();
		for (int i = 0; i < num; i++) {
			try {
				int code = Integer.parseInt(sel_skeys.get(i));
				if (code >= arr[0] && code <= arr[1])
					list.add(code);
			} catch (NumberFormatException e) {
			}
		}
		if (list.size() == 0)
			return noCriteria(new RecruitVO());
		else if (arr[0] == empArr[0])
			return session.selectList(namespace + ".selectRecruits_selEmp", list);
		else if (arr[0] == expArr[0])
			return session.selectList(namespace + ".selectRecruits_selExp", list);
		else // edu
			return session.selectList(namespace + ".selectRecruits_selEdu", list);
	}

	// r.code 03/16 Resume
	@Override
	public List<ResumeVO> selectResumes_selJob(List<String> sel_skeys) throws Exception {
		List<String> list = new ArrayList();

		int num = sel_skeys.size();
		for (int i = 0; i < num; i++) {
			if (sel_skeys.get(i).substring(0, 1).equals("J")) {
				list.add(sel_skeys.get(i).substring(1));
			}
		}
		if (list.size() == 0)
			return noCriteria(new ResumeVO());
		return session.selectList(namespace + ".selectResumes_selJob", list);
	}

	@Override
	public List<ResumeVO> selectResumes_selRgn(List<String> sel_skeys) throws Exception {

		List<ResumeVO> list = new ArrayList();

		int num = sel_skeys.size();
		for (int i = 0; i < num; i++) {
			if (sel_skeys.get(i).substring(0, 1).equals("R")) {

				ResumeVO rtmp = new ResumeVO();
				rtmp.setRgbid(sel_skeys.get(i).substring(1, 2));
				rtmp.setRgsid(sel_skeys.get(i).substring(2));
				list.add(rtmp);
			}
		}
		if (list.size() == 0)
			return noCriteria(new ResumeVO());
		return session.selectList(namespace + ".selectResumes_selRgn", list);
	}

	@Override
	public List<ResumeVO> selectResumes_selCod(List<String> sel_skeys, int[] arr) throws Exception {

		List<Integer> list = new ArrayList();

		int num = sel_skeys.size();
		for (int i = 0; i < num; i++) {
			try {
				int code = Integer.parseInt(sel_skeys.get(i));
				if (code >= arr[0] && code <= arr[1])
					list.add(code);
			} catch (NumberFormatException e) {
			}
		}
		if (list.size() == 0)
			return noCriteria(new ResumeVO());
		else if (arr[0] == empArr[0])
			return session.selectList(namespace + ".selectResumes_selEmp", list);
		else if (arr[0] == expArr[0])
			return session.selectList(namespace + ".selectResumes_selExp", list);
		else // edu
			return session.selectList(namespace + ".selectResumes_selEdu", list);
	}

	public <T extends Bnoble> List<T> noCriteria(T tmp) {
		List<T> tmplist = new ArrayList<T>();
		tmp.setBno(-1);
		tmplist.add(tmp);
		return tmplist;
	}

	@Override
	public List<RecruitVO> selectRecruitsAll() throws Exception {
		return session.selectList(namespace + ".selectRecruitsAll");
	}

	@Override
	public List<ResumeVO> selectResumesAll() throws Exception {
		return session.selectList(namespace + ".selectResumesAll");
	}

	@Override
	public List<Integer> selectJobCode() throws Exception {
		return session.selectList(namespace + ".selectJobCode");
	}
}
