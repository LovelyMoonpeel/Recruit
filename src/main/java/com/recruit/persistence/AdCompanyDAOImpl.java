package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.AdminCriteria;
import com.recruit.domain.AdminSearchCriteria;
import com.recruit.domain.BoardVO;
import com.recruit.domain.RecruitVO;

@Repository
public class AdCompanyDAOImpl implements AdCompanyDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.adcompanyMapper";

	@Override
	public BoardVO read(String id) throws Exception {
		return session.selectOne(namespace + ".read", id);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
//		System.out.println("dao test");
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(String id) throws Exception {
		session.delete(namespace + ".delete", id);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<BoardVO> listCriteria(AdminCriteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}

		page = (page - 1) * 10;
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public int countPaging(AdminCriteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<BoardVO> listSearch(AdminSearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(AdminSearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void update(RecruitVO vo) throws Exception {
		session.update(namespace + ".rupdate", vo);
	}
	
	@Override
	public void delete(int bno) throws Exception {
		session.delete(namespace + ".rdelete", bno);
	}
}