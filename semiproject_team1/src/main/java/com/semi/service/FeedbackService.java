package com.semi.service;

import java.util.List;

import com.semi.dto.*;

public interface FeedbackService {
	void regFeedback(Feedback feedback) throws Exception;
	List<Feedback> getFeedbackList(int page, PageInfo pageInfo) throws Exception;
	List<Feedback> getFeedbackList_replySort(int page, PageInfo pageInfo) throws Exception;
	List<Feedback> getFeedbackList_viewSort(int page, PageInfo pageInfo) throws Exception;
	List<Feedback> getFeedbackList_likeSort(int page, PageInfo pageInfo) throws Exception;
	List<Feedback> getFeedbackList_search_nickname(int page, PageInfo pageInfo, Feedback feedback) throws Exception;
	List<Feedback> getFeedbackList_search_subject(int page, PageInfo pageInfo, Feedback feedback) throws Exception;
	List<Feedback> getFeedbackList_search_content(int page, PageInfo pageInfo, Feedback feedback) throws Exception;
	Feedback getFeedback(int feedbackNum) throws Exception;
	void removeFeedback(int feedbackNum) throws Exception;
	void modifyFeedback(Feedback feedback) throws Exception;

	/* 피드백 댓글 */
	List<Fd_reply> getReplyList(int feedbackNum) throws Exception;
	List<Fd_reply> getReplyList_like(int feedbackNum) throws Exception;
	void regReply(Fd_reply fd_reply) throws Exception;
	void delReply(int fd_reply_num) throws Exception;
	// 댓글 좋아요
	void fd_re_like_ins_mno(int fd_reply_num, String mno) throws Exception;
	void fd_re_like_del_mno(int fd_reply_num, String mno) throws Exception;
	/* 피드백 댓글 끝 */

	/* 피드백 답변 */
	/* 기본이 고정 > 인기순 정렬 */
	List<Fd_answer> getAnswerList(int feedbackNum) throws Exception;
	/* 최신순 누를시 고정 > 최신순(date) 정렬 */
	/* controller에 별도로 ajax로 최신순을 받아오는걸 만들어줘야 한다 */
	List<Fd_answer> getAnswerList_latest(int feedbackNum) throws Exception;
	void regAnswer(Fd_answer fd_answer) throws Exception;
	void delAnswer(int fd_answer_num) throws Exception;
	//피드백답변 좋아요
	void fd_an_like_ins_mno(int fd_reply_num, String mno, int feedbackNum) throws Exception;
	void fd_an_like_del_mno(int fd_reply_num, String mno, int feedbackNum) throws Exception;
	// 피드백 고정, 고정취소
	void fd_an_fixed(int fd_answer_num, int feedbackNum) throws Exception;
	void fd_an_fixed_cancel(int fd_answer_num, int feedbackNum) throws Exception;
	/* 피드백 답변 끝 */
	
	Feedback selectFeedback_bestlike() throws Exception;

}
