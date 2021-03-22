package com.cambak21.service.boardProdQA;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProdQAVO;
import com.cambak21.domain.ProdQAsLikeVO;
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
		boolean result = false;
				
		int i = dao.insertProdQA(insertQA);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean checkSecretPwd(String prodQA_secretPassword, int prodQA_no) throws Exception {
		boolean result = false;
		
		int i = dao.checkSecretPwd(prodQA_secretPassword, prodQA_no);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean deleteProdQA(int prodQA_no) throws Exception {
		boolean result = false;
		
		int i = dao.deleteProdQA(prodQA_no);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean updateProdQA(ProdQAUpdateDTO updateQA) throws Exception {
		boolean result = false;
		
		int i = dao.updateProdQA(updateQA);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public ProdQAUpdateDTO prodQADetail(int product_id, int prodQA_no) throws Exception {
		return dao.prodQADetail(product_id, prodQA_no);
	}

	@Override
	public int totalProdQACnt(int product_id, int prodQA_refOrder) throws Exception {
		return dao.totalProdQACnt(product_id, prodQA_refOrder);
	}

	@Override
	public boolean prodQAViewCnt(int prodQA_no) throws Exception {
		boolean result = false;
		
		int i = dao.prodQAViewCnt(prodQA_no);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean prodQALikeCnt(int prodQA_no) throws Exception {
boolean result = false;
		
		int i = dao.prodQALikeCnt(prodQA_no);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public int getMaxNo() throws Exception {
		return dao.getMaxNo();
	}

	@Override
	public boolean prodQAInsertLike(ProdQAsLikeVO vo) throws Exception {
		boolean result = false;
		
		int i = dao.prodQAInsertLike(vo);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean prodQADeleteLike(ProdQAsLikeVO vo) throws Exception {
		boolean result = false;
		
		int i = dao.prodQADeleteLike(vo);
		
		if(i == 1) {
			result = true;
		}
		
		return result;
	}

}
