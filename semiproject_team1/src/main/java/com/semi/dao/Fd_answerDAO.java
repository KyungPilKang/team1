package com.semi.dao;

import com.semi.dto.Fd_answer;
import com.semi.dto.Fd_reply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface Fd_answerDAO {
    List<Fd_answer> selectAnswerList(int feedbackNum) throws Exception;
    List<Fd_answer> selectAnswerList_latest(int feedbackNum) throws Exception;
    Integer selectMaxAnswerNum() throws Exception;
    void insertAnswer(Fd_answer fd_answer) throws Exception;

    void deleteAnswer(int fd_answer_num) throws Exception;
    void deleteAnswerWithFeedback(int feedbackNum) throws Exception;
    Fd_answer selectAnswer(int fd_answer_num) throws Exception;

    void fd_an_insert_like_mno(@Param("fd_answer_num") int fd_answer_num, @Param("mno") String mno) throws Exception;
    void fd_an_delete_like_mno(@Param("fd_answer_num") int fd_answer_num, @Param("fd_answer_like_member") String fd_answer_like_member) throws Exception;
    void fd_an_update_like_up(int fd_answer_num) throws Exception;
    void fd_an_update_like_down(int fd_answer_num) throws Exception;
}
