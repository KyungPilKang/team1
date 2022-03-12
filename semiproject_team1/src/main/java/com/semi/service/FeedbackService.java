package com.semi.service;

import java.util.List;

import com.semi.dto.B_reply;
import com.semi.dto.Fd_reply;
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

//	List<Fd_reply> getReplyList(int feedbackNum) throws Exception;
//	List<Fd_reply> getReplyList_like(int feedbackNum) throws Exception;
//	void regReply(Fd_reply fd_reply) throws Exception;
//	void delReply(int fd_reply_num) throws Exception;

}
