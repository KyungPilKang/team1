package com.semi.service;

import java.util.List;

import com.semi.dto.Feedback;
import com.semi.dto.PageInfo;

public interface FeedbackService {
	void regFeedback(Feedback feedback) throws Exception;
	List<Feedback> getFeedbackList(int page, PageInfo pageInfo) throws Exception;
	List<Feedback> getFeedbackList_replySort(int page, PageInfo pageInfo) throws Exception;
	List<Feedback> getFeedbackList_viewSort(int page, PageInfo pageInfo) throws Exception;
	List<Feedback> getFeedbackList_likeSort(int page, PageInfo pageInfo) throws Exception;
	List<Feedback> getFeedbackList_search_nickname(int page, PageInfo pageInfo, Feedback feedback) throws Exception;
	List<Feedback> getFeedbackList_search_subject(int page, PageInfo pageInfo, Feedback feedback) throws Exception;
	List<Feedback> getFeedbackList_content(int page, PageInfo pageInfo, Feedback feedback) throws Exception;
	Feedback getFeedback(int feedbackNum) throws Exception;
	void removeFeedback(int feedbackNum) throws Exception;
	void modifyFeedback(Feedback feedback) throws Exception;
	
	Boolean like_check_mno(int feedbackNum, String mno) throws Exception;
	void like_ins_mno(int feedbackNum, String mno) throws Exception;
	void like_del_mno(int feedbackNum, String mno) throws Exception;
	void getFeedback_likeCount(int feedbackNum) throws Exception;
	
}
