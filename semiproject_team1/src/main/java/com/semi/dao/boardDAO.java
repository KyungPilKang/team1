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
    int selectBoardCount_all() throws Exception;
    int selectBoardCount_highlight() throws Exception;
    int selectBoardCount_tip() throws Exception;
    int selectBoardCount_normal() throws Exception;

    List<Board> selectBoardList_all(int startrow) throws Exception;
    List<Board> selectBoardList_all_replySort(int startrow) throws Exception;
    List<Board> selectBoardList_all_likeSort(int startrow) throws Exception;
    List<Board> selectBoardList_all_viewsSort(int startrow) throws Exception;

    List<Board> selectBoardList_highlight(int startrow) throws Exception;
    List<Board> selectBoardList_highlight_replySort(int startrow) throws Exception;
    List<Board> selectBoardList_highlight_likeSort(int startrow) throws Exception;
    List<Board> selectBoardList_highlight_viewsSort(int startrow) throws Exception;

    List<Board> selectBoardList_tip(int startrow) throws Exception;
    List<Board> selectBoardList_tip_replySort(int startrow) throws Exception;
    List<Board> selectBoardList_tip_likeSort(int startrow) throws Exception;
    List<Board> selectBoardList_tip_viewsSort(int startrow) throws Exception;


    List<Board> selectBoardList_normal(int startrow) throws Exception;
    List<Board> selectBoardList_normal_replySort(int startrow) throws Exception;
    List<Board> selectBoardList_normal_likeSort(int startrow) throws Exception;
    List<Board> selectBoardList_normal_viewsSort(int startrow) throws Exception;

    Board selectBoard(int boardNum) throws Exception;
    void updateReadCount(int boardNum) throws Exception;
}
