package com.cambak21.service.cambakMain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.CampingVO;
import com.cambak21.persistence.cambakMain.CambakMainDAO;
import com.cambak21.util.PagingCriteria;

@Service
public class CambakMainServiceImpl implements CambakMainService {
	
	@Inject
	private CambakMainDAO dao;
	
//	=============================효원 Service 끝=======================================================
	
	@Override
	public List<CampingVO> randomListCambak() throws Exception {
		// 랜덤 캠핑장 3곳 조회
		
		Random rd = new Random();
		int maxNum = dao.getCampingsiteNum();
		boolean repeat = true;
		int repeatNum = 0;
		List<CampingVO> vo = new ArrayList<CampingVO>();
		
		do {
			int randomNo = rd.nextInt(maxNum);
			
			if (dao.checkRandomCampingImg(randomNo) != 0) {
				vo.add(dao.randomCambakInfo(randomNo));
				repeatNum++;
			}
			
			if (repeatNum == 3) {
				repeat = false;
			}
			
		} while (repeat);
		
		return vo;
	}

	@Override
	public Map<String, Object> readRecentBoard() throws Exception {
		// 메인페이지에 캠박이일의 각 게시판의 최신 게시글 5개 출력
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("review", dao.readRecentReview());
		param.put("Tip", dao.readRecentTip());
		param.put("Resell", dao.readRecentResell());
		param.put("QA", dao.readRecentQA());
		param.put("Humor", dao.readRecentHumor());
		
		return param;
	}

	
//	=============================효원 Service 끝=======================================================
	
//	=============================도연 Service=======================================================
	@Override
	public List<CampingVO> getCampings(String searchWord) throws Exception {
		return dao.getCampings(searchWord);
	}
	
	
	
	
//	=============================도연 Service 끝=======================================================
	
//	=============================정민 Service=======================================================
	
	
	
	
	
	
	
	
	
//	=============================정민 Service 끝=======================================================


}
