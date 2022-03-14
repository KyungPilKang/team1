package com.semi.service;

import com.semi.dto.Board;
import com.semi.dto.PageInfo;

import java.util.List;

public interface Board_highlightService {
    List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_viewsSort(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_replySort(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_likeSort(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_search_subject(int page, PageInfo pageInfo, Board board) throws Exception;
    List<Board> getBoardList_search_nickname(int page, PageInfo pageInfo, Board board) throws Exception;
    List<Board> getBoardList_search_content(int page, PageInfo pageInfo, Board board) throws Exception;
    Board getBoard(int boardNum) throws Exception;
}
