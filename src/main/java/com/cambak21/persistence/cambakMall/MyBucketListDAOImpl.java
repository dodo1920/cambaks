package com.cambak21.persistence.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.MyBucketListVO;

@Repository
public class MyBucketListDAOImpl implements MyBucketListDAO {

	@Inject
	private SqlSession ses;

	private static String ns = "com.mappers.cambakMain.MyMallMapper";

	/**
	 * @Method Name : getBucketList
	 * @작성일 : 2021. 4. 9.
	 * @작성자 : 승권
	 * @변경이력 :
	 * @Method 설명 : 해당 유저의 장바구니 목록 불러오기
	 * @param member_id : 로그인한 유저 아이디
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<MyBucketListVO> getBucketList(String member_id) throws Exception {
		return ses.selectList(ns + ".getCartList", member_id);
	}

	/**
	  * @Method Name : changeQty
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 장바구니 수량 변경
	  * @param member_id
	  * @param product_id
	  * @param qty
	  * @return
	  * @throws Exception
	  */
	@Override
	public int changeQty(String member_id, int product_id, int qty) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("product_id", product_id);
		map.put("qty", qty);
		return ses.update(ns + ".changeQty", map);
	}

	/**
	  * @Method Name : deleteItem
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 장바구니 아이템 선택 삭제
	  * @param member_id
	  * @param product_id
	  * @throws Exception
	  */
	@Override
	public int deleteItem(String member_id, int product_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("product_id", product_id);
		return ses.delete(ns + ".deleteItem", map);
	}

	/**
	  * @Method Name : checkOnOff
	  * @작성일 : 2021. 4. 9.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param member_id
	  * @param product_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int checkOnOff(String member_id, int product_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("product_id", product_id);
		return ses.update(ns + ".checkOnOff", map);
	}

}
