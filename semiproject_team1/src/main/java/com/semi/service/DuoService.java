package com.semi.service;

import com.semi.dto.Duo;
import com.semi.dto.Member;

public interface DuoService {
	public void insertDuo(Duo duo, Member mem) throws Exception;
}
