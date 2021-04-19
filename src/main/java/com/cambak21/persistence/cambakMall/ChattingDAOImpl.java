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

}
