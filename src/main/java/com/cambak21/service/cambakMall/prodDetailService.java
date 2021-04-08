package com.cambak21.service.cambakMall;

import com.cambak21.domain.BucketVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;

public interface prodDetailService {
	public ProductsVO getProdDetail(int product_id) throws Exception;
	
	public boolean insertBucket(InsertintoBucketDTO insertBucket) throws Exception;
	
	public BucketVO checkBucket(String member_id, int product_id) throws Exception;
	
	public boolean updateBucketQty(InsertintoBucketDTO updateBucket) throws Exception;
	
	public int checkBucketQty(String member_id) throws Exception;
}
