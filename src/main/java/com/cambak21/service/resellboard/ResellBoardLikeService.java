package com.cambak21.service.resellboard;

import com.cambak21.domain.ResellLikeBoardVO;

public interface ResellBoardLikeService {
	/**
	 * @Method Name : ResellBoardLikeInsert
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 유저가 좋아요 누르면 좋아요테이블에 insert
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean ResellBoardLikeInsert(ResellLikeBoardVO vo) throws Exception;
	

	/**
	 * @Method Name : ResellBoardLikeDelete
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 좋아요 취소
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean  ResellBoardLikeDelete(ResellLikeBoardVO vo)throws Exception;
	
	/**
	 * @Method Name : ResellBoardLikeCnt
	 * @작성일 : 2021. 3. 14.
	 * @작성자 : ktehun
	 * @변경이력 : 
	 * @Method 설명 : 좋아요수
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public boolean ResellBoardLikeCnt(ResellLikeBoardVO vo)throws Exception;
}
