package com.cambak21.persistence.checkList;

import java.util.List;

import com.cambak21.domain.CheckListVO;

public interface CheckListDAO {

	public List<CheckListVO> getCheckList(String member_id) throws Exception;
}
