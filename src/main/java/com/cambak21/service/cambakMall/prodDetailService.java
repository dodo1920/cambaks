package com.cambak21.service.cambakMall;

import com.cambak21.domain.BucketVO;
import com.cambak21.domain.NonUserBucketVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.dto.InsertintoNonUserBucketDTO;

public interface prodDetailService {
	public ProductsVO getProdDetail(int product_id) throws Exception;
	
	public boolean insertBucket(InsertintoBucketDTO insertBucket) throws Exception;
	
	public BucketVO checkBucket(String member_id, int product_id) throws Exception;
	
	public boolean updateBucketQty(InsertintoBucketDTO updateBucket) throws Exception;
	
	public int checkBucketQty(String member_id) throws Exception;

	public NonUserBucketVO checkNonUserBucket(String nonUserBucket_ssid, int product_id) throws Exception;

	public int checkNonUserBucketQty(String nonUserBucket_ssid) throws Exception;

	public boolean insertNonUserBucket(InsertintoNonUserBucketDTO insertNonUserBucket) throws Exception;

	public boolean updateNonUserBucketQty(InsertintoNonUserBucketDTO updateNonUserBucket) throws Exception;
}
