package com.cambak21.persistence.cambakMall;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BucketVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;

@Repository
public class prodDetailDAOImpl implements prodDetailDAO {
	
	@Inject
	private SqlSession ses;
	private static String namespace="com.cambak21.mappers.cambakMallMapper";
	
	@Override
	public ProductsVO getProdDetail(int product_id) throws Exception {
		return ses.selectOne(namespace + ".getProdDetail", product_id);
	}

	@Override
	public int insertBucket(InsertintoBucketDTO insertBucket) throws Exception {
		return ses.insert(namespace + ".insertBucket", insertBucket);
	}

	@Override
	public BucketVO checkBucket(String member_id, int product_id) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("product_id", product_id);
		
		return ses.selectOne(namespace + ".checkBucket", params);
	}

	@Override
	public int addBucketQty(String member_id, int product_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int resetBucketInfo(InsertintoBucketDTO updateBucket) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
