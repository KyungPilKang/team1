package com.semi.dao;

import com.semi.dto.B_reply;
import com.semi.dto.Fd_reply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface Fd_replyDAO {
    List<Fd_reply> selectReplyList(int feedbackNum) throws Exception;
    List<Fd_reply> selectReplyList_like(int feedbackNum) throws Exception;
    Integer selectMaxReplyNum() throws Exception;
    void insertReply(Fd_reply fd_reply) throws Exception;

    void deleteReply(int fd_reply_num) throws Exception;
    void deleteReplyWithFeedback(int feedbackNum) throws Exception;
    Fd_reply selectReply(int fd_reply_num) throws Exception;

    void fd_re_insert_like_mno(@Param("fd_reply_num") int fd_reply_num, @Param("mno") String mno) throws Exception;
    void fd_re_delete_like_mno(@Param("fd_reply_num") int fd_reply_num, @Param("fd_reply_like_member") String fd_reply_like_member) throws Exception;
    void fd_re_update_like_up(int fd_reply_num) throws Exception;
    void fd_re_update_like_down(int fd_reply_num) throws Exception;
}
