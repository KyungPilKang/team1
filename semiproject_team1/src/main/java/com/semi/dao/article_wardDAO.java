package com.semi.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface article_wardDAO {
    void insertWard(int boardNum) throws Exception;

}
