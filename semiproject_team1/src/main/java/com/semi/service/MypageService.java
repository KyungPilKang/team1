package com.semi.service;

import java.util.Map;

import com.semi.dto.Member;

public interface MypageService {
	public Map<String, String> selectTier(int mno) throws Exception;
	public Map<String, String> selectChamp(int mno) throws Exception;
	public void idLink(Member mem) throws Exception;
	public boolean codeConfirm(Member mem) throws Exception;
	public void adminConfirm(int mno) throws Exception;
}
