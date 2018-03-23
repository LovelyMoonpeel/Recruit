package com.recruit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.CodeVO;
import com.recruit.domain.JobGroupVO;
import com.recruit.domain.RegionVO;

@Repository
public class CodeDAOImpl implements CodeDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.recruit.mapper.CodeMapper";

	@Override
	public List<CodeVO> CodeList(int tid) throws Exception {

		return session.selectList(namespace + ".CodeList", tid);
	}

	@Override
	public CodeVO readCode(String id) throws Exception {
		return session.selectOne(namespace + ".readCode", id);
	}

	@Override
	public JobGroupVO selectJobGroup(String id) throws Exception {
		return session.selectOne(namespace + ".selectJobGroup", id);
	}

	@Override
	public RegionVO selectRegion(String rgbid, String rgsid) throws Exception {

		Map map = new HashMap();
		map.put("rgbid", rgbid);
		map.put("rgsid", rgsid);

		return session.selectOne(namespace + ".selectRegion", map);
	}

	@Override
	public String codeToJobName(String code) throws Exception {
		return session.selectOne(namespace + ".codeToJobName", code);
	}

	@Override
	public String codeToRegName(String code) throws Exception {

		Map map = new HashMap();
		map.put("rgbid", code.substring(0, 1));
		map.put("rgsid", code.substring(1));

		return session.selectOne(namespace + ".codeToRegName", map);
	}

	@Override
	public String codeToCodName(String code) throws Exception {
		return session.selectOne(namespace + ".codeToCodName", code);
	}
}
