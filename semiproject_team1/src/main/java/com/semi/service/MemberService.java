package com.semi.service;

import com.semi.dto.Member;

public interface MemberService 
{
	public boolean accessMember(String mem_email_id, String mem_pw) throws Exception;
	public boolean emailOverlap(String mem_email_id) throws Exception;
	public boolean nickOverlap(String mem_nickname) throws Exception;
	public void insertMember(Member member) throws Exception;
	public Member selectMemeber(String id) throws Exception;
	public Member selectMemeber_bymno(int mno) throws Exception;
	public void updateMem_code_confirm(int mno) throws Exception;
	public void updateMem_code(int mno) throws Exception;
}
