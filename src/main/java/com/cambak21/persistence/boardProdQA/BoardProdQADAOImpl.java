package com.cambak21.persistence.boardProdQA;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ProdQAVO;
import com.cambak21.dto.ProdQAInsertDTO;
import com.cambak21.dto.ProdQAUpdateDTO;
import com.cambak21.util.PagingCriteria;

@Repository
public class BoardProdQADAOImpl implements BoardProdQADAO {
	@Inject
	private SqlSession ses;
	private String namespace = "com.cambak21.mappers.cambakBoard.boardQAMapper";
	
	@Override
	public List<ProdQAVO> prodQAListAll(int product_id, int prodQA_refOrder, PagingCriteria cri) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("product_id", product_id);
//		params.put("prodQA_refOrder", prodQA_refOrder);
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(namespace + ".prodQAListAll", params);
	}

	@Override
	public int insertProdQA(ProdQAInsertDTO insertQA) throws Exception {
		return ses.insert(namespace + ".insertProdQA", insertQA);
	}

	@Override
	public int checkSecretPwd(String prodQA_secretPassword, int prodQA_no) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("prodQA_secretPassword", prodQA_secretPassword);
		params.put("prodQA_no", prodQA_no);
		return ses.selectOne(namespace + ".checkSecretPwd", params);
	}

	@Override
	public int deleteProdQA(int prodQA_no) throws Exception {
		return ses.delete(namespace + ".deleteProdQA", prodQA_no);
	}

	@Override
	public int updateProdQA(ProdQAUpdateDTO updateQA) throws Exception {
		return ses.update(namespace + ".updateProdQA", updateQA);
	}

	@Override
	public ProdQAUpdateDTO prodQADetail(int product_id, int prodQA_no) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("product_id", product_id);
		params.put("prodQA_no", prodQA_no);
		
		return ses.selectOne(namespace + ".prodQADetail", params);
	}

	@Override
	public int totalProdQACnt(int product_id, int prodQA_refOrder) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("product_id", product_id);
		params.put("prodQA_refOrder", prodQA_refOrder);
		
		return ses.selectOne(namespace + ".totalProdQACnt", params);
	}

	@Override
	public int prodQAViewCnt(int prodQA_no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int prodQALikeCnt(int proQA_no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getMaxNo() throws Exception {
		return ses.selectOne(namespace + ".getMaxNo");
	}

}
