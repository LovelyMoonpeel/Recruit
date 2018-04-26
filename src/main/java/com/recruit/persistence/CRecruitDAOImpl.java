package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CRecruitVO;
import com.recruit.domain.PersonalCriteriaVO;

@Repository
public class CRecruitDAOImpl implements CRecruitDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.CRecruitMapper";
	
	public int countPaging(PersonalCriteriaVO cri)throws Exception{
		return session.selectOne(namespace+".countPaging", cri);
	}
	
	public int countPaging_ongoing(PersonalCriteriaVO cri)throws Exception{
		return session.selectOne(namespace+".countPaging_ongoing", cri);
	}
	
	public int countPaging_closed(PersonalCriteriaVO cri)throws Exception{
		System.out.println(cri);
		return session.selectOne(namespace+".countPaging_closed", cri);
	}
	
	public int countPaging_AP(PersonalCriteriaVO cri)throws Exception{
		return session.selectOne(namespace+".countPaging_AP", cri);
	}
	
	public int countPaging_AP_ongoing(PersonalCriteriaVO cri)throws Exception{
		return session.selectOne(namespace+".countPaging_AP_ongoing", cri);
	}
	
	public int countPaging_AP_closed(PersonalCriteriaVO cri)throws Exception{
		return session.selectOne(namespace+".countPaging_AP_closed", cri);
	}

	// 스크랩한 채용공고 목록 
	@Override
	public List<CRecruitVO> selectCRList(PersonalCriteriaVO cri, String order_value)throws Exception{
		
		if(order_value!=null&&order_value.equals("viewcnt_order")){
			
			return session.selectList(namespace + ".selectCRList_veiwcnt_order", cri);
			
		}else if(order_value!=null&&order_value.equals("applicant_order")){
			
			return session.selectList(namespace + ".selectCRList_applicant_order", cri);
			
		}else if(order_value!=null&&order_value.equals("closingdate_order")){
			
			return session.selectList(namespace + ".selectCRList_closingdate_order", cri);
			
		}else{
			
			System.out.println("CRecruitDAOImpl selectCRList order_value값 없을 때");
			return session.selectList(namespace + ".selectCRList_closingdate_order", cri);
		}
	};

	// 스크랩한 채용공고 목록 
	@Override
	public List<CRecruitVO> selectCRList_ongoing(PersonalCriteriaVO cri, String order_value)throws Exception{
		
		if(order_value!=null&&order_value.equals("viewcnt_order")){
			
			return session.selectList(namespace + ".selectCRList_ongoing_veiwcnt_order", cri);
			
		}else if(order_value!=null&&order_value.equals("applicant_order")){
			
			return session.selectList(namespace + ".selectCRList_ongoing_applicant_order", cri);
			
		}else if(order_value!=null&&order_value.equals("closingdate_order")){
			
			return session.selectList(namespace + ".selectCRList_ongoing_closingdate_order", cri);
			
		}else{
			
			System.out.println("CRecruitDAOImpl selectCRList_ongoing 뭔가 이상함");
			return session.selectList(namespace + ".selectCRList_ongoing_closingdate_order", cri);
		}
	};

	// 스크랩한 채용공고 목록 
	@Override
	public List<CRecruitVO> selectCRList_closed(PersonalCriteriaVO cri, String order_value)throws Exception{
		
		if(order_value!=null&&order_value.equals("viewcnt_order")){
			
			return session.selectList(namespace + ".selectCRList_closed_veiwcnt_order", cri);
			
		}else if(order_value!=null&&order_value.equals("applicant_order")){
			
			return session.selectList(namespace + ".selectCRList_closed_applicant_order", cri);
			
		}else if(order_value!=null&&order_value.equals("closingdate_order")){
			
			return session.selectList(namespace + ".selectCRList_closed_closingdate_order", cri);
			
		}else{
			System.out.println("CRecruitDAOImpl selectAPList_closed 뭔가 이상함");
			return session.selectList(namespace + ".selectCRList_closed_closingdate_order", cri);
		}
	};

	//지원한 채용공고 목록
	@Override
	public List<CRecruitVO> selectAPList(PersonalCriteriaVO cri, String order_value)throws Exception{
		
		if(order_value!=null&&order_value.equals("applicant_order")){
			
			 return session.selectList(namespace + ".selectAPList_applicant_order", cri);
			 
		}else if(order_value!=null&&order_value.equals("closingdate_order")){
			
			 return session.selectList(namespace + ".selectAPList_closingdate_order", cri);
			 
		}else{
			
			System.out.println("CRecruitDAOImpl selectAPList 뭔가 이상함");
			return session.selectList(namespace + ".selectAPList_closingdate_order", cri);
		}
	};

	//지원한 채용공고 목록
	@Override
	public List<CRecruitVO> selectAPList_ongoing(PersonalCriteriaVO cri, String order_value)throws Exception{
		
		if(order_value!=null&&order_value.equals("applicant_order")){
			
			 return session.selectList(namespace + ".selectAPList_ongoing_applicant_order", cri);
			 
		}else if(order_value!=null&&order_value.equals("closingdate_order")){
			
			 return session.selectList(namespace + ".selectAPList_ongoing_closingdate_order", cri);
			 
		}else{
			System.out.println("CRecruitDAOImpl selectAPList_ongoing 뭔가 이상함");
			return session.selectList(namespace + ".selectAPList_ongoing_closingdate_order", cri);
		}
	};
	
	//지원한 채용공고 목록
	@Override
	public List<CRecruitVO> selectAPList_closed(PersonalCriteriaVO cri, String order_value)throws Exception{
		
		if(order_value!=null&&order_value.equals("applicant_order")){
			
			 return session.selectList(namespace + ".selectAPList_closed_applicant_order", cri);
			 
		}else if(order_value!=null&&order_value.equals("closingdate_order")){
			
			 return session.selectList(namespace + ".selectAPList_closed_closingdate_order", cri);
			 
		}else{
			
			System.out.println("CRecruitDAOImpl selectAPList_closed 뭔가 이상함");
			return session.selectList(namespace + ".selectAPList_closed_closingdate_order", cri);
		}
	};
	
	//스크랩한 채용공고 목록에서 선택한 채용공고 하나 확인
	@Override
	public CRecruitVO selectCROne(int bno)throws Exception{
		return session.selectOne(namespace + ".selectCROne", bno);
		//session 은 mybatis //selectOne은 DAO
	};
}
