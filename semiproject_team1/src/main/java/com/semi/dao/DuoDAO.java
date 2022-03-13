package com.semi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semi.dto.Duo;

@Mapper
@Repository("duoDAO")
public interface DuoDAO {
	public void insertDuo(Duo duo) throws Exception;
	public void updateDuo(Duo duo) throws Exception;
	public List<Duo> selectDuoList() throws Exception;
	public Duo selectDuo(String nickname) throws Exception;
}
 