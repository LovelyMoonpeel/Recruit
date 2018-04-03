package com.recruit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recruit.domain.BoardVO;
import com.recruit.domain.SrchVO;

@Controller
@RequestMapping("/srch/*")
public class SearchController {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	// public String main1GET(@ModelAttribute("type") int type, Model model)
	public String mainGET(HttpSession session, HttpServletRequest request, SrchVO srchVO, Model model)
			throws Exception {
		String stype = request.getParameter("stype");
		String skeyword = request.getParameter("skeyword");
		String sfilter = request.getParameter("sfilter");

		// 로그인 상태확인
		BoardVO login = (BoardVO) session.getAttribute("login");
		String cname = null;
		if (login != null)
			cname = login.getCname();

		if (login == null || cname == null)
			System.out.println(stype == "1"); // stype = "1";

		System.out.println("stype: " + stype);
		System.out.println("skeyword: " + skeyword);
		System.out.println("sfilter: " + sfilter);

		srchVO.setStype(stype);
		srchVO.setSkeyword(skeyword);
		srchVO.setSfilter(sfilter);

		if ((null == skeyword) || ("".equals(skeyword))) {
			srchVO.setSdesc("키워드가 입력되지 않았습니다.");
		} else {
			srchVO.setSdesc("찾으시는 키워드는 " + skeyword + "입니다.");
		}
		model.addAttribute(srchVO);
		model.addAttribute("sdesc", "키워드를 입력후 돋보기 아이콘을 누르세요.");
		// model.addAttribute("stypeModel", stype);
		return "search/S_main";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexGET() throws Exception {
		return "search/S_index";
	}
}
