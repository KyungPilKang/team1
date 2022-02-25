package com.semi.dao;

import com.semi.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface boardDAO {
    void insertBoard(Board board) throws Exception;
    Integer selectMaxBoardNum() throws Exception;
    int selectBoardCount() throws Exception;
    List<Board> selectBoardList(int startrow) throws Exception;

    Board selectBoard(int boardNum) throws Exception;
    void updateReadCount(int boardNum) throws Exception;
}
