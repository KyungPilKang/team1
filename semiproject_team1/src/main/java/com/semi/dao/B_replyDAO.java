package com.semi.dao;

import com.semi.dto.B_reply;
import com.semi.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface B_replyDAO {
    List<B_reply> selectReplyList(int boardNum) throws Exception;
    List<B_reply> selectReplyList_like(int boardNum) throws Exception;
    Integer selectMaxReplyNum() throws Exception;

    void insertReply(B_reply b_reply) throws Exception;
    void updateReplyReSeq(B_reply b_reply) throws Exception;

    void deleteReply(int b_reply_num) throws Exception;
    void deleteReplyWithBoard(int boardNum) throws Exception;
    B_reply selectReply(int b_reply_num) throws Exception;

    void re_insert_like_mno(@Param("b_reply_num") int b_reply_num, @Param("mno") String mno) throws Exception;
    void re_delete_like_mno(@Param("b_reply_num") int b_reply_num, @Param("b_reply_like_member") String b_reply_like_member) throws Exception;
    void re_update_like_up(int b_reply_num) throws Exception;
    void re_update_like_down(int b_reply_num) throws Exception;
}
