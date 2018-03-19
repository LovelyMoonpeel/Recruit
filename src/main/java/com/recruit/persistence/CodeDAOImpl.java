package com.recruit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CodeVO;

@Repository
public class CodeDAOImpl implements CodeDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.CodeMapper";

	@Override
	public List<CodeVO> CodeList(int tid) throws Exception {
		
		return session.selectList(namespace + ".CodeList", tid);
	}
}
