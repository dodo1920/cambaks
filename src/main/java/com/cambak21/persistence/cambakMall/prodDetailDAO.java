package com.cambak21.persistence.cambakMall;

import com.cambak21.domain.BucketVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;

public interface prodDetailDAO {
	public ProductsVO getProdDetail(int product_id) throws Exception;
	
	public int insertBucket(InsertintoBucketDTO insertBucket) throws Exception;
	
	public BucketVO checkBucket(String member_id, int product_id) throws Exception;
	
	public int updateBucketQty(InsertintoBucketDTO updateBucket) throws Exception;
	
	public int checkBucketQty(String member_id) throws Exception;	

}
