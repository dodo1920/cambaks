package com.cambak21.service.checkList;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.CheckListVO;
import com.cambak21.persistence.checkList.CheckListDAO;




@Service
public class CheckListServiceImpl implements CheckListService {

	
	@Inject
	private CheckListDAO dao;
	
	
	
	@Override
	public List<CheckListVO> getCheckList(String member_id) throws Exception {
			return dao.getCheckList(member_id);
		
	}

}
