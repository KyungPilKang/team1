package com.semi.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semi.dto.Member;



@Mapper
@Repository
public interface MemberDAO {
	public Member queryMember(String id) throws Exception;
	public Member queryMember_nickname(String id) throws Exception;
	public void insertMember(Member member) throws Exception;
	public Member selelctMember_bymno(int mno) throws Exception;
	public void updateMem_code_confirm(int mno) throws Exception;
	public void updateMem_code(Member member) throws Exception;
	public int selectMem_score(int mno) throws Exception;
}
