package com.semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dao.memberDAO;
import com.semi.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	memberDAO memberDAO;

	@Override
	public boolean accessMember(String mem_email_id, String mem_pw) throws Exception {
		Member mem=memberDAO.queryMember(mem_email_id);
		if(mem_email_id.equals(mem.getMem_email_id())&&mem_pw.equals(mem.getMem_pw())) {
			return true;
		} else if(mem_email_id.equals(mem.getMem_email_id())&&!mem_pw.equals(mem.getMem_pw())) {
			throw new Exception("비밀번호가 일치하지 않습니다");
		} else return false;
	}

	@Override
	public boolean emailOverlap(String mem_email_id) throws Exception {
		Member email = memberDAO.queryMember(mem_email_id);
		if(email==null) return false;
		return true;
	}
	
	@Override
	public boolean nickOverlap(String mem_nickname) throws Exception {
		Member nickName = memberDAO.queryMember_nickname(mem_nickname);
		if(nickName==null) return false;
		return true;
	}
	
	
    
}

	
		
	

