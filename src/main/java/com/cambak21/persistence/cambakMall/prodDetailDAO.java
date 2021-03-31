package com.cambak21.persistence.cambakMall;

import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;

public interface prodDetailDAO {
	public ProductsVO getProdDetail(int product_id) throws Exception;
	
	public int insertBucket(InsertintoBucketDTO insertBucket) throws Exception;
	
	public int checkBucket(String member_id, int product_id) throws Exception;
	
	public int addBucketQty(String member_id, int product_id) throws Exception;
	
	public int resetBucketInfo(InsertintoBucketDTO updateBucket) throws Exception;	

}
