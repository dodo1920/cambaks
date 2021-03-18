package com.cambak21.persistence.cambakMain;

import java.util.List;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.MemberVO;

public interface MemberDAO {
	/**
	 * @Method Name : MemberUpdate
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김태훈
	 * @변경이력 : 
	 * @Method 설명 : 멤버 정보를 수정하는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int memberUpdate(MemberVO vo) throws Exception;
	
	/**
	 * @Method Name : memberDelete
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김대기
	 * @변경이력 : 
	 * @Method 설명 : 회원 탈퇴시, 탈퇴 컬럼을 변경하는 메서드
	 * @param member_id
	 * @return
	 * @throws Exception
	 */
	public int memberDelete(String member_id) throws Exception;
	
	/**
	 * @Method Name : memberInsert
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 이영광
	 * @변경이력 : 
	 * @Method 설명 : 회원 가입시, 회원 정보를 저장하는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int memberInsert(MemberVO vo) throws Exception;
	
	/**
	 * @Method Name : findId
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 아이디 찾기시, 유저 이름과 이메일을 확인하여 일치하면 해당 아이디를 보여주는 메서드
	 * @param fid
	 * @return
	 * @throws Exception
	 */
	public List<String> findId(FindIdVO fId) throws Exception;
	
	/**
	 * @Method Name : findPwd
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연
	 * @변경이력 : 2021. 3. 17 / 도연 / VO삭제로 인한 매개변수 변경
	 * @Method 설명 : 비밀번호 찾기시, 유저 이름과 전화번호를 확인하여 일치하면 비밀번호 변경 페이지로 넘겨주는 메서드
	 * @param fPwd
	 * @return
	 * @throws Exception
	 */
	public int findPwd(String member_id, String member_Mobile) throws Exception;
	
	/**
	 * @Method Name : updatePwd
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 김도연
	 * @변경이력 : 2021. 3. 17 / 도연 / DTO 삭제로 인한 매개변수 변경
	 * @Method 설명 : 비밀번호 찾기시, 비밀번호를 변경해주는 메서드
	 * @param newPwd
	 * @return
	 * @throws Exception
	 */
	public int updatePwd(String member_id, String member_password) throws Exception;
	
	/**
	 * @Method Name : login
	 * @작성일 : 2021. 3. 16.
	 * @작성자 : 장원영
	 * @변경이력 : 
	 * @Method 설명 : 로그인시, 일치하는 아이디와 비번이 있는지 확인하여 로그인상태로 변경해주는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MemberVO login(MemberVO vo) throws Exception;
	
	
}
