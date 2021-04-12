package com.cambak21.service.cambakMall;

import java.util.List;

import com.cambak21.domain.MyBucketListVO;

public interface MyBucketListService {
	
	List<MyBucketListVO> getBucketList(String member_id) throws Exception;
	
	int changeQty(String member_id, int product_id, int qty) throws Exception;
	
	int checkOnOff(String member_id, int product_id) throws Exception;
	
	void deleteItem(String member_id, int product_id) throws Exception;
	
	void deleteItemAll(String member_id) throws Exception;
	
	void goOrder(String member_id) throws Exception;
}
