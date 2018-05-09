package com.recruit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recruit.domain.UserVO;
import com.recruit.domain.SrchVO;
//장우님꺼
@Controller
@RequestMapping("/srch/*")
public class SearchController {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainGET(HttpSession session, HttpServletRequest request, SrchVO srchVO, Model model)
			throws Exception {

		// 로그인 상태확인
		UserVO login = (UserVO) session.getAttribute("login");
		String cname = null;
		String id = null;
		String stype = request.getParameter("stype");

		if (login != null) {
			cname = login.getCname();
			id = login.getId();
		}

		if (login == null || (!("admin".equals(id)) && cname == null))
			stype = "1";

		srchVO.setStype(stype);
		srchVO.setSkeyword(request.getParameter("skeyword"));
		srchVO.setSfilter(request.getParameter("sfilter"));
		model.addAttribute(srchVO);
		return "search/S_main";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexGET() throws Exception {
		return "search/S_index";
	}
}
