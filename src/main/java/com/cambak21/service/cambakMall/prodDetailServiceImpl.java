package com.cambak21.service.cambakMall;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.persistence.cambakMall.prodDetailDAO;

@Service
public class prodDetailServiceImpl implements prodDetailService {
	
	@Inject
	private prodDetailDAO dao;
	
	@Override
	public ProductsVO getProdDetail(int product_id) throws Exception {
		return dao.getProdDetail(product_id);
	}

	@Override
	public boolean insertBucket(InsertintoBucketDTO insertBucket) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkBucket(String member_id, int product_id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addBucketQty(String member_id, int product_id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean resetBucketInfo(InsertintoBucketDTO updateBucket) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
