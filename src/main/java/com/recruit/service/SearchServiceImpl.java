package com.recruit.service;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.recruit.domain.Bnoble;
import com.recruit.domain.CUserVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.PUserVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
import com.recruit.domain.SpanelVO;
import com.recruit.persistence.CUserDAO;
import com.recruit.persistence.CodeDAO;
import com.recruit.persistence.PUserDAO;
import com.recruit.persistence.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {

	int[] empArr = { 20, 26 }; // emp 20~26
	int[] expArr = { 1, 8 }; // exp 1~8
	int[] eduArr = { 9, 14 }; // edu 9~14

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

	// 이력서
	@Override
	public List<SpanelVO> getkeyResumes(String skey, int pageSize, int pageNum) throws Exception {
		if ("all".equals(skey)) {
			List<ResumeVO> list_tmp = searchDAO.selectResumesAll();
			if (pageSize != 0 && list_tmp.size() > pageSize) {
				List<ResumeVO> list_tmp1 = new ArrayList<ResumeVO>();
				for (int i = 0; i < pageSize; i++) {
					list_tmp1.add(list_tmp.get(i));
				}
				list_tmp = list_tmp1;
			}
			return convertToResumePanel(list_tmp);
		} else {
			return convertToResumePanel(searchDAO.selectResumes(skey));
		}
	}

	@Override
	public List<SpanelVO> getselResumes(List<String> sel_skeys, int pageSize, int pageNum) throws Exception {

		List<ResumeVO> list_tmp = searchDAO.selectResumes_selJob(sel_skeys);
		list_tmp = intersection(list_tmp, searchDAO.selectResumes_selRgn(sel_skeys));
		list_tmp = intersection(list_tmp, searchDAO.selectResumes_selCod(sel_skeys, empArr));
		list_tmp = intersection(list_tmp, searchDAO.selectResumes_selCod(sel_skeys, expArr));
		list_tmp = intersection(list_tmp, searchDAO.selectResumes_selCod(sel_skeys, eduArr));

		List<SpanelVO> listSp_tmp;
		if (list_tmp.size() == 0 || list_tmp.get(0).getBno() == -1)
			listSp_tmp = new ArrayList<SpanelVO>();
		else {
			listSp_tmp = convertToResumePanel(list_tmp);
		}
		return listSp_tmp;
	}

	// 코드테이블 맵
	Map<String, String> jobGroupMap = null;
	Map<String, String> region1Map = null;
	Map<String, String> region2Map = null;
	Map<String, String> codeMap = null;

	public void makeCodeMap() throws Exception {
		if (jobGroupMap == null) {
			List<JobGroupVO> jobGroupVOList = codedao.getTbljobgroup();
			jobGroupMap = new HashMap<String, String>();
			int jobGroupVOListLen = jobGroupVOList.size();
			for (int i = 0; i < jobGroupVOListLen; i++)
				jobGroupMap.put(jobGroupVOList.get(i).getId() + "", jobGroupVOList.get(i).getJobgroup());
		}

		if (region1Map == null || region2Map == null) {
			List<RegionVO> regionVO1List = codedao.getTblregion1();
			region1Map = new HashMap<String, String>();
			int regionVO1ListLen = regionVO1List.size();
			for (int i = 0; i < regionVO1ListLen; i++)
				region1Map.put(regionVO1List.get(i).getRgbid(), regionVO1List.get(i).getRgbname());

			List<RegionVO> regionVO2List = codedao.getTblregion2();
			region2Map = new HashMap<String, String>();
			int regionVO2ListLen = regionVO2List.size();
			for (int i = 0; i < regionVO2ListLen; i++) {
				region2Map.put(regionVO2List.get(i).getRgbid() + regionVO2List.get(i).getRgsid(),
						regionVO2List.get(i).getRgsname());
			}
		}

		if (codeMap == null) {
			List<CodeVO> codeVOList = codedao.getTblcode();
			codeMap = new HashMap<String, String>();
			int codeVOListLen = codeVOList.size();
			for (int i = 0; i < codeVOListLen; i++)
				codeMap.put(codeVOList.get(i).getId() + "", codeVOList.get(i).getCareer());
		}
	}

	// recruit to panel
	public List<SpanelVO> convertToRecruitPanel(List<RecruitVO> listRecruit) throws Exception {
		int num = listRecruit.size();
		makeCodeMap();

		List<SpanelVO> listPanel = new ArrayList<SpanelVO>();

		for (int i = 0; i < num; i++) {
			SpanelVO spanelVO = new SpanelVO();
			spanelVO.setBno(listRecruit.get(i).getBno());
			spanelVO.setUserid(listRecruit.get(i).getCid());
			spanelVO.setTitle(listRecruit.get(i).getTitle());

			spanelVO.setJobgroupid(jobGroupMap.get(listRecruit.get(i).getJobgroupid()));
			if (listRecruit.get(i).getJobgroupid2() != null)
				spanelVO.setJobgroupid2(jobGroupMap.get(listRecruit.get(i).getJobgroupid2()));

			spanelVO.setRgbid(region1Map.get(listRecruit.get(i).getRgbid()));
			spanelVO.setRgsid(region2Map.get(listRecruit.get(i).getRgbid() + listRecruit.get(i).getRgsid()));
			spanelVO.setEmploystatusid(codeMap.get(listRecruit.get(i).getEmploystatusid()));
			spanelVO.setEdu(codeMap.get(listRecruit.get(i).getEdu()));
			spanelVO.setExp(codeMap.get(listRecruit.get(i).getExp()));

			// recruit
			if (listRecruit.get(i).getCid() != null)
				spanelVO.setCname(cuserdao.selectCUser(listRecruit.get(i).getCid()).getCname());
			spanelVO.setImg(cImgMap.get(spanelVO.getUserid()));

			String period = listRecruit.get(i).getPeriod();
			spanelVO.setPeriod(period);

			try {
				if (LocalDate.now().isAfter(LocalDate.parse(period)))
					spanelVO.setJobstateid("[채용마감]");
			} catch (DateTimeParseException e) {
			}

			listPanel.add(spanelVO);
		}
		return listPanel;
	}

	// resume to panel
	public List<SpanelVO> convertToResumePanel(List<ResumeVO> listResume) throws Exception {
		int num = listResume.size();
		makeCodeMap();

		List<SpanelVO> listPanel = new ArrayList<SpanelVO>();
		for (int i = 0; i < num; i++) {
			SpanelVO spanelVO = new SpanelVO();
			spanelVO.setBno(listResume.get(i).getBno());
			spanelVO.setUserid(listResume.get(i).getUserid());

			// resume title
			String title = listResume.get(i).getTitle();
			if (title != null && title.length() > 30)
				title = title.substring(0, 30) + "...";
			spanelVO.setTitle(title);

			if (listResume.get(i).getJobstateid() != null)
				spanelVO.setJobgroupid(jobGroupMap.get(listResume.get(i).getJobgroupid()));

			if (listResume.get(i).getJobgroupid2() != null)
				spanelVO.setJobgroupid2(jobGroupMap.get(listResume.get(i).getJobgroupid2()));

			spanelVO.setRgbid(region1Map.get(listResume.get(i).getRgbid()));
			spanelVO.setRgsid(region2Map.get(listResume.get(i).getRgbid() + listResume.get(i).getRgsid()));
			spanelVO.setEmploystatusid(codeMap.get(listResume.get(i).getEmploystatusid()));
			spanelVO.setEdu(codeMap.get(listResume.get(i).getLevelofeducation()));
			spanelVO.setExp(codeMap.get(listResume.get(i).getLastcareer()));

			// image push
			String imageName = listResume.get(i).getImg();
			if (imageName == null || "".equals(imageName)) {
				spanelVO.setImg("/NoImage.png");
			} else {
				spanelVO.setImg(imageName);
				// spanelVO.setImg("/DogImage.png");
			}

			// resume
			spanelVO.setPname(puserdao.selectPUser(listResume.get(i).getUserid()).getPname());
			spanelVO.setJobstateid(codeMap.get(listResume.get(i).getJobstateid()));

			listPanel.add(spanelVO);
		}
		return listPanel;
	}

	public <T extends Bnoble> List<T> intersection(List<T> list1, List<T> list2) {

		// list have no element.
		if (list1.size() == 0 || list2.size() == 0)
			return new ArrayList<T>();

		// criteria isn't selected.
		if (list1.get(0).getBno() == -1)
			return list2;
		else if (list2.get(0).getBno() == -1)
			return list1;

		List<T> list = new ArrayList<T>();
		for (T t : list1) {
			if (list2.contains(t))
				list.add(t);
		}
		return list;
	}

	Map<String, String> cImgMap = null;

	public List<RecruitVO> getRecruitPage(List<RecruitVO> recruitVOList, int pageSize, int pageNum) {
		List<RecruitVO> recruitVOList1 = new ArrayList<RecruitVO>();
		// last page?
		if (recruitVOList.size() > pageSize * (pageNum + 1)) {
			for (int i = 0; i < pageSize; i++) {
				recruitVOList1.add(recruitVOList.get(pageSize * pageNum + i));
			}
		} else { // last page
			int i = 0;
			RecruitVO lastRecruit = new RecruitVO();
			lastRecruit.setPeriod("lastRecruit");
			recruitVOList1.add(lastRecruit);
			while (recruitVOList.size() > pageSize * pageNum + i) {
				System.out.println("::" + recruitVOList.size() + "::" + (pageSize * pageNum + i));
				recruitVOList1.add(recruitVOList.get(pageSize * pageNum + i++));
			}
		}
		recruitVOList = recruitVOList1;
		return recruitVOList;
	}

	// 채용공고
	@Override
	public List<SpanelVO> getkeyRecruits(String skey, int pageSize, int pageNum) throws Exception {
		List<RecruitVO> recruitVOList = null;
		if ("all".equals(skey))
			recruitVOList = searchDAO.selectRecruitsAll();
		else
			recruitVOList = searchDAO.selectRecruits(skey);
		List<SpanelVO> cpanelVOList = getCInforList(recruitVOList);
		// if (pageSize != 0 && pageNum >= 0 && recruitVOList.size() > pageSize)
		if (pageSize != 0 && pageNum >= 0) {
			recruitVOList = getRecruitPage(recruitVOList, pageSize, pageNum);
		}
		List<SpanelVO> spanelVOList = convertToRecruitPanel(recruitVOList);
		if (pageNum == 0) {
			spanelVOList.addAll(cpanelVOList);
		}
		return spanelVOList;
	}

	@Override
	public List<SpanelVO> getselRecruits(List<String> sel_skeys, int pageSize, int pageNum) throws Exception {

		List<RecruitVO> recruitVOList = searchDAO.selectRecruits_selJob(sel_skeys);
		recruitVOList = intersection(recruitVOList, searchDAO.selectRecruits_selRgn(sel_skeys));
		recruitVOList = intersection(recruitVOList, searchDAO.selectRecruits_selCod(sel_skeys, empArr));
		recruitVOList = intersection(recruitVOList, searchDAO.selectRecruits_selCod(sel_skeys, expArr));
		recruitVOList = intersection(recruitVOList, searchDAO.selectRecruits_selCod(sel_skeys, eduArr));

		List<SpanelVO> spanelVOList;
		if (recruitVOList.size() == 0 || recruitVOList.get(0).getBno() == -1) {
			recruitVOList = getRecruitPage(new ArrayList<RecruitVO>(), pageSize, pageNum);
			spanelVOList = convertToRecruitPanel(recruitVOList);
		} else {
			List<SpanelVO> cpanelVOList = getCInforList(recruitVOList);
			if (pageSize != 0 && pageNum >= 0) {
				recruitVOList = getRecruitPage(recruitVOList, pageSize, pageNum);
			}
			spanelVOList = convertToRecruitPanel(recruitVOList);
			if (pageNum == 0)
				spanelVOList.addAll(cpanelVOList);
		}
		return spanelVOList;
	}

	@Override
	public String codeToName(String scode) throws Exception {
		String code1 = scode.substring(0, 1);
		if ("J".equals(code1)) { // Job
			scode = codedao.codeToJobName(scode.substring(1));
		} else if ("R".equals(code1)) { // Region
			scode = codedao.codeToRegName(scode.substring(1));
		} else {
			scode = codedao.codeToCodName(scode);
		}
		return scode;
	}

	@Override
	public List<Integer> selectJobCode() throws Exception {
		return searchDAO.selectJobCode();
	}

	@Override
	public List<SpanelVO> getCInforList(List<RecruitVO> recruitVOList) throws Exception {

		Set<String> cSet = new HashSet<String>();
		cImgMap = new HashMap<String, String>();

		int recruitVONum = recruitVOList.size();
		for (int i = 0; i < recruitVONum; i++)
			cSet.add(recruitVOList.get(i).getCid());

		List<String> cList = new ArrayList<String>(cSet);
		List<SpanelVO> cpanelVOList = searchDAO.selectCInfo(cList);
		int cpanelVONum = cpanelVOList.size();

		for (int i = 0; i < cpanelVONum; i++) {
			String title = cpanelVOList.get(i).getTitle();
			String imageName = cpanelVOList.get(i).getImg();

			// company intro article
			if (title != null && title.length() > 70)
				cpanelVOList.get(i).setTitle(title.substring(0, 70) + "...");

			// image push
			if (imageName == null || "".equals(imageName))
				cpanelVOList.get(i).setImg("/NoImage.png");

			cImgMap.put(cpanelVOList.get(i).getUserid(), cpanelVOList.get(i).getImg());
		}

		// for (int i = 0; i < recruitVONum; i++)
		// spanelVOList.get(i).setImg(cImgMap.get(spanelVOList.get(i).getUserid()));
		// spanelVOList.addAll(cpanelVOList);

		return cpanelVOList;
	}
}