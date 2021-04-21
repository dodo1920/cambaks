package com.cambak21.persistence.cambakMall;

import com.cambak21.domain.BucketVO;
import com.cambak21.domain.NonUserBucketVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.dto.InsertintoNonUserBucketDTO;

public interface prodDetailDAO {
	public ProductsVO getProdDetail(int product_id) throws Exception;
	
	public int insertBucket(InsertintoBucketDTO insertBucket) throws Exception;
	
	public BucketVO checkBucket(String member_id, int product_id) throws Exception;
	
	public int updateBucketQty(InsertintoBucketDTO updateBucket) throws Exception;
	
	public int checkBucketQty(String member_id) throws Exception;

	public NonUserBucketVO checkNonUserBucket(String nonUserBucket_ssid, int product_id) throws Exception;

	public int checkNonUserBucketQty(String nonUserBucket_ssid) throws Exception;

	public int insertNonUserBucket(InsertintoNonUserBucketDTO insertNonUserBucket) throws Exception;

}
