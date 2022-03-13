package com.semi.service;

import java.util.List;

import com.semi.dto.Duo;
import com.semi.dto.Member;

public interface DuoService {
	public void insertDuo(Duo duo, Member mem) throws Exception;
	public void updateDuo(Duo duo) throws Exception;
	public List<Duo> selectDuoList() throws Exception;
	public Duo selectDuo(String nickname) throws Exception;
}
