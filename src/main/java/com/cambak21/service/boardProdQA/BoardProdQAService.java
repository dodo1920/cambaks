package com.cambak21.service.boardProdQA;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProdQAVO;
import com.cambak21.dto.ProdQAInsertDTO;
import com.cambak21.dto.ProdQAUpdateDTO;
import com.cambak21.util.PagingCriteria;

@Service
public interface BoardProdQAService {
	/**
	 * @Method Name : prodQAListAll
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연 
	 * @변경이력 : 
	 * @Method 설명 : QA게시판 목록 불러오는 메서드 
	 * @return
	 * @throws Exception
	 */
	public List<ProdQAVO> prodQAListAll(int product_id, int prodQA_refOrder, PagingCriteria cri) throws Exception;
	
	/**
	 * @Method Name : insertProdQA
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연 
	 * @변경이력 : 
	 * @Method 설명 : QA게시판에 새글 입력하는 메서드
	 * @param inqa
	 * @return
	 * @throws Exception
	 */
	public boolean insertProdQA(ProdQAInsertDTO insertQA) throws Exception;
	
	/**
	 * @Method Name : checkSecretPwd
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : QA게시판에서 내 글 삭제할 때, 비밀글이면 비밀번호를 확인하는 메스드
	 * @param prodQA_secretPassword
	 * @return
	 * @throws Exception
	 */
	public boolean checkSecretPwd(int prodQA_secretPassword) throws Exception; 
	
	/**
	 * @Method Name : deleteProdQA
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : QA게시판에서 내 글을 삭제하는 메서드
	 * @param prodQA_no
	 * @return
	 * @throws Exception
	 */
	public boolean deleteProdQA(int prodQA_no) throws Exception;
	
	/**
	 * @Method Name : updateProdQA
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : QA게시판에서 내 글을 수정하는 메서드
	 * @param updateQA
	 * @return
	 * @throws Exception
	 */
	public ProdQAVO updateProdQA(ProdQAUpdateDTO updateQA) throws Exception;
	
	/**
	 * @Method Name : prodQADetail
	 * @작성일 : 2021. 3. 17.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상세글을 보여주는 메서드
	 * @param product_id
	 * @param prodQA_ref
	 * @return
	 * @throws Exception
	 */
	public ProdQAVO prodQADetail(int product_id, int prodQA_no) throws Exception;
	
	/**
	 * @Method Name : prodQACnt
	 * @작성일 : 2021. 3. 17.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 페이징 처리를 위해 QA 게시판의 전체 게시글 수 구하는 메서드
	 * @param product_id
	 * @param prodQA_no
	 * @return
	 * @throws Exception
	 */
	public int totalProdQACnt(int product_id, int prodQA_no) throws Exception;
	
	/**
	 * @Method Name : prodQAViewCnt
	 * @작성일 : 2021. 3. 17.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 게시글의 조회수를 카운팅 하는 메서드
	 * @param prodQA_no
	 * @return
	 * @throws Exception
	 */
	public int prodQAViewCnt(int prodQA_no) throws Exception;
	
	/**
	 * @Method Name : prodQALikeCnt
	 * @작성일 : 2021. 3. 17.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 게시글의 좋아요 수를 카운팅 하는 메서드
	 * @param proQA_no
	 * @return
	 * @throws Exception
	 */
	public int prodQALikeCnt(int proQA_no) throws Exception;
}