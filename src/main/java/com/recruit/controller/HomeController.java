package com.recruit.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		// www.saramin.co.kr
		String domain = "http://www.saramin.co.kr";
		String searchword = "java";
		int page = 1;
		String url = domain + "/zf_user/search/recruit/page/" + page + "?searchword=" + searchword
				+ "&searchType=search&order=relation";
		Document doc = Jsoup.connect(url).get();
		System.out.println(domain);
		Elements recruitNum = doc.select("div.title_search_area .numcase");
		System.out.println("recruitNum: " + recruitNum.get(0).text());

		Elements recruits = doc.select("ul.company_inbox .riin");
		for (Element recruit : recruits) {
			System.out.println("cname :  " + recruit.getElementsByTag("a").get(0).attr("title"));
			System.out.println("title :  " + recruit.getElementsByTag("a").get(1).attr("title"));
			System.out.println("href  :  " + domain + recruit.getElementsByTag("a").get(0).attr("href"));
			System.out.println();
			// System.out.println("recruit0: " + recruit);
		}

		// www.incruit.com
		url = "http://search.incruit.com/list/search.asp?col=job&il=y&kw=" + searchword + "&startno=0";
		doc = Jsoup.connect(url).get();
		System.out.println();
		System.out.println(domain);
		recruitNum = doc.select(".numall");
		System.out.println("recruitNum: " + recruitNum.get(0).text());

		recruits = doc.select("ul.litype01 li");
		// System.out.println(recruits);
		for (Element recruit : recruits) {
			System.out.println("cname :  " + recruit.getElementsByTag("a").get(0).text());
			System.out.println("href  :  " + recruit.getElementsByTag("a").get(0).attr("href"));
			System.out.println("title :  " + recruit.getElementsByTag("a").get(1).text());
			System.out.println("href  :  " + recruit.getElementsByTag("a").get(1).attr("href"));
			System.out.println();
			System.out.println();
		}
		
		// www.jobkorea.co.kr
		domain = "http://www.jobkorea.co.kr";
		url = domain + "/Search/AjaxSearchList";
		doc = Jsoup.connect(url).data("stext","java","pageSize","10","page","2").post();
		System.out.println();
		System.out.println(domain);
		recruitNum = doc.select("#smGiList .devTotalCount");
		System.out.println("recruitNum: " + recruitNum.get(0).text());
		recruits = doc.select("#smGiList ul.detailList li");
		// System.out.println(recruits);
		for (Element recruit : recruits) {
			System.out.println("cname :  " + recruit.getElementsByTag("a").get(0).text());
			System.out.println("href  :  " + domain + recruit.getElementsByTag("a").get(0).attr("href"));
			System.out.println("title :  " + recruit.getElementsByTag("a").get(1).text());
			System.out.println("href  :  " + domain + recruit.getElementsByTag("a").get(1).attr("href"));
			System.out.println();
		}
		return "home";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexGET(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "search/S_index";
	}

	@RequestMapping(value = "/2", method = RequestMethod.GET)
	public String indexTest(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "home2";
	}
}
