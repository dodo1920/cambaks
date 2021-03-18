package com.cambak21.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ResellLikeBoardVO;
import com.cambak21.persistence.boardCampingReview.CampingReviewDAO;
import com.cambak21.persistence.myorder.MemberOrderDAO;
import com.cambak21.persistence.resell.ResellBoardDAO;
import com.cambak21.persistence.resell.ResellBoardLikeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"}
		) // 위 경로에서 root-context.xml파일을 찾아 로딩
public class DAOTest {
	private static final Logger logger = LoggerFactory.getLogger(DAOTest.class);
	@Inject
	   private CampingReviewDAO dao;
	
	@Test
	public void test() throws Exception {
		System.out.print(dao.campingReviewAll().toString());
	}
}
