package com.cambak21.service.checkList;

import java.util.List;

import com.cambak21.domain.CheckListVO;

public interface CheckListService {

	public List<CheckListVO> getCheckList(String member_id) throws Exception;
	
	
	
}
