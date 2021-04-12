package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.MyBucketListVO;
import com.cambak21.persistence.cambakMall.MyBucketListDAO;

@Service
public class MyBucketListSerivceImpl implements MyBucketListService {

	@Inject
	private MyBucketListDAO dao;
	
	/**
	  * @Method Name : getBucketList
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param member_id : 로그인한 유저 아이디
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyBucketListVO> getBucketList(String member_id) throws Exception {
		return dao.getBucketList(member_id);
	}

	/**
	  * @Method Name : changeQty
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 수량 변경
	  * @param member_id
	  * @param product_id
	  * @param qty
	  * @return
	  * @throws Exception
	  */
	@Override
	public int changeQty(String member_id, int product_id, int qty) throws Exception {
		return dao.changeQty(member_id, product_id, qty);
	}

	/**
	  * @Method Name : checkOnOff
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 체크 여부
	  * @param member_id
	  * @param product_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int checkOnOff(String member_id, int product_id) throws Exception {
		return dao.checkOnOff(member_id, product_id);
	}

	@Override
	@Transactional
	public void deleteItem(String member_id, int product_id) throws Exception {
		dao.deleteItemBP(member_id, product_id);
		dao.deleteItemB(member_id, product_id);
	}

}
