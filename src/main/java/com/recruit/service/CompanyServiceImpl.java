package com.recruit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.recruit.domain.BoardVO;
import com.recruit.domain.CInfoVO;
import com.recruit.domain.CInterestPersonVO;
import com.recruit.domain.CPersonInfoVO;
import com.recruit.domain.CodeVO;
import com.recruit.domain.CompanyCriteria;
import com.recruit.domain.CompanySearchCriteria;
import com.recruit.domain.RecruitQnAVO;
import com.recruit.domain.RecruitVO;
import com.recruit.domain.RegionVO;
import com.recruit.domain.ResumeVO;
import com.recruit.dto.LoginDTO;
import com.recruit.persistence.CompanyDAO;



@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Inject
	private CompanyDAO dao;
	
	@Inject
	private PasswordEncoder passwordEncoder;
	
	@Override
	  public CInfoVO CompanyInfoRead(String id) throws Exception {
	 
		return dao.CompanyInfoRead(id);
	  }
	
	 @Override
	  public void CompanyInfoModify(CInfoVO CInfo) throws Exception {
	    dao.CompanyInfoUpdate(CInfo);
	  }
	 @Override
	 public List<RecruitVO> RecruitList(String id) throws Exception{
			
		 return dao.RecruitList(id);
	 }
	 
	 @Override
	 public List<CodeVO> CodeList() throws Exception{
		 
		 return dao.CodeList();
	 }
	 @Override
	 public List<RegionVO> RegionList() throws Exception{
		 
		 return dao.RegionList();
	 }
	 @Override
	 public List<RecruitQnAVO> QnAList(int recruitNum) throws Exception{
		 
		 return dao.QnAList(recruitNum);
	 }
	 
	 @Override
	 public void RecruitWrite(RecruitVO recruitWrtie) throws Exception{
		 dao.RecruitWrite(recruitWrtie);
			
		 
	 }
	 @Override
	 public List<RecruitVO> RecomList(CompanyCriteria cri, String id) throws Exception{
			
		 return dao.RecomList(cri, id);
	 }
	 @Override
	 public int listSearchCount(CompanySearchCriteria cri, String id) throws Exception{
		 
		 return dao.listSearchCount(cri, id);
	 }
	 @Override
	 public String ChangeCnameToId(String cname)throws Exception{
		 
		 return dao.ChangeCnameToId(cname);
	 }
	 
	 @Transactional
	 @Override
	 public RecruitVO RecruitInfoRead(int recruitNum,BoardVO login) throws Exception{

		
		 if(login.getCname()==null){
			 dao.updateViewCnt(recruitNum);
		 return dao.RecruitInfoRead(recruitNum);
		 }else{
			
			 return dao.RecruitInfoRead(recruitNum);
		 }
		 
		
	 }
	 @Transactional
	 @Override
	 public RecruitVO RecruitInfoRead(int recruitNum) throws Exception{
		
		dao.updateViewCnt(recruitNum);
		 return dao.RecruitInfoRead(recruitNum);
		 
	 }

	 @Override
	 public RecruitVO RecruitInfoRead2(int recruitNum) throws Exception{
		 return dao.RecruitInfoRead(recruitNum);
	 }

	 @Override
	 public RecruitVO RecruitInfoRead3(int recruitNum) throws Exception{
		 return dao.RecruitInfoRead3(recruitNum);
	 } 
	 
	 @Override
	 public RecruitVO PcStateCheck(String id) throws Exception{
		 
		 return dao.PcStateCheck(id);
	 }
	 
	 @Override
	 public List<CPersonInfoVO> FavorList(String id) throws Exception{
		 
		 return dao.FavorList(id);
		 
	 }
	 @Override
	 public List<RecruitVO> cinfoRecruitList(String id) throws Exception{
		 
		 return dao.cinfoRecruitList(id);
	 }

	@Override
	public void RecruitModify(RecruitVO recruitModify) throws Exception {
		
		dao.RecruitModify(recruitModify);
	}
	@Override
	public RecruitVO RecruitModifyRead(int bno, String id)throws Exception{
		return dao.RecruitModifyRead(bno,id);
	}

	@Override
	public void RecruitRemove(int bno, String id) throws Exception {
		
		dao.RecruitRemove(bno ,id);
	}

	@Override
	public List<CPersonInfoVO> ApplyList(CompanySearchCriteria cri) throws Exception {
		
		return dao.ApplyList(cri);
	}

	 @Override
		public List<CInterestPersonVO> FavorCompareList(String id) throws Exception {
			
			return dao.FavorCompareList(id);
		}
	 
	 @Override
	 public List<CPersonInfoVO> CInfoRecruitList(String id)throws Exception{
		 
		 return dao.CInfoRecruitList(id);
	 }
	 @Override
	 public void C_RecruitExtension(String id, int bno)throws Exception{
		 
		 dao.C_RecruitExtension(id,bno);
	 }
	  
	 
	 // 문> 기업회원 비밀번호 새로 수정하기 위해서 
	 @Override
	 public void updateCpPw(LoginDTO dto) throws Exception{
		 
			// 문> pw2(새로운 비밀번호)값을 가져와서 시큐리티 값으로 바꾼다.

			String encPassword = passwordEncoder.encode(dto.getPw2());

			// 문> 시큐리티로 바꾼 비밀번호를 dto에 넣는다.
			dto.setPw(encPassword);

			// 문> 확인 차
			System.out.println("CompanyServiceImpl__dto : " + dto);

			 // 문> CompanyDAO로 출발
			 dao.updateCpPw(dto);
		 	 
	 }

}