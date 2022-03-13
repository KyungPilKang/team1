package com.semi.service;

import java.util.List;
import java.util.Map;

import com.semi.dto.Board;
import com.semi.dto.Feedback;
import com.semi.dto.Member;

public interface MypageService {
	public Map<String, String> selectTier(int mno) throws Exception;
	public Map<String, String> selectChamp(int mno) throws Exception;
	public void idLink(Member mem) throws Exception;
	public boolean codeConfirm(Member mem) throws Exception;
	public void adminConfirm(int mno) throws Exception;
	public List<Board> selectBoardList_mine(int mno) throws Exception;
	public List<Board> selectBoardList_ward(int mno) throws Exception;
	public List<Feedback> selectFeedbackList_mine(int mno) throws Exception;
}
