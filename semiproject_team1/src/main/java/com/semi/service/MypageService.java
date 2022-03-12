package com.semi.service;

import java.util.Map;

public interface MypageService {
	public Map<String, String> selectTier(int mno) throws Exception;
	public Map<String, String> selectChamp(int mno) throws Exception;
}
