package com.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dao.FeedbackDAO;
import com.semi.dto.Feedback;
import com.semi.dto.PageInfo;

@Service
public class FeedbackServiceImpl implements FeedbackService {

	@Autowired
	FeedbackDAO feedbackDAO;
	
	@Override
	public void regFeedback(Feedback feedback) throws Exception {
		Integer feedbackNum = feedbackDAO.selectMaxFeedbackNum();
		if (feedbackNum == null) feedbackNum = 1;
		else feedbackNum += 1;
		
		feedback.setFeedback_nickname("mno");
		feedback.setFeedback_num(feedbackNum);
		feedback.setFeedback_readcount(0);
		feedback.setFeedback_likecount(0);
		feedback.setFeedback_replycount(0);
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
        System.out.println("listCount : " + listCount);
        return feedbackDAO.selectFeedbackList_search_subject(startrow, feedback.getFeedback_keyword());
	}
	
    @Override
    public List<Feedback> getFeedbackList_search_nickname(int page, PageInfo pageInfo, Feedback feedback) throws Exception {
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
        System.out.println("listCount : " + listCount);
        return feedbackDAO.selectFeedbackList_search_nickname(startrow, feedback.getFeedback_keyword());
    }
    
    @Override
    public List<Feedback> getFeedbackList_content(int page, PageInfo pageInfo, Feedback feedback) throws Exception {
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
        System.out.println("listCount : " + listCount);
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
    }
    
    @Override
    public void modifyFeedback(Feedback feedback) throws Exception {
    	feedbackDAO.updateFeedback(feedback);
    }

	@Override
	public Boolean like_check_mno(int feedbackNum, String mno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void like_ins_mno(int feedbackNum, String mno) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void like_del_mno(int feedbackNum, String mno) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getFeedback_likeCount(int feedbackNum) throws Exception {
		// TODO Auto-generated method stub
		
	}
    
}
