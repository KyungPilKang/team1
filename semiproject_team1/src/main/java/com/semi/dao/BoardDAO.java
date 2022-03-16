package com.semi.dao;

import com.semi.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BoardDAO {
    void insertBoard(Board board) throws Exception;
    void deleteBoard(int boardNum) throws Exception;
    void updateBoard(Board board) throws Exception;
    Integer selectMaxBoardNum() throws Exception;

    int selectBoardCount_all() throws Exception;
    int selectBoardCount_all_subject(String board_keyword) throws Exception;
    int selectBoardCount_all_nickname(String board_keyword) throws Exception;
    int selectBoardCount_all_content(String board_keyword) throws Exception;

    int selectBoardCount_highlight() throws Exception;
    int selectBoardCount_highlight_subject(String board_keyword) throws Exception;
    int selectBoardCount_highlight_nickname(String board_keyword) throws Exception;
    int selectBoardCount_highlight_content(String board_keyword) throws Exception;

    int selectBoardCount_tip() throws Exception;
    int selectBoardCount_tip_subject(String board_keyword) throws Exception;
    int selectBoardCount_tip_nickname(String board_keyword) throws Exception;
    int selectBoardCount_tip_content(String board_keyword) throws Exception;

    int selectBoardCount_normal() throws Exception;
    int selectBoardCount_normal_subject(String board_keyword) throws Exception;
    int selectBoardCount_normal_nickname(String board_keyword) throws Exception;
    int selectBoardCount_normal_content(String board_keyword) throws Exception;

    List<Board> selectBoardList_all(int startrow) throws Exception;
    List<Board> selectBoardList_all_viewsSort(int startrow) throws Exception;
    List<Board> selectBoardList_all_replySort(int startrow) throws Exception;
    List<Board> selectBoardList_all_likeSort(int startrow) throws Exception;
    List<Board> selectBoardList_all_search_subject(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;
    List<Board> selectBoardList_all_search_nickname(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;
    List<Board> selectBoardList_all_search_content(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;

    List<Board> selectBoardList_highlight(int startrow) throws Exception;
    List<Board> selectBoardList_highlight_replySort(int startrow) throws Exception;
    List<Board> selectBoardList_highlight_likeSort(int startrow) throws Exception;
    List<Board> selectBoardList_highlight_viewsSort(int startrow) throws Exception;
    List<Board> selectBoardList_highlight_search_subject(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;
    List<Board> selectBoardList_highlight_search_nickname(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;
    List<Board> selectBoardList_highlight_search_content(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;

    List<Board> selectBoardList_tip(int startrow) throws Exception;
    List<Board> selectBoardList_tip_replySort(int startrow) throws Exception;
    List<Board> selectBoardList_tip_likeSort(int startrow) throws Exception;
    List<Board> selectBoardList_tip_viewsSort(int startrow) throws Exception;
    List<Board> selectBoardList_tip_search_subject(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;
    List<Board> selectBoardList_tip_search_nickname(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;
    List<Board> selectBoardList_tip_search_content(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;

    List<Board> selectBoardList_normal(int startrow) throws Exception;
    List<Board> selectBoardList_normal_replySort(int startrow) throws Exception;
    List<Board> selectBoardList_normal_likeSort(int startrow) throws Exception;
    List<Board> selectBoardList_normal_viewsSort(int startrow) throws Exception;
    List<Board> selectBoardList_normal_search_subject(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;
    List<Board> selectBoardList_normal_search_nickname(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;
    List<Board> selectBoardList_normal_search_content(@Param("startrow") int startrow,@Param("board_keyword")String board_keyword) throws Exception;

    Board selectBoard(int boardNum) throws Exception;
    void updateReadCount(int boardNum) throws Exception;
//    void updateBoardLike(int boardNum, int board_likecount) throws Exception;
    void updateReplyCount(int b_board_num) throws Exception;
    void deleteReplyCount(int b_board_num) throws Exception;
//    int selectBoard_likeCount(int boardNum) throws Exception;
}
