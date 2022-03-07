package com.semi.dao;

import com.semi.dto.B_reply;
import com.semi.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface b_replyDAO {
    List<B_reply> selectReplyList(int boardNum) throws Exception;
    Integer selectMaxReplyNum() throws Exception;
    void insertReply(B_reply b_reply) throws Exception;
    void deleteReply(int b_reply_num) throws Exception;
    B_reply selectReply(int b_reply_num) throws Exception;
    void updateReplyReSeq(B_reply b_reply) throws Exception;
}
