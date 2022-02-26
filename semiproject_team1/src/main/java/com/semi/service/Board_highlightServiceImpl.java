package com.semi.service;

import org.springframework.stereotype.Service;

@Service
public class Board_highlightServiceImpl implements Board_highlightService {

<<<<<<< HEAD
=======
    @Autowired
    boardDAO boardDAO;

    @Override
    public void regBoard(Board board) throws Exception {
        Integer boardNum = boardDAO.selectMaxBoardNum();
        if (boardNum == null) boardNum = 1;
        else boardNum += 1;
        board.setBoard_num(boardNum);
        board.setBoard_readcount(0);
        boardDAO.insertBoard(board);
    }

    @Override
    public List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount();
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
        return boardDAO.selectBoardList(startrow);
    }

    @Override
    public Board getBoard(int boardNum) throws Exception {
        boardDAO.updateReadCount(boardNum);
        return boardDAO.selectBoard(boardNum);
    }


>>>>>>> parent of d4d2bfa (PJS/추가 : boardwriteForm.jsp 추가)
}
