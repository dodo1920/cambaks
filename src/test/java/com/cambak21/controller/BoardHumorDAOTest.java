package com.cambak21.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cambak21.domain.BoardVO;
import com.cambak21.persistence.boardHumor.BoardHumorDAO;
import com.cambak21.util.PagingCriteria;


@RunWith(SpringJUnit4ClassRunner.class)//현재 클래스가 Sprint-test(JUnit4)와 함께 작동
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"}
		)
public class BoardHumorDAOTest {
	@Inject
	private BoardHumorDAO dao;
	
//	@Test
//	public void insertBoard() throws Exception{
//		BoardVO vo = new BoardVO();
//		vo.setMember_id("aaa");
//		vo.setBoard_title("김대기 test");
//		
//		vo.setBoard_content("rere test");
//		
//		int i = dao.insertBoardHumor(vo);
//		if(i == 1) {
//			System.out.println("글등록 성공");
//		}
//	}
	
//	@Test
//	public void readBoardHumor() throws Exception{
//		System.out.println(dao.readBoardHumor(4).toString());
//	}
	
	@Test
	public void listBoard() throws Exception{
		PagingCriteria cri = new PagingCriteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		System.out.println(dao.listBoardHumorCriteria(cri).toString());
	}
}
