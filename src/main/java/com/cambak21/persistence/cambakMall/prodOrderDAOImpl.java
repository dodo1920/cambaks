package com.cambak21.persistence.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.PayInfoVO;
import com.cambak21.domain.ProdInfoVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Repository
public class prodOrderDAOImpl implements prodOrderDAO {
	
	@Inject
	private SqlSession ses;
	private static String namespace="com.cambak21.mappers.cambakMallMapper";

	
	// 김대기 DAO -->
	@Override
	public List<DestinationVO> selectDestNickName(String member_id) throws Exception {
		System.out.println("dao단 멤버 아이디 = " + member_id);
		return ses.selectList(namespace + ".destinationSelect", member_id);
	}


	@Override
	public DestinationVO selectOneDest(int destination_no) throws Exception {
		
		return ses.selectOne(namespace + ".selectDestOne", destination_no);
	}

	@Override
	public DestinationVO defaultDest(String member_id) throws Exception {
		
		return ses.selectOne(namespace + ".defaultDest", member_id);
	}
	
//  	<!-- 장원영 DAO -->
	@Override
	public List<ProdInfoVO> prodOrderInfo(String member_id) throws Exception {
		
		return ses.selectList(namespace + ".bucketInfoSelect", member_id);
	}
	
	@Override
	public int payInfo(PayInfoVO vo) throws Exception {
		System.out.println(vo.toString());
		return ses.insert(namespace + ".payInfoInsert", vo);
	}
  	

	@Override
	public int payInfoNo() throws Exception {
	
		return ses.selectOne(namespace + ".payInfoNo");
	}
	
//  	<!-- 김도연 DAO -->
  	
  	
//  	<!-- 김정민 DAO -->
  	
  	
//  	<!-- 김태훈 DAO -->
  	
		@Override
		public List<ProductsVO> prodBoardReadAll(PagingCriteria cri) throws Exception {
			// TODO Auto-generated method stub
			Map<String, Object> param = new HashMap<String, Object>();
			System.out.println((cri.getPage()-1)*cri.getPerPageNum());
			param.put("pageStart",(cri.getPage()-1)*cri.getPerPageNum());
			param.put("perPageNum", cri.getPerPageNum());
			
			return ses.selectList(namespace+".prodBoardReadAll",param);
		}
	
	
		@Override
		public int prodBoardReadAllCnt() throws Exception {
			// TODO Auto-generated method stub
			return ses.selectOne(namespace+".prodBoardReadAllCnt");
		}


		@Override
		public List<ProductsVO> prodBoardRead(PagingCriteria cri, SearchCriteria scri) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("searchType", scri.getSearchType());
			param.put("searchWord", scri.getSearchWord());
			param.put("pageStert", cri.getPageStart());
			param.put("pageNum", cri.getPerPageNum());
			
			return ses.selectList(namespace+".prodBoardRead",param);
		}


		@Override
		public int prodBoardReadCnt(SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return ses.selectOne(namespace+".prodBoardReadCnt",scri);
		}
		
		@Override
		public List<ProductsVO> prodBoardSearch(PagingCriteria cri, SearchCriteria scri) throws Exception {
			System.out.println("DAO_PageStart : "+cri.getPageStart());
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("searchType", scri.getSearchType());
			param.put("searchWord", scri.getSearchWord());
			param.put("optionType", scri.getOptionType());
			param.put("pageStert", cri.getPageStart());
			param.put("pageNum", cri.getPerPageNum());
			
			
			return ses.selectList(namespace+".prodBoardSearch",param);
		}


		@Override
		public int prodBoardSearchId(SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return ses.selectOne(namespace+".prodBoardSearchId",scri);
		}

//  	<!-- 백승권 DAO -->
  	
  	
//  	<!-- 서효원 DAO -->
  	
  	
//  	<!-- 박종진 DAO -->
  	
	@Override
	public List<DestinationVO> destinationsListAjax(String member_id) throws Exception {
		return ses.selectList(namespace + ".destinationsListAjax", member_id);
	}



	@Override
	public int defaultModyAjax(String member_id, int destination_no) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("member_id", member_id);
		paraMap.put("destination_no", destination_no);
	
			return ses.update(namespace + ".defaultModyAjax", paraMap);
		
	}


	@Override
	public int destiModyAjax(DestinationVO vo) throws Exception {
			return ses.update(namespace + ".destiModyAjax", vo);
	}


	@Override
	public int insertDestiny(DestinationVO vo) throws Exception {
		return ses.insert(namespace + ".insertDestiny", vo);
	}


	@Override
	public int deleteDestiny(String member_id, int destination_no) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("member_id", member_id);
		paraMap.put("destination_no", destination_no);
	
			return ses.update(namespace + ".deleteDestiny", paraMap);
		
	}


	@Override
	public DestinationVO GetModifydst(int dstno) throws Exception {
		return ses.selectOne(namespace + ".GetModifydst", dstno);
	}



	


//	<!-- 이영광 DAO -->

	


	
}
