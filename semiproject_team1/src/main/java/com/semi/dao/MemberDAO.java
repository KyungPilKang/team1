package com.semi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semi.dto.Board;
import com.semi.dto.Feedback;
import com.semi.dto.Member;



@Mapper
@Repository
public interface MemberDAO {
	public Member queryMember(String id) throws Exception;
	public Member queryMember_nickname(String id) throws Exception;
	public void insertMember(Member member) throws Exception;
	public Member selelctMember_bymno(int mno) throws Exception;
	public Member selelctMember_bykakao(String id) throws Exception;
	public void updateMem_code_confirm(int mno) throws Exception;
	public void updateMem_code(Member member) throws Exception;
	public int selectMem_score(int mno) throws Exception;
	public void idLink(Member mem) throws Exception;
	public void updateMem_link_confirm(Member mem) throws Exception;
	public List<Member> link_member_list() throws Exception;
	public void adminConfirm(int mno) throws Exception;
	public List<Board> selectBoardList_mine(Member mem) throws Exception;
	public List<Feedback> selectFeedbackList_mine(Member mem) throws Exception;
	public List<String> selectBoard_numList_ward(String mno) throws Exception;
	public Board selectBoard_ward(String board_num) throws Exception;
	public void updateMem_reg_ok(String nickname) throws Exception;
}
