package com.semi.dao;

import com.semi.dto.Article_like;
import com.semi.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface article_likeDAO {
    String select_article_like(int boardNum) throws Exception;
    void insertLike(int boardNum) throws Exception;
}
