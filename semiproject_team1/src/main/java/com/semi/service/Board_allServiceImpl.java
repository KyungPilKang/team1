package com.semi.service;

import com.semi.dao.Article_likeDAO;
import com.semi.dao.Article_wardDAO;
import com.semi.dao.B_replyDAO;
import com.semi.dao.BoardDAO;
import com.semi.dto.B_reply;
import com.semi.dto.Board;
import com.semi.dto.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Board_allServiceImpl implements Board_allService {

    @Autowired
    BoardDAO boardDAO;

    @Autowired
    B_replyDAO b_replyDAO;

    @Autowired
    Article_likeDAO article_likeDAO;

    @Autowired
    Article_wardDAO article_wardDAO;

    @Override
    public void regBoard(Board board) throws Exception {
// Auto increment라 board_num을 안가져가도 자동으로 1씩 증가하는걸 확인 (not null 인데도 가능)
        Integer boardNum = boardDAO.selectMaxBoardNum();
        String nickName = board.getBoard_nickname();
        if (boardNum == null) boardNum = 1;
        else boardNum += 1;
        board.setBoard_nickname(nickName);
        board.setBoard_num(boardNum);
        board.setBoard_readcount(0);
        board.setBoard_likecount(0);
        board.setBoard_replycount(0);
        boardDAO.insertBoard(board);
        //게시물 테이블이 생성될 때 like,ward 테이블도 같이 생성해준다
        article_likeDAO.insertLike(boardNum);
        article_wardDAO.insertWard(boardNum);
    }

    @Override
    public List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_all();
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
        return boardDAO.selectBoardList_all(startrow);
    }

    @Override
    public List<Board> getBoardList_viewsSort(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_all();
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
        return boardDAO.selectBoardList_all_viewsSort(startrow);
    }

    @Override
    public List<Board> getBoardList_replySort(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_all();
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
        return boardDAO.selectBoardList_all_replySort(startrow);
    }

    @Override
    public List<Board> getBoardList_likeSort(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_all();
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
        return boardDAO.selectBoardList_all_likeSort(startrow);
    }

    @Override
    public List<Board> getBoardList_search_subject(int page, PageInfo pageInfo, Board board) throws Exception {
        int listCount = boardDAO.selectBoardCount_all_subject(board.getBoard_keyword());
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
        return boardDAO.selectBoardList_all_search_subject(startrow, board.getBoard_keyword());
    }

    @Override
    public List<Board> getBoardList_search_nickname(int page, PageInfo pageInfo, Board board) throws Exception {
        int listCount = boardDAO.selectBoardCount_all_nickname(board.getBoard_keyword());
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
        return boardDAO.selectBoardList_all_search_nickname(startrow, board.getBoard_keyword());
    }

    @Override
    public List<Board> getBoardList_search_content(int page, PageInfo pageInfo, Board board) throws Exception {
        int listCount = boardDAO.selectBoardCount_all_content(board.getBoard_keyword());
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
        return boardDAO.selectBoardList_all_search_content(startrow, board.getBoard_keyword());
    }

    @Override
    public Board getBoard(int boardNum) throws Exception {
        boardDAO.updateReadCount(boardNum);
        return boardDAO.selectBoard(boardNum);
    }

    @Override
    public void removeBoard(int boardNum) throws Exception {
        boardDAO.deleteBoard(boardNum);
        // 여기에 boardNum에 해당하는 좋아요, 즐찾 테이블도 같이 삭제해야함
        article_likeDAO.delete_like_boardNum(boardNum);
        article_wardDAO.delete_ward_boardNum(boardNum);
        b_replyDAO.deleteReplyWithBoard(boardNum);
        // 게시물 삭제시 댓글들도 다 삭제되도록
    }

    @Override
    public void modifyBoard(Board board) throws Exception {
        boardDAO.updateBoard(board);
    }


    /* ---------------------- 시작 : 좋아요 ---------------------- */
    @Override
    public Boolean like_check_mno(int boardNum, String mno) throws Exception {
        // 선택된 게시물에 존재하는 번호에 있는 mno들 중 가져온 mno가 존재하는지 체크
        boolean like_ok = false;
        List<String> like_member = article_likeDAO.select_article_like(boardNum);
        System.out.println("좋아요를 누른 유저의 고유번호 : " + like_member);
        if (like_member.contains(mno)) {
            like_ok = true;
        }
        return like_ok;
    }

    @Override
    public void like_ins_mno(int boardNum, String mno) throws Exception {
        article_likeDAO.insert_like_mno(boardNum, mno);
        article_likeDAO.update_like_up(boardNum);
    }

    @Override
    public void like_del_mno(int boardNum, String mno) throws Exception {
        // article_like에서 mno를 제거하는 DAO
        article_likeDAO.delete_like_mno(boardNum, mno);
        article_likeDAO.update_like_down(boardNum);
    }

    /* ----------------------- 끝 : 좋아요 ----------------------- */


    /* ---------------------- 시작 : 즐겨찾기 ---------------------- */
    @Override
    public Boolean ward_check_mno(int boardNum, String mno) throws Exception {
        boolean ward_ok = false;
        List<String> ward_member = article_wardDAO.select_article_ward(boardNum);
        System.out.println("즐겨찾기한 유저의 고유번호 : " + ward_member);
        if (ward_member.contains(mno)) {
            ward_ok = true;
        }
//        System.out.println("즐겨찾기한 유저들 중 현재 유저가 존재? " + ward_ok);
        return ward_ok;
    }

    @Override
    public void ward_ins_mno(int boardNum, String mno) throws Exception {
        article_wardDAO.insert_ward_mno(boardNum, mno);
    }

    @Override
    public void ward_del_mno(int boardNum, String mno) throws Exception {
        article_wardDAO.delete_ward_mno(boardNum, mno);
    }

    /* ----------------------- 끝 : 즐겨찾기 ----------------------- */


    /* ---------------------- 시작 : 댓글 ---------------------- */

    /* 댓글 최신순 정렬 */
    @Override
    public List<B_reply> getReplyList(int boardNum) throws Exception {
        return b_replyDAO.selectReplyList(boardNum);
    }

    @Override
    public List<B_reply> getReplyList_like(int boardNum) throws Exception {
        return b_replyDAO.selectReplyList_like(boardNum);
    }

    /* 댓글 인기순 정렬 */




    @Override
    public void regReply(B_reply b_reply) throws Exception {
        Integer b_replyNum = b_replyDAO.selectMaxReplyNum();
        if (b_replyNum == null) b_replyNum = 1;
        else b_replyNum += 1;

        b_reply.setB_reply_num(b_replyNum);
        b_reply.setB_reply_likecount(0);

        b_reply.setB_reply_ref(b_replyNum);
        b_reply.setB_reply_lev(0); // 대댓글이 아니라 lev는 0
        b_reply.setB_reply_seq(0); // 대댓글이 아니라 seq는 0
        b_reply.setB_reply_like_member("0");
        b_replyDAO.insertReply(b_reply);
        boardDAO.updateReplyCount(b_reply.getB_board_num());
    }

    @Override
    public void re_regReply(B_reply b_reply) throws Exception {
        B_reply src_reply = b_replyDAO.selectReply(b_reply.getB_reply_num());
        Integer replyNum = b_replyDAO.selectMaxReplyNum();

        b_reply.setB_reply_num(replyNum+1);
        b_reply.setB_reply_ref(src_reply.getB_reply_ref());
        b_reply.setB_reply_lev(src_reply.getB_reply_lev()+1);
        b_replyDAO.updateReplyReSeq(src_reply);
        b_reply.setB_reply_seq(src_reply.getB_reply_seq()+1);
        b_reply.setB_reply_likecount(0);
        b_reply.setB_reply_like_member("0");

        b_replyDAO.insertReply(b_reply);
        boardDAO.updateReplyCount(b_reply.getB_board_num());
    }

    @Override
    public void delReply(int b_reply_num) throws Exception {
        B_reply b_reply = b_replyDAO.selectReply(b_reply_num);
        b_replyDAO.deleteReply(b_reply_num);
        boardDAO.deleteReplyCount(b_reply.getB_board_num());
    }

    /* ----------------------- 끝 : 댓글 ----------------------- */




    /* ---------------------- 시작 : 댓글 좋아요 ---------------------- */

    // 댓글 좋아요 누른 사용자를 DB에 추가
    @Override
    public void re_like_ins_mno(int b_reply_num, String mno) throws Exception {
        b_replyDAO.re_insert_like_mno(b_reply_num, mno);
        b_replyDAO.re_update_like_up(b_reply_num);
    }

    // 댓글 좋아요 취소한 사용자를 DB에서 제거
    @Override
    public void re_like_del_mno(int b_reply_num, String mno) throws Exception {
        // 1. DB에서 해당 b_reply_num의 b_reply_like_member 문자열 값을 가져온다
        B_reply reply = b_replyDAO.selectReply(b_reply_num);
        String re_like_mem = reply.getB_reply_like_member();
        // 2. 값을 ,로 split 해서 list에 담는다
        List<String> re_like_mem_arr = new java.util.ArrayList<>(List.of(re_like_mem.split(",")));
        // 3. 받아온 mno값과 일치하는 데이터를를 list에서 제거한다
        System.out.println("mno가 제거되기 전 리스트 : "+re_like_mem_arr);
        re_like_mem_arr.remove(mno);
        // 4. list를 String으로 형변환 후 괄호 및 공백을 제거해서 변수에 넣어준다
        // (String으로 변환시 괄호가 추가되므로 필요한 작업, list<String>로 mysql에 데이터를 넘기는 방법을 모르기 때문에 임시방편으로 사용)
        String result_re_like_mem = String.valueOf(re_like_mem_arr).replace("[","").replace("]","").replace(" ","");
        System.out.println("mno가 제거된 후 리스트 : " + result_re_like_mem);
        // 5. 넣고 해당 b_reply_num의 b_reply_like_member에 update 시킨다
        b_replyDAO.re_delete_like_mno(b_reply_num, result_re_like_mem);
        b_replyDAO.re_update_like_down(b_reply_num);
    }

    /* ---------------------- 끝 : 댓글 좋아요 ---------------------- */
}
