package com.semi.service;

import java.util.List;

import com.semi.dao.Fd_replyDAO;
import com.semi.dto.B_reply;
import com.semi.dto.Fd_reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dao.FeedbackDAO;
import com.semi.dto.Feedback;
import com.semi.dto.PageInfo;

@Service
public class FeedbackServiceImpl implements FeedbackService {

	@Autowired
	FeedbackDAO feedbackDAO;

    @Autowired
    Fd_replyDAO fd_replyDAO;
	
	@Override
	public void regFeedback(Feedback feedback) throws Exception {
		Integer feedbackNum = feedbackDAO.selectMaxFeedbackNum();
        String nickName = feedback.getFeedback_nickname();
		if (feedbackNum == null) feedbackNum = 1;
		else feedbackNum += 1;
		feedback.setFeedback_nickname(nickName);
		feedback.setFeedback_num(feedbackNum);
		feedback.setFeedback_readcount(0);
		feedback.setFeedback_likecount(0);
		feedback.setFeedback_replycount(0);
        // not null이라 0 넣어준다
        feedback.setFeedback_vote_member("0");
        feedback.setFeedback_vote_top(0);
        feedback.setFeedback_vote_jungle(0);
        feedback.setFeedback_vote_mid(0);
        feedback.setFeedback_vote_ad(0);
        feedback.setFeedback_vote_support(0);
		feedbackDAO.insertFeedback(feedback);
	}
	
	@Override
	public List<Feedback> getFeedbackList(int page, PageInfo pageInfo) throws Exception{
		int listCount = feedbackDAO.selectFeedbackCount();
		int maxPage = (int) Math.ceil((double) listCount / 10);
		int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > maxPage) endPage = maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		int startrow = (page - 1) * 10 + 1;
		return feedbackDAO.selectFeedbackList(startrow);
	}
	
	@Override
	public List<Feedback> getFeedbackList_viewSort(int page, PageInfo pageInfo) throws Exception {
		int listCount = feedbackDAO.selectFeedbackCount();
		int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        return feedbackDAO.selectFeedbackList_viewsSort(startrow);
	}
	
	@Override
	public List<Feedback> getFeedbackList_replySort(int page, PageInfo pageInfo) throws Exception {
		int listCount = feedbackDAO.selectFeedbackCount();
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        return feedbackDAO.selectFeedbackList_replySort(startrow);
	}
	
	@Override
	public List<Feedback> getFeedbackList_likeSort(int page, PageInfo pageInfo) throws Exception {
		int listCount = feedbackDAO.selectFeedbackCount();
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        return feedbackDAO.selectFeedbackList_likeSort(startrow);
	}
	
	@Override
	public List<Feedback> getFeedbackList_search_subject(int page, PageInfo pageInfo, Feedback feedback) throws Exception {
        System.out.println("야야"+feedback.getFeedback_keyword());
		int listCount = feedbackDAO.selectFeedbackCount_subject(feedback.getFeedback_keyword());
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        System.out.println("1번 listCount : " + listCount);
        return feedbackDAO.selectFeedbackList_search_subject(startrow, feedback.getFeedback_keyword());
	}
	
    @Override
    public List<Feedback> getFeedbackList_search_nickname(int page, PageInfo pageInfo, Feedback feedback) throws Exception {
        System.out.println("야야"+feedback.getFeedback_keyword());
        int listCount = feedbackDAO.selectFeedbackCount_nickname(feedback.getFeedback_keyword());
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        System.out.println("2번 listCount : " + listCount);
        return feedbackDAO.selectFeedbackList_search_nickname(startrow, feedback.getFeedback_keyword());
    }
    
    @Override
    public List<Feedback> getFeedbackList_search_content(int page, PageInfo pageInfo, Feedback feedback) throws Exception {
        System.out.println("야야"+feedback.getFeedback_keyword());
        int listCount = feedbackDAO.selectFeedbackCount_content(feedback.getFeedback_keyword());
        int maxPage = (int) Math.ceil((double) listCount / 10);
        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;
        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
        System.out.println("3번 listCount : " + listCount);
        return feedbackDAO.selectFeedbackList_search_content(startrow, feedback.getFeedback_keyword());
    }
    
    @Override
    public Feedback getFeedback(int feedbackNum) throws Exception {
    	feedbackDAO.updateReadCount(feedbackNum);
    	return feedbackDAO.selectFeedback(feedbackNum);
    }
    
    @Override
    public void removeFeedback(int feedbackNum) throws Exception {
    	feedbackDAO.deleteFeedback(feedbackNum);
        fd_replyDAO.deleteReplyWithFeedback(feedbackNum);
    }
    
    @Override
    public void modifyFeedback(Feedback feedback) throws Exception {
    	feedbackDAO.updateFeedback(feedback);
    }

    @Override
    public List<Fd_reply> getReplyList(int feedbackNum) throws Exception {
        return fd_replyDAO.selectReplyList(feedbackNum);
    }

    @Override
    public List<Fd_reply> getReplyList_like(int feedbackNum) throws Exception {
        return fd_replyDAO.selectReplyList_like(feedbackNum);
    }

    @Override
    public void regReply(Fd_reply fd_reply) throws Exception {
        Integer fd_replyNum = fd_replyDAO.selectMaxReplyNum();
        System.out.println("이전:"+fd_replyNum);
        if (fd_replyNum == null) fd_replyNum = 1;
        else fd_replyNum += 1;
        System.out.println("이후:"+fd_replyNum);
        fd_reply.setFd_reply_num(fd_replyNum);
        fd_reply.setFd_reply_likecount(0);
        fd_reply.setFd_reply_like_member("0");
        fd_replyDAO.insertReply(fd_reply);
        feedbackDAO.updateReplyCount(fd_reply.getFd_feedback_num());
    }

    @Override
    public void delReply(int fd_reply_num) throws Exception {
        Fd_reply fd_reply = fd_replyDAO.selectReply(fd_reply_num);
        fd_replyDAO.deleteReply(fd_reply_num);
        feedbackDAO.deleteReplyCount(fd_reply.getFd_feedback_num());
    }

    // 댓글 좋아요 누른 사용자를 DB에 추가
    @Override
    public void fd_re_like_ins_mno(int fd_reply_num, String mno) throws Exception {
        fd_replyDAO.fd_re_insert_like_mno(fd_reply_num,mno);
        fd_replyDAO.fd_re_update_like_up(fd_reply_num);
    }

    // 댓글 좋아요 취소한 사용자를 DB에서 제거
    @Override
    public void fd_re_like_del_mno(int fd_reply_num, String mno) throws Exception {
        // 1. DB에서 해당 b_reply_num의 b_reply_like_member 문자열 값을 가져온다
        Fd_reply reply = fd_replyDAO.selectReply(fd_reply_num);
        String re_like_mem = reply.getFd_reply_like_member();
        // 2. 값을 ,로 split 해서 list에 담는다
        List<String> re_like_mem_arr = new java.util.ArrayList<>(List.of(re_like_mem.split(",")));
        // 3. 받아온 mno값과 일치하는 데이터를를 list에서 제거한다
        System.out.println("mno가 제거되기 전 리스트 : "+re_like_mem_arr);
        re_like_mem_arr.remove(mno);
        // 4. list를 String으로 형변환 후 괄호 및 공백을 제거해서 변수에 넣어준다
        // (String으로 변환시 괄호가 추가되므로 필요한 작업, list<String>로 mysql에 데이터를 넘기는 방법을 모르기 때문에 임시방편으로 사용)
        String result_re_like_mem = String.valueOf(re_like_mem_arr).replace("[","").replace("]","").replace(" ","");
        System.out.println("mno가 제거된 후 리스트 : " + result_re_like_mem);
        // 5. 넣고 해당 b_reply_num의 b_reply_like_member에 update 시킨다
        fd_replyDAO.fd_re_delete_like_mno(fd_reply_num,result_re_like_mem);
        fd_replyDAO.fd_re_update_like_down(fd_reply_num);
    }

}
