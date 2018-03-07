package com.recruit.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.recruit.domain.BoardVO;
import com.recruit.domain.UserVO;
import com.recruit.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "com.recruit.mapper.UserMapper";

	@Override
	public UserVO read(String uid) throws Exception {
		System.out.println("read");
		return session.selectOne(namespace + ".read", uid);
	}

	@Override
	public List<UserVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public BoardVO login(LoginDTO dto) throws Exception {

		return session.selectOne(namespace + ".login", dto);
	}
	// 632 end

	// 665 start
	@Override
	public void keepLogin(String id, String sessionId, Date next) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);

		session.update(namespace + ".keepLogin", paramMap);

	}

	@Override
	public BoardVO checkUserWithSessionKey(String value) {

		return session.selectOne(namespace + ".checkUserWithSessionKey", value);
	}
	// 665 end
}
