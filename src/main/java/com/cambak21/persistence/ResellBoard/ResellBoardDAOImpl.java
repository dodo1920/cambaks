package com.cambak21.persistence.ResellBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.PagingCriteria;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.domain.SerachCriteria;
import com.cambak21.dto.ResellBoardDeteDTO;
import com.cambak21.dto.ResellBoardUpdateDTO;
import com.cambak21.dto.ResellLikeBoardInsertDTO;
@Repository
public class ResellBoardDAOImpl implements ResellBoardDAO {
	@Inject
	private SqlSession ses;
	private String namespace ="com.mapper.ResellBoardMapper";
	@Override
	public int ResellBoardInsert(ResellLikeBoardInsertDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return ses.insert(namespace+".ResellBoardInsert",dto);
	}
	@Override
	public List<ResellBoardVO> ResellBoardReadAll(PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(namespace+".ResellBoardReadAll",cri);
	}
	@Override
	public int ResellBoardReadAllCnt() throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".ResellBoardReadAllCnt");
	}
	@Override
	public List<ResellBoardVO> ResellBoardRead(PagingCriteria cri, SerachCriteria scri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchType", scri.getSearchType());
		param.put("searchWord", scri.getSearchWord());
		param.put("pageStert", cri.getPageStart());
		param.put("pageNum", cri.getPerPageNum());
		
		return ses.selectList(namespace+".ResellBoardRead",param);
	}
	@Override
	public int ResellBoardReadCnt(SerachCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".ResellBoardReadCnt",scri);
	}
	@Override
	public int ResellBoardUpdate(ResellBoardUpdateDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return ses.update(namespace+".ResellBoardUpdate",dto);
	}
	@Override
	public int ResellBoardDelete(ResellBoardDeteDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return ses.update(namespace+"ResellBoardDelete",dto);
	}
	@Override
	public void ResellBoardViewcnt(int no) throws Exception {
		ses.update(namespace+".ResellBoardViewcnt",no);
		
	}
	@Override
	public void ResellBoardUpdateReply(int no, int amount) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("amount", amount);
		param.put("no", no);
		ses.update(namespace+".ResellBoardUpdateReply",param);
		
	}
	


}
