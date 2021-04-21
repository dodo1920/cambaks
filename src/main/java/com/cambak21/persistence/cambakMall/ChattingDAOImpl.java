package com.cambak21.persistence.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ChattingListVO;

@Repository
public class ChattingDAOImpl implements ChattingDAO {
	
	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mappers.ChattingMapper";
	
	/**
	  * @Method Name : fromAdmin
	  * @작성일 : 2021. 4. 20.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 유저가 메시지 보낼 시
	  * @param member_id
	  * @param chatting_content
	  * @throws Exception
	  */
	@Override
	public void fromUser(String member_id, String chatting_content) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("chatting_content", chatting_content);
		ses.insert(namespace + ".fromUser", map);
	}

	@Override
	public List<ChattingListVO> chattingList() throws Exception {
		return ses.selectList(namespace + ".getChattingList");
	}

	@Override
	public List<ChattingListVO> getChatting(String member_id) throws Exception {
		return ses.selectList(namespace + ".getChatting", member_id);
	}

	/**
	  * @Method Name : fromAdmin
	  * @작성일 : 2021. 4. 20.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 운영자가 메시지 보낼 시
	  * @param member_id
	  * @param chatting_content
	  * @throws Exception
	  */
	@Override
	public void fromAdmin(String member_id, String chatting_content) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("chatting_content", chatting_content);
		ses.insert(namespace + ".fromAdmin", map);
	}

}
