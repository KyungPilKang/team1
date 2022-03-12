package com.semi.dao;

import com.semi.dto.Article_like;
import com.semi.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface Article_likeDAO {
    List<String> select_article_like(int boardNum) throws Exception;
    void insertLike(int boardNum) throws Exception;
    void insert_like_mno(@Param("boardNum") int boardNum, @Param("mno") String mno) throws Exception;
    void delete_like_mno(@Param("boardNum") int boardNum, @Param("mno") String mno) throws Exception;
    void update_like_up(int boardNum) throws Exception;
    void update_like_down(int boardNum) throws Exception;
    int board_like_count(int boardNum) throws Exception;
    void delete_like_boardNum(int boardNum) throws Exception;
}
