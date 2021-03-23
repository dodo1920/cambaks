package com.cambak21.persistence.cambakMain;

import java.util.List;

import com.cambak21.domain.CheckListVO;

public interface CheckListDAO {
	
	public List<CheckListVO> getCheckListAll(String member_id) throws Exception;

	public int changeCheckList(String checkList_checked, int checkList_no) throws Exception;
	
}
