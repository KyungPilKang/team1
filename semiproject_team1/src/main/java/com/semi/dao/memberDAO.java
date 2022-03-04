package com.semi.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semi.dto.Member;



@Mapper
@Repository
public interface memberDAO {
	public Member queryMember(String id) throws Exception;
	public Member queryMember_nickname(String id) throws Exception;
}
