package com.semi.dao;

import com.semi.dto.B_reply;
import com.semi.dto.Board;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface b_replyDAO {
//    int selectReplyCount() throws Exception;
//    List<B_reply> selectReplyList_all(int startrow) throws Exception;
    List<B_reply> selectReplyList() throws Exception;
}
