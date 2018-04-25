package com.recruit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.BoardVO;
import com.recruit.domain.CPersonInfoVO;
import com.recruit.domain.CompanyCriteria;
import com.recruit.domain.CompanyPageMaker;
import com.recruit.domain.CompanySearchCriteria;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.PApplyVO;
import com.recruit.domain.PInterestJobVO;
import com.recruit.domain.RecruitQnAVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
import com.recruit.dto.LoginDTO;
import com.recruit.service.CompanyAjaxService;
import com.recruit.service.CompanyService;

import com.recruit.service.PApplyService;
import com.recruit.service.PInterestJobService;

@RestController
@RequestMapping("/companyAjax")
public class CompanyAjax {

	@Inject
	private CompanyAjaxService service;
	@Inject
	private CompanyService jobService;
	@Inject
	private PApplyService papService;
	@Inject
	private PInterestJobService PIJService;
	// 문> 밑에 changePassword쪽에서 쓰려고 passwordEncoder주입해줬음
	@Inject
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/jobGroup", method = RequestMethod.GET)
	  public ResponseEntity<List<JobGroupVO>> list() {

	    ResponseEntity<List<JobGroupVO>> entity = null;
	    try {
	    	
	      entity = new ResponseEntity<>(service.jobgroupList(), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }

	@RequestMapping(value = "/jobGroup/{id2}", method = RequestMethod.GET)
	  public ResponseEntity<List<JobGroupVO>> list(@PathVariable("id2") int id2) {

	    ResponseEntity<List<JobGroupVO>> entity = null;
	    try {
	    	
	      entity = new ResponseEntity<>(service.SubJobGroup(id2), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }
	
	@RequestMapping(value = "/region/{id2}", method = RequestMethod.GET)
	  public ResponseEntity<List<RegionVO>> region(@PathVariable("id2") String id2) {

	    ResponseEntity<List<RegionVO>> entity = null;
	    try {
	    	
	      entity = new ResponseEntity<>(service.SubRegion(id2), HttpStatus.OK);

	    } catch (Exception e) {
	      e.printStackTrace();
	      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }

	    return entity;
	  }
	@RequestMapping(value = "/personList/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<CPersonInfoVO>> personList(@PathVariable("bno") int bno, Model model){
	
		ResponseEntity<List<CPersonInfoVO>> entity = null;
		
		
		try {
			entity = new ResponseEntity<>(service.PersonRecomList(bno), HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/favorList/", method = RequestMethod.GET)
	public Object favList(HttpSession session, CompanySearchCriteria cri, Model model){
		
		
		ResponseEntity<List<Object>> entity = null;
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		
		String id = login.getId();
		try {
			
	
		List<CPersonInfoVO> a = jobService.FavorList(id);
		
		List<Object> b = new ArrayList<Object>();	
		
		CompanyPageMaker pageMaker = new CompanyPageMaker();
			
		for(int i =0; i<a.size(); i++){
			b.add((Object)(a.get(i)));
			
		}
		
		pageMaker.setCri(cri);
			
		pageMaker.setTotalCount(service.FavorListCount(id));	
		
		
		b.add(pageMaker);
		
		
			
			entity = new ResponseEntity<>(b, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;	
	}
	

	@RequestMapping(value = "/favorAdd/{bno}/{id}",method = RequestMethod.GET)
	public void faverAdd(@PathVariable("bno") int bno, @PathVariable("id") String id, RedirectAttributes rttr) throws Exception{
		service.FavorPersonAdd(bno, id);
	}
	
	@RequestMapping(value ="favorDelete/{bno}/{id}",method = RequestMethod.GET)
	public void favorDelete(@PathVariable("bno") int bno, @PathVariable("id") String id, RedirectAttributes rttr)throws Exception{
		service.FavorPersonDelete(bno, id);
	}
	
	@RequestMapping(value = "/favorDeleteRestart/{bno}",method = RequestMethod.GET)
	public String faverDeleteRestart(HttpSession session, @PathVariable("bno") int bno,  RedirectAttributes rttr) throws Exception{
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		
		if (login != null) {
			
			String id = login.getId();
			System.out.println(id+""+bno);
			service.FavorPersonDelete(bno, id);
			
			rttr.addFlashAttribute("msg", "DELESUCCESS");
			
			return "/company/C_favor";

		} 
			else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/cs/S_faq";
		}
		
	
}
	
	@RequestMapping(value ="endRecruit/{bno}",method = RequestMethod.POST)
	public void endRecruit(@PathVariable("bno") int bno, HttpSession session, RedirectAttributes rttr)throws Exception{
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		
		String id = login.getId();
		
		service.endRecruit(bno, id);
	}
	
	@RequestMapping(value = "reRegister/{bno}/{day}", method = RequestMethod.POST)
	public void reRegister(@PathVariable("bno") int bno, @PathVariable("day") int day, HttpSession session,
			RedirectAttributes rttr) throws Exception {

		BoardVO login = (BoardVO) session.getAttribute("login");

		if (login != null) {
			String id = login.getId();
			service.RecruitReRegister(id, bno, day);
			rttr.addFlashAttribute("msg", "DELESUCCESS");
		}
	}
	
	@RequestMapping(value="/changeState/{bno}/{state}", method = RequestMethod.GET)
	public void changeState(@PathVariable("bno") int bno,@PathVariable("state") int state)throws Exception{
		
		System.out.println(bno);
		System.out.println(state);
		
		service.ChangeState(bno,state);
		
		
	}
	
	
	
	@RequestMapping(value = "/recruitQuestion/",method = RequestMethod.POST)
	public void RecruitQuestion(@RequestBody RecruitQnAVO QnA)throws Exception{
		
		System.out.println(QnA);
		service.QnaQuestion(QnA);
		
	}
	
	
	@RequestMapping(value= "/recruitAnswer",method = RequestMethod.POST)
	public void RecruitAnswer(@RequestBody RecruitQnAVO QnA)throws Exception{
		
		service.QnaAnswer(QnA);
		
	}

	@RequestMapping(value= "/qnaList/",method = RequestMethod.POST)
	public ResponseEntity<List<RecruitQnAVO>> QnAList(@RequestBody int recruitNum)throws Exception{

		ResponseEntity<List<RecruitQnAVO>> entity = null;
		System.out.println("넘어옴"+recruitNum);
	
			 try{
			    	
			    entity = new ResponseEntity<>( service.QnAList(recruitNum), HttpStatus.OK);
			    System.out.println("질문 entity는"+ entity);
			 }catch (Exception e) {
				 
				 e.printStackTrace();
			     entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			     
			 }
			 
			 return entity;
			 
	}

	@RequestMapping(value = "/recruitList/",method = RequestMethod.POST)
	public Object RecruitList(@RequestBody List<String> array,CompanySearchCriteria cri, HttpSession session, Model model , RedirectAttributes rttr){
		
		System.out.println(array);
		System.out.println(array.size());
		
		
		String page = "";
		String state = "";
		String  searchType = "";
		String keyword = "";
		String perPageNum = "";
		String orderType = "";
		
		if(array.size() >= 5){
		page = array.get(0);	
		state = array.get(1);
		perPageNum = array.get(2);
		searchType = array.get(3);
		keyword = array.get(4);
		if(array.size() > 5){
		orderType = array.get(5); 
		cri.setOrderType(orderType);
		}
		
		
		if(page!=null){
			
			int pa = Integer.parseInt(page);
			cri.setPage(pa);
			
		}
		cri.setState(state);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		cri.setPerPageNum(Integer.parseInt(perPageNum));			
	
		}else if(array.size() < 5){
			page = array.get(0);
			state = array.get(1);
			perPageNum = array.get(2);
			cri.setState(state);
			cri.setPage(Integer.parseInt(page));
			cri.setPerPageNum(Integer.parseInt(perPageNum));
		}
		
		System.out.println("page는"+page);
		System.out.println("state는"+state);
		System.out.println("searchType는"+searchType);
		System.out.println("keyword는"+keyword);
			
		BoardVO login = (BoardVO) session.getAttribute("login");
		ResponseEntity<List<Object>> entity = null;
		Map<String, Object> result = new HashMap<String,Object>();
		if (login != null) {
			
			String id = login.getId();
			
			try {
				System.out.println("cri는 = "+cri);
				System.out.println("cri.toString은 = "+cri.toString());
//				List<RecruitVO> a = service.RecruitCriteria(cri);
				List<RecruitVO> a = service.RecruitCriteria(cri,id);
				List<Object> b = new ArrayList<Object>();
				
				for(int i =0; i<a.size(); i++){
					b.add((Object)(a.get(i)));
					
				}
				
				CompanyPageMaker pageMaker = new CompanyPageMaker();
				pageMaker.setCri(cri);
				
			
			
				if(cri.getState().equals("전체")){
					System.out.println("전체들어옴");
					pageMaker.setTotalCount(service.recruitCriteriaCount(cri, id));	
				}else if(cri.getState().equals("진행중")){
					pageMaker.setTotalCount(service.ajaxIngRecruitListCount(cri, id));
				}else{
					pageMaker.setTotalCount(service.ajaxEndRecruitListCount(cri, id));
				}
				System.out.println(pageMaker);
				b.add(pageMaker);
				
				
				entity = new ResponseEntity<>(b, HttpStatus.OK);

		
//				model.addAttribute("pageMaker",pageMaker);
//				
				System.out.println("출력됨 : "+entity.toString());
				
				
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				System.out.println("출력안됨 : "+entity.toString());
			}
			
		}
		
		
		return entity;
		
	}
	
	/*문> 매개변수에 @RequestBody LoginDTO dto를 써줬다.
	보내는 곳에 다음과 같이 써있다.
	data : JSON.stringify({
		pw : inputPw,
		pw2 : inputPw2
		
	}),
	dto의 pw에 inputPw값을 넣겠다는 얘기
	dto의 pw2에 inputPw2값을 넣겠다는 얘기임
	*/
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public ResponseEntity<String> pwPost(@RequestBody LoginDTO dto, HttpSession session, Model model,
			HttpServletRequest request, RedirectAttributes rttr) {

		/* 문> ResponseEntity<String>을 왜 쓰는지는 정확히 모른다.
		다만 추측해보면 ajax로 요청이 왔고 리턴을 보낼 때 저 타입으로 보내야 ajax쪽에서 알아 듣는 거 같다.*/
		ResponseEntity<String> entity = null;

		// 문> login에 있는 pw값을 데리고 오기 위함. 거기에 있는 pw값과 사용자에게 확인 차 입력받은 비번을 비교하려고.
		BoardVO login = (BoardVO) session.getAttribute("login");

		System.out.println("★ login에는 어떤 정보가 들어있냐? " + login);

		System.out.println("★ login의 pw는 무슨 값이냐? " + login.getPw());

		System.out.println("★ dto에는 어떤 정보가 들어있냐? " + dto);
		
		System.out.println("★ dto의 pw는 무슨 값이냐? " + dto.getPw());
		
		System.out.println("★ 현재 entity는 무슨 값이냐? " + entity);
		
		/* 문> login.getPw()는 시큐리티가 적용된 기존 비밀번호이다.
		dto.getPw()는 시큐리티가 적용 안 된 사용자에게 확인 차 입력받은 기존 비밀번호이다.
		아래와 passwordEncoder를 쓰면 비교가 되나보다.
		*/		
		if (passwordEncoder.matches(dto.getPw(), login.getPw())) {
			System.out.println("★ 비밀번호 일치");
			System.out.println("★if안 entity: " + entity);
			try {
				// 문> 비밀번호가 일치할 때 아래와 같이 entity에 값을 넣어준다.
				entity = new ResponseEntity<>("success", HttpStatus.OK);
				System.out.println("★if속 try의 entity값은? " + entity);
				// 문> entity를 가지고 C_pass.jsp의 ajax부분으로 간다.
				return entity;
			
			// 문> 아래 catch문은 왜 있는건지 모르겠음. 거기로 들어가는 상황이 없는데.. 비번 틀리면 else로 간다.	
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				System.out.println("★ 비밀번호 불일치");
				return entity;
			}
			
		// 문> 비밀번호 불일치시 else로 빠짐	
		} else {
			System.out.println("★★ 비밀번호 불일치");
			// 문> entity를 가지고 C_pass.jsp의 ajax부분으로 간다.
			return entity;
		}
	}
	
	@RequestMapping(value = "/applycheck", method = RequestMethod.POST)//소연
	public ResponseEntity<String> applycheckPOST(@RequestBody PApplyVO pavo){
		System.out.println("아 applycheck POST CONTROLLER");
		ResponseEntity<String> entity = null;
		try{
			//실행하고 싶은 서비스 실행
			System.out.println(pavo.getPid() + "가 지원한 " + pavo.getRsno() + "번째 이력서" + pavo.getRcno() + "번 채용공고");
			System.out.println("아아"+papService.selectAPOne(pavo));
			
			if(true){//마감 날짜 지났는지 안지났는지 확인하는 과정
				//select 해서 null이면 true
				if(papService.selectAPOne(pavo)==null){//지원한 적 없을 때
					System.out.println("true if문으로 들어옴");
					entity = new ResponseEntity<String>("TRUE", HttpStatus.OK);
				}else{//지원한 적 있을 때
					System.out.println("false if문으로 들어옴");
					entity = new ResponseEntity<String>("FALSE", HttpStatus.OK);
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		System.out.println("return entity : " + entity);
		return entity;
	}
	
	@RequestMapping(value = "/clipping", method = RequestMethod.POST)// 소연
	public ResponseEntity<String> clippingPOST(@RequestBody PInterestJobVO pijvo) throws Exception {
		System.out.println("clipping POST CONTROLLER");
		
		ResponseEntity<String> entity = null;
		Integer rcbno = pijvo.getRcbno();
		String userid = pijvo.getUserid();
	
		System.out.println("rcbno : " + rcbno + "userid : " + userid);
		System.out.println("pijvo값 뭐냐"+pijvo.toString());
		System.out.println(PIJService.selectPIJOne(pijvo));
		try{
			if(PIJService.selectPIJOne(pijvo)==null){//스크랩한 적 없을 때
				System.out.println("true if문으로 들어옴");
				PIJService.insertPIJOne(pijvo);
				//insert 시키는거
				entity = new ResponseEntity<String>("TRUE", HttpStatus.OK);
			}else{//스크랩한 적 있을 때
				System.out.println("false if문으로 들어옴");
				entity = new ResponseEntity<String>("FALSE", HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		System.out.println("return entity : " + entity);
		return entity;
	}
	
	@RequestMapping(value = "/clippingcancel", method = RequestMethod.POST)// 소연
	public ResponseEntity<String> clippingcancelPOST(@RequestBody PInterestJobVO pijvo) throws Exception {
		System.out.println("clippingcancel POST CONTROLLER");
		
		ResponseEntity<String> entity = null;
		Integer rcbno = pijvo.getRcbno();
		String userid = pijvo.getUserid();
	
		System.out.println("rcbno : " + rcbno + "userid : " + userid);
		System.out.println("pijvo값 뭐냐"+pijvo.toString());
		System.out.println(PIJService.selectPIJOne(pijvo));
		try{
			if(PIJService.selectPIJOne(pijvo)==null){//스크랩한 내역이 없을 때
				System.out.println("true if문으로 들어옴");
				entity = new ResponseEntity<String>("TRUE", HttpStatus.OK);
			}else{//스크랩한 내역이 있을 때
				System.out.println("false if문으로 들어옴");
				PIJService.deletePIJOne(pijvo);
				//delete 시키는 ajax
				entity = new ResponseEntity<String>("FALSE", HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		System.out.println("return entity : " + entity);
		return entity;
	}
	
	@RequestMapping(value = "/applyList/{pArray}", method = RequestMethod.GET)
	public Object appList(@PathVariable("pArray") List<String> pArray, CompanySearchCriteria cri){
	
		ResponseEntity<List<Object>> entity = null;
	
		
		System.out.println(pArray);
		
		
		
		
		if(pArray.size()==2){
			 cri.setBno(Integer.parseInt(pArray.get(0)));
			 cri.setPage(Integer.parseInt(pArray.get(1)));
			}else{
				
				 cri.setBno(Integer.parseInt(pArray.get(0)));
				 cri.setPage(Integer.parseInt(pArray.get(1)));
				 cri.setpKeyword(pArray.get(2));
				 cri.setpSearchType(pArray.get(3));
				 
			}
			
		System.out.println(cri);
		
		try {
			
			
			
			CompanyPageMaker pageMaker = new CompanyPageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.appListCount(cri.getBno()));
			
			List<CPersonInfoVO> a = jobService.ApplyList(cri);
			List<Object> b = new ArrayList<Object>();
			
			
			
			
			for(int i =0; i<a.size(); i++){
				b.add((Object)(a.get(i)));	
			}
			
			b.add(pageMaker);
			
			entity = new ResponseEntity<>(b, HttpStatus.OK);
			
			System.out.println("entity"+entity);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;	
	}
	
	
}