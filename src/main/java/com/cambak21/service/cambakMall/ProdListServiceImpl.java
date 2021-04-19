package com.cambak21.service.cambakMall;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProductDetailListVO;
import com.cambak21.domain.ProductDetailOrderVO;
import com.cambak21.domain.ProductListReviewNumVO;
import com.cambak21.persistence.cambakMall.ProdListDAO;
import com.cambak21.util.ProdListPagingCriteria;
import com.cambak21.util.ProdListPagingParam;

@Service
public class ProdListServiceImpl implements ProdListService {
	
	@Inject
	private ProdListDAO dao;
	
	@Override
	public Map<String, Object> prodCategoryList(ProductDetailOrderVO detail, ProdListPagingCriteria cri) throws Exception {
		// 상품 리스트 페이지 출력
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<ProductDetailListVO> vo = dao.prodCategoryList(detail, cri);
		param.put("prodList", vo);
		
		List<ProductListReviewNumVO> reviewNum = new ArrayList<ProductListReviewNumVO>();
		
		for (int i = 0; i > vo.size(); i++) {
			if (vo.get(i).getProduct_prodAvgScore() != 0) {
				reviewNum.add(dao.getProductReviewNum(vo.get(i).getProduct_id()));
			}
		}
		param.put("reviewNum", reviewNum);
		
		ProdListPagingParam pp = new ProdListPagingParam();
		pp.setCri(cri);
		pp.setTotalCount(dao.prodCategoryNum(detail));
		param.put("paging", pp);
		
		// 인기 상품 6개 출력
		param.put("popularList", dao.popularProdList());
		
		return param;
	}

	@Override
	public Map<String, Object> prodSearchList(ProductDetailOrderVO detail, String keyword, ProdListPagingCriteria cri) throws Exception {
		// 상품 검색 결과 리스트 페이지 출력
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<ProductDetailListVO> vo = dao.prodSearchList(detail, keyword, cri);
		param.put("prodList", vo);
		
		List<ProductListReviewNumVO> reviewNum = new ArrayList<ProductListReviewNumVO>();
		
		for (int i = 0; i > vo.size(); i++) {
			if (vo.get(i).getProduct_prodAvgScore() != 0) {
				reviewNum.add(dao.getProductReviewNum(vo.get(i).getProduct_id()));
			}
		}
		param.put("reviewNum", reviewNum);
		
		ProdListPagingParam pp = new ProdListPagingParam();
		pp.setCri(cri);
		pp.setTotalCount(dao.prodSearchNum(detail, keyword));
		param.put("paging", pp);
		
		// 인기 상품 6개 출력
		param.put("popularList", dao.popularProdList());
		
		return param;
	}


}
