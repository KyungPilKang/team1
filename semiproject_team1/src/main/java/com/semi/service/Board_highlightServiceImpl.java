package com.semi.service;

import com.semi.dao.boardDAO;
import com.semi.dto.Board;
import com.semi.dto.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Board_highlightServiceImpl implements Board_highlightService {

    @Autowired
    boardDAO boardDAO;
    

    @Override
    public void regBoard(Board board) throws Exception {
        board.setBoard_nickname("mno");
        board.setBoard_readcount(0);
        board.setBoard_likecount(0);
        board.setBoard_replycount(0);
        boardDAO.insertBoard(board);
    }

    @Override
    public List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_highlight();
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        return boardDAO.selectBoardList_highlight(startrow);
    }

    @Override
    public List<Board> getBoardList_viewsSort(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_highlight();
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        return boardDAO.selectBoardList_highlight_viewsSort(startrow);
    }

    @Override
    public List<Board> getBoardList_replySort(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_highlight();
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        return boardDAO.selectBoardList_highlight_replySort(startrow);
    }

    @Override
    public List<Board> getBoardList_likeSort(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_highlight();
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        return boardDAO.selectBoardList_highlight_likeSort(startrow);
    }

    @Override
    public List<Board> getBoardList_search_subject(int page, PageInfo pageInfo, Board board) throws Exception {
        int listCount = boardDAO.selectBoardCount_highlight_subject(board.getBoard_keyword());
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        System.out.println("listCount : "+  listCount);
        return boardDAO.selectBoardList_highlight_search_subject(startrow,board.getBoard_keyword());
    }

    @Override
    public List<Board> getBoardList_search_nickname(int page, PageInfo pageInfo, Board board) throws Exception {
        int listCount = boardDAO.selectBoardCount_highlight_nickname(board.getBoard_keyword());
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        System.out.println("listCount : "+  listCount);
        return boardDAO.selectBoardList_highlight_search_nickname(startrow,board.getBoard_keyword());
    }

    @Override
    public List<Board> getBoardList_search_content(int page, PageInfo pageInfo, Board board) throws Exception {
        int listCount = boardDAO.selectBoardCount_highlight_content(board.getBoard_keyword());
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        System.out.println("listCount : "+  listCount);
        return boardDAO.selectBoardList_highlight_search_content(startrow,board.getBoard_keyword());
    }

    @Override
    public Board getBoard(int boardNum) throws Exception {
        boardDAO.updateReadCount(boardNum);
        return boardDAO.selectBoard(boardNum);
    }


}
