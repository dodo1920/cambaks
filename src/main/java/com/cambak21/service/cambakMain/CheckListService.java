package com.cambak21.service.cambakMain;

import java.util.List;

import com.cambak21.domain.CheckListVO;

public interface CheckListService {

	public List<CheckListVO> getCheckListAll(String member_id) throws Exception;
	
	public boolean changeCheckList(String checkList_checked, int check_List_no) throws Exception;
}
