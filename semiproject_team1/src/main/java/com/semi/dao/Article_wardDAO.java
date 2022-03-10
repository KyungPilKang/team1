package com.semi.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface Article_wardDAO {
    List<String> select_article_ward(int boardNum) throws Exception;
    void insertWard(int boardNum) throws Exception;
    void insert_ward_mno(@Param("boardNum") int boardNum, @Param("mno") String mno) throws Exception;
    void delete_ward_mno(@Param("boardNum") int boardNum, @Param("mno") String mno) throws Exception;
    void delete_ward_boardNum(int boardNum) throws Exception;
}
