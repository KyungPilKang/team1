package com.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dao.DuoDAO;
import com.semi.dto.Duo;
import com.semi.dto.Member;

@Service
public class DuoServiceImpl implements DuoService{
	@Autowired
	DuoDAO duoDAO;

	@Override
	public void insertDuo(Duo duo, Member mem) throws Exception {
		if(mem.getMem_email_id()!=null) {
			duo.setDuo_email_id(mem.getMem_email_id());
		} else {
			duo.setDuo_email_id(mem.getMem_kakao_id());
		}
		duoDAO.insertDuo(duo);
	}

	@Override
	public void updateDuo(Duo duo) throws Exception {
		duoDAO.updateDuo(duo);
	}

	@Override
	public List<Duo> selectDuoList() throws Exception {
		return duoDAO.selectDuoList();
	}

	@Override
	public Duo selectDuo(String nickname) throws Exception {
		return duoDAO.selectDuo(nickname);
	}

}
