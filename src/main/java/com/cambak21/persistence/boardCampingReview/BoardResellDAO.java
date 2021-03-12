package com.cambak21.persistence.boardCampingReview;

import java.util.List;

import com.cambak21.domain.ResellBoardVO;

public interface BoardResellDAO {
	/**
	 * @Method Name : ResellBoardInsert
	 * @작성일 : 2021. 3. 12.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard테이블에 Insert하기 위한 Method
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int ResellBoardInsert(ResellBoardVO vo)throws Exception;
	
	
	/**
	 * @Method Name : ResellBoardReadAll
	 * @작성일 : 2021. 3. 12.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard테이블에 모든 내용을 가져옴
	 * @return
	 * @throws Exception
	 */
	public List<ResellBoardVO> ResellBoardReadAll()throws Exception;
	
	
	/**
	 * @Method Name : ResellBoardRead
	 * @작성일 : 2021. 3. 12.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard테이블에 특정 내용만 가져옴
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public ResellBoardVO ResellBoardRead(int no)throws Exception;
	
	/**
	 * @Method Name : ResellBoardUpdate
	 * @작성일 : 2021. 3. 12.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard테이블에 특정 컬럼만 Update
	 * @param vo
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public int ResellBoardUpdate(ResellBoardVO vo,int no)throws Exception;
	
	/**
	 * @Method Name : ResellBoardDelete
	 * @작성일 : 2021. 3. 12.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : ResellBoard테이블에 resellBoard_isDelete컬림을 Update
	 * @param vo
	 * @param no
	 * @return
	 * @throws Exception
	 */
	public int ResellBoardDelete(ResellBoardVO vo,int no)throws Exception;
	
}
