package com.recruit.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recruit.domain.PUserVO;
import com.recruit.domain.SrchVO;
import com.recruit.service.SearchService;

@Controller
@RequestMapping("/srch/*")
public class SearchController {

	@Inject
	private SearchService searchService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	// public String main1GET(@ModelAttribute("type") int type, Model model)
	public String mainGET(HttpServletRequest request, SrchVO srch, Model model) throws Exception {
		String stype = request.getParameter("stype");
		System.out.println("1: " + stype);
		// if ("1".equals(stype)) {
		// srch.setStype("기업찾기");
		// } else {
		// srch.setStype("인재찾기");
		// }

		String skeyword = request.getParameter("skeyword");
		System.out.println("2: " + skeyword);
		System.out.println("3: " + (null == skeyword));
		if ((null == skeyword) || ("".equals(skeyword))) {
			srch.setSdesc("키워드가 입력되지 않았습니다.");
		} else {
			srch.setSdesc("찾으시는 키워드는 " + skeyword + "입니다.");

			// Query 1
			PUserVO puserVO = searchService.selectPUser(skeyword);
			if (puserVO instanceof PUserVO) {
				srch.setSdesc("찾으시는 사용자는 " + puserVO.getPname() + "(" + puserVO.getBirth() + ")" + "입니다.");
			}

			// Query 2
			// List<PUserVO> userVOList = searchService.selectPUserAll();
			// model.addAttribute("list", userVOList);
			// Iterator itr = userVOList.iterator();
			// while (itr.hasNext()) {
			// System.out.println(((PUserVO) itr.next()).getPname());
			// }
		}
		model.addAttribute(srch);
		model.addAttribute("sdesc", "키워드를 입력후 돋보기 아이콘을 누르세요.");
		model.addAttribute("stype_", stype);

		return "search/S_main";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexGET() throws Exception {
		return "search/S_index";
	}
}
