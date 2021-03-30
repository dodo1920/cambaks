package com.cambak21.service.cambakMall;

import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;

public interface prodDetailService {
	public ProductsVO getProdDetail(int product_id) throws Exception;
	
	public boolean insertBucket(InsertintoBucketDTO insertBucket) throws Exception;
	
	public boolean checkBucket(String member_id, int product_id) throws Exception;
	
	public boolean addBucketQty(String member_id, int product_id) throws Exception;
	
	public boolean resetBucketInfo(InsertintoBucketDTO updateBucket) throws Exception;
}
