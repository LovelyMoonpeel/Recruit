package com.recruit.persistence;

import java.util.List;

import com.recruit.domain.CodeVO;

public interface CodeDAO {

	public List<CodeVO> CodeList(int tid) throws Exception;
}
