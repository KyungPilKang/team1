package com.semi.service;

public interface MemberService 
{
	boolean accessMember(String mem_email_id, String mem_pw) throws Exception;
	boolean emailOverlap(String mem_email_id) throws Exception;
	boolean nickOverlap(String mem_nickname) throws Exception;
}
