package com.cambak21.persistence.boardCS;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cambak21.domain.MemberVO;
import com.cambak21.persistence.cambakMall.prodOrderDAO;
import com.cambak21.persistence.resell.ResellBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
      locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"}
) // 위 경로에서 root-context.xml 파일을 찾아 로딩
public class prodOrderDAOTest {
	
	@Inject
	private prodOrderDAO dao;
	
	@Test
	public void listNick() throws Exception{
		MemberVO vo = new MemberVO();
		
		vo.setMember_id("aaa");
		
		System.out.println(dao.selectDestNickName(vo).toString());
	}
	

}
