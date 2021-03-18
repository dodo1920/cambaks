package com.cambak21.service.boardProdQA;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProdQAVO;
import com.cambak21.dto.ProdQAInsertDTO;
import com.cambak21.dto.ProdQAUpdateDTO;
import com.cambak21.persistence.boardProdQA.BoardProdQADAO;
import com.cambak21.util.PagingCriteria;

@Service
public class BoardProdQAServiceImpl implements BoardProdQAService {
	@Inject
	private BoardProdQADAO dao;

	@Override
	public List<ProdQAVO> prodQAListAll(int product_id, int prodQA_refOrder, PagingCriteria cri) throws Exception {
		return dao.prodQAListAll(product_id, prodQA_refOrder, cri);
	}

	@Override
	public boolean insertProdQA(ProdQAInsertDTO insertQA) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkSecretPwd(int prodQA_secretPassword) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteProdQA(int prodQA_no) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ProdQAVO updateProdQA(ProdQAUpdateDTO updateQA) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProdQAVO prodQADetail(int product_id, int prodQA_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int totalProdQACnt(int product_id, int prodQA_refOrder) throws Exception {
		return dao.totalProdQACnt(product_id, prodQA_refOrder);
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

}
