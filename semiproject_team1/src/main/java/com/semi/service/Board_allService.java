package com.semi.service;

import com.semi.dto.B_reply;
import com.semi.dto.Board;
import com.semi.dto.PageInfo;

import java.util.List;

public interface Board_allService {
    void regBoard(Board board) throws Exception;
    List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_viewsSort(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_replySort(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_likeSort(int page, PageInfo pageInfo) throws Exception;
    List<Board> getBoardList_search_subject(int page, PageInfo pageInfo, Board board) throws Exception;
    List<Board> getBoardList_search_nickname(int page, PageInfo pageInfo, Board board) throws Exception;
    List<Board> getBoardList_search_content(int page, PageInfo pageInfo, Board board) throws Exception;
    Board getBoard(int boardNum) throws Exception;
    void removeBoard(int boardNum) throws Exception;
    void modifyBoard(Board board) throws Exception;

    /* ---------------------- 시작 : 좋아요 ---------------------- */
    Boolean like_check_mno(int boardNum, String mno) throws Exception;
    void like_ins_mno(int boardNum, String mno) throws Exception;
    void like_del_mno(int boardNum, String mno) throws Exception;

    /* ----------------------- 끝 : 좋아요 ----------------------- */

    /* ---------------------- 시작 : 즐겨찾기 ---------------------- */
    Boolean ward_check_mno(int boardNum, String mno) throws Exception;
    void ward_ins_mno(int boardNum, String mno) throws Exception;
    void ward_del_mno(int boardNum, String mno) throws Exception;
    /* ----------------------- 끝 : 즐겨찾기 ----------------------- */


    List<B_reply> getReplyList(int boardNum) throws Exception;
    List<B_reply> getReplyList_like(int boardNum) throws Exception;
    void regReply(B_reply b_reply) throws Exception;
    void delReply(int b_reply_num) throws Exception;
    void re_regReply(B_reply b_reply) throws Exception;

    void re_like_ins_mno(int b_reply_num, String mno) throws Exception;
    void re_like_del_mno(int b_reply_num, String mno) throws Exception;
}
