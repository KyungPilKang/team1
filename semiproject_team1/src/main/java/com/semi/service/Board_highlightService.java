package com.semi.service;

import com.semi.dto.Board;
import com.semi.dto.PageInfo;

import java.util.List;

public interface Board_highlightService {
    void regBoard(Board board) throws Exception;
    List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception;
    Board getBoard(int boardNum) throws Exception;
}
