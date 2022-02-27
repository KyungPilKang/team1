package com.semi.service;

import com.semi.dto.Board;
import com.semi.dto.PageInfo;

import java.util.List;

public interface Board_allService {
    void regBoard(Board board) throws Exception;
    List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_viewsSort(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_replySort(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_likeSort(int page, PageInfo pageInfo) throws Exception;
    Board getBoard(int boardNum) throws Exception;
}
