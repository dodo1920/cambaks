package com.cambak21.persistence.boardProdQA;

import java.util.List;

import com.cambak21.domain.ProdQAVO;
import com.cambak21.dto.InsertintoProdQADTO;
import com.cambak21.dto.UpdateProdQADTO;

public interface BoardProdQADAO {
	/**
	 * @Method Name : prodQAListAll
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연 
	 * @변경이력 : 
	 * @Method 설명 : QA게시판 목록 불러오는 메서드 
	 * @return
	 * @throws Exception
	 */
	public List<ProdQAVO> prodQAListAll() throws Exception;
	
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
	public int insertProdQA(InsertintoProdQADTO insertQA) throws Exception;
	
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
	public int checkSecretPwd(int prodQA_secretPassword) throws Exception; 
	
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
	public int deleteProdQA(int prodQA_no) throws Exception;
	
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
	public ProdQAVO updateProdQA(UpdateProdQADTO updateQA) throws Exception;
	 
}
