package com.cambak21.persistence.cambakMall;

import java.util.List;

import com.cambak21.domain.MyBucketCheckdVO;
import com.cambak21.domain.MyBucketListVO;

public interface MyBucketListDAO {
	List<MyBucketListVO> getBucketList(String member_id) throws Exception;
	
	int changeQty(String member_id, int product_id, int qty) throws Exception;

	int checkOnOff(String member_id, int product_id) throws Exception;
	
	void deleteItemBP(String member_id, int product_id) throws Exception;
	
	void deleteItemB(String member_id, int product_id) throws Exception;
	
	void deleteItemAllBP(String member_id) throws Exception;
	
	void deleteItemAllB(String member_id) throws Exception;
	
	List<MyBucketCheckdVO> getCheckedY(String member_id) throws Exception;
	
	void insertBP(List<MyBucketCheckdVO> vo) throws Exception;
}
