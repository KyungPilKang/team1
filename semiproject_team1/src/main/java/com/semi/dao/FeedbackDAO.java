package com.semi.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.semi.dto.Feedback;

@Mapper
@Repository
public interface FeedbackDAO {
	
	void insertFeedback(Feedback feedback) throws Exception;
	void deleteFeedback(int feedbackNum) throws Exception;
	void updateFeedback(Feedback feedback) throws Exception;
	Integer selectMaxFeedbackNum() throws Exception;
	
	int selectFeedbackCount() throws Exception;
	int selectFeedbackCount_subject(String feedback_keyword) throws Exception;
	int selectFeedbackCount_nickname(String feedback_keyword) throws Exception;
	int selectFeedbackCount_content(String feedback_keyword) throws Exception;
	
	List<Feedback> selectFeedbackList(int startrow) throws Exception;
	List<Feedback> selectFeedbackList_replySort(int startrow) throws Exception;
	List<Feedback> selectFeedbackList_viewsSort(int startrow) throws Exception;
	List<Feedback> selectFeedbackList_likeSort(int startrow) throws Exception;
	List<Feedback> selectFeedbackList_search_subject(Map<String, Object> paramList) throws Exception;
	List<Feedback> selectFeedbackList_search_nickname(Map<String, Object> paramList) throws Exception;
	List<Feedback> selectFeedbackList_search_content(Map<String, Object> paramList) throws Exception;
	
	Feedback selectFeedback(int feedbackNum) throws Exception;
	void updateReadCount(int feedbackNum) throws Exception;
	void updateReplyCount(int feedbackNum) throws Exception;
	void deleteReplyCount(int feedbackNum) throws Exception;
	void updateAnswerCount(int feedbackNum) throws Exception;
	void deleteAnswerCount(int feedbackNum) throws Exception;
	void updateLikeCount(int feedbackNum) throws Exception;
	void deleteLikeCount(int feedbackNum) throws Exception;
	
	Feedback selectFeedback_bestlike() throws Exception;
}
