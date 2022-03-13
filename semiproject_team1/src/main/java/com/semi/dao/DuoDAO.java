package com.semi.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semi.dto.Duo;

@Mapper
@Repository("duoDAO")
public interface DuoDAO {
	public void insertDuo(Duo duo) throws Exception;
}
