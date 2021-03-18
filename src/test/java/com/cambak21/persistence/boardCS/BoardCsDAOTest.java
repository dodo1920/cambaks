package com.cambak21.persistence.boardCS;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cambak21.persistence.resell.ResellBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
      locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"}
) // 위 경로에서 root-context.xml 파일을 찾아 로딩
public class BoardCsDAOTest {
	
	@Inject
	private ResellBoardDAO dao;
	

}
