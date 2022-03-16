package com.semi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dao.Fd_answerDAO;
import com.semi.dao.Fd_replyDAO;
import com.semi.dao.FeedbackDAO;
import com.semi.dao.MemberDAO;
import com.semi.dto.Fd_answer;
import com.semi.dto.Fd_reply;
import com.semi.dto.Feedback;
import com.semi.dto.PageInfo;

@Service
public class FeedbackServiceImpl implements FeedbackService {

	@Autowired
	FeedbackDAO feedbackDAO;

    @Autowired
    Fd_replyDAO fd_replyDAO;

    @Autowired
    Fd_answerDAO fd_answerDAO;

    @Autowired
    MemberDAO memberDAO;
	
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
        feedback.setFeedback_answercount(0);
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
        
        Map<String, Object> paramList = new HashMap<String,Object>();
        paramList.put("startrow", startrow);
        paramList.put("feedback_keyword", feedback.getFeedback_keyword());
        
        return feedbackDAO.selectFeedbackList_search_subject(paramList);
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
        
        Map<String, Object> paramList = new HashMap<String,Object>();
        paramList.put("startrow", startrow);
        paramList.put("feedback_keyword", feedback.getFeedback_keyword());
        
        return feedbackDAO.selectFeedbackList_search_nickname(paramList);
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
        
        Map<String, Object> paramList = new HashMap<String,Object>();
        paramList.put("startrow", startrow);
        paramList.put("feedback_keyword", feedback.getFeedback_keyword());
        
        return feedbackDAO.selectFeedbackList_search_content(paramList);
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
        fd_answerDAO.deleteAnswerWithFeedback(feedbackNum);
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






    /*------------------------------------------------- 시작 : 피드백 답변 관련 -------------------------------------------------*/

    /* 기본이 고정 > 인기순 정렬 */
    @Override
    public List<Fd_answer> getAnswerList(int feedbackNum) throws Exception {
        return fd_answerDAO.selectAnswerList(feedbackNum);
    }

    /* 최신순 누를시 고정 > 최신순(date) 정렬 */
    /* controller에 별도로 ajax로 최신순을 받아오는걸 만들어줘야 한다 */
    @Override
    public List<Fd_answer> getAnswerList_latest(int feedbackNum) throws Exception {
        return fd_answerDAO.selectAnswerList_latest(feedbackNum);
    }

    /* 피드백 작성 (답변) */
    @Override
    public void regAnswer(Fd_answer fd_answer) throws Exception {
        Integer fd_answerNum = fd_answerDAO.selectMaxAnswerNum();
        System.out.println("이전:"+fd_answerNum);
        if (fd_answerNum == null) fd_answerNum = 1;
        else fd_answerNum += 1;
        System.out.println("이후:"+fd_answerNum);
        fd_answer.setFd_answer_num(fd_answerNum);
        fd_answer.setFd_answer_likecount(0);
        fd_answer.setFd_answer_like_member("0");
        fd_answer.setFd_answer_fixed("0");
        fd_answerDAO.insertAnswer(fd_answer);
        feedbackDAO.updateAnswerCount(fd_answer.getFd_feedback_num());
    }

    /* 피드백 답변 삭제 */
    @Override
    public void delAnswer(int fd_answer_num) throws Exception {
        Fd_answer fd_answer = fd_answerDAO.selectAnswer(fd_answer_num);
        fd_answerDAO.deleteAnswer(fd_answer_num);
        feedbackDAO.deleteAnswerCount(fd_answer.getFd_feedback_num());
    }

    @Override
    public void fd_an_like_ins_mno(int fd_answer_num, String mno, int feedbackNum) throws Exception {
        fd_answerDAO.fd_an_insert_like_mno(fd_answer_num,mno);
        fd_answerDAO.fd_an_update_like_up(fd_answer_num);
        // 여기에.. 피드백의 likeCount를 증가해주는 쿼리문을 넣으면 된다...
        feedbackDAO.updateLikeCount(feedbackNum);
    }

    @Override
    public void fd_an_like_del_mno(int fd_answer_num, String mno, int feedbackNum) throws Exception {
        // 1. DB에서 해당 b_reply_num의 b_reply_like_member 문자열 값을 가져온다
        Fd_answer answer = fd_answerDAO.selectAnswer(fd_answer_num);
        String an_like_mem = answer.getFd_answer_like_member();
        // 2. 값을 ,로 split 해서 list에 담는다
        List<String> an_like_mem_arr = new java.util.ArrayList<>(List.of(an_like_mem.split(",")));
        // 3. 받아온 mno값과 일치하는 데이터를를 list에서 제거한다
        System.out.println("mno가 제거되기 전 리스트 : "+an_like_mem_arr);
        an_like_mem_arr.remove(mno);
        // 4. list를 String으로 형변환 후 괄호 및 공백을 제거해서 변수에 넣어준다
        // (String으로 변환시 괄호가 추가되므로 필요한 작업, list<String>로 mysql에 데이터를 넘기는 방법을 모르기 때문에 임시방편으로 사용)
        String result_an_like_mem = String.valueOf(an_like_mem_arr).replace("[","").replace("]","").replace(" ","");
        System.out.println("mno가 제거된 후 리스트 : " + result_an_like_mem);
        // 5. 넣고 해당 b_reply_num의 b_reply_like_member에 update 시킨다
        fd_answerDAO.fd_an_delete_like_mno(fd_answer_num,result_an_like_mem);
        fd_answerDAO.fd_an_update_like_down(fd_answer_num);
        // 여기에 피드백의 likeCount를 감소시키는 쿼리문을 넣으면 된다.
        feedbackDAO.deleteLikeCount(feedbackNum);
    }

    @Override
    public void fd_an_fixed(int fd_answer_num, int feedbackNum) throws Exception {
        // 0. fixed가 1인 유저의 score를 -10 시킴
        String fixedNickName = fd_answerDAO.selectNickname_fixed(feedbackNum);
        fd_answerDAO.minusScore(fixedNickName);
        // 1. 가져온 feedbackNum에 해당하는 fd_answer의 fd_answer_fixed를 0으로 변경
        fd_answerDAO.fd_an_update_fixed_cancel(feedbackNum);
        // 2. 가져온 fd_answer_num에 해당하는 fd_answer의 fd_answer_fixed를 1로 변경
        fd_answerDAO.fd_an_update_fixed(fd_answer_num);
        // 3. 가져온 fd_answer_num의 mem_nickname에 해당하는 유저의 mem_score에 +10 해준다
        // 즉, 먼저 fd_answer_num에 해당하는 유저의 fd_answer_nickname을 찾고
        String nickName = fd_answerDAO.selectNickname_answerNum(fd_answer_num);
        // fd_answer_nickname을 memberDAO.queryMember_nickname(nickName)을 통해 member를 받아오고,
        // 그 받아온 member의 mem_score에 +10을 해준다 (DB에서)
        fd_answerDAO.plusScore(nickName);
    }

    @Override
    public void fd_an_fixed_cancel(int fd_answer_num, int feedbackNum) throws Exception {
        // 1. 가져온 feedbackNum에 해당하는 fd_answer의 fd_answer_fixed를 0으로 변경
        fd_answerDAO.fd_an_update_fixed_cancel(feedbackNum);
        // 2. 가져온 fd_answer_num의 mem_nickname에 해당하는 유저의 mem_score에 -10을 해준다
        String nickName = fd_answerDAO.selectNickname_answerNum(fd_answer_num);
        fd_answerDAO.minusScore(nickName);
    }

	@Override
	public Feedback selectFeedback_bestlike() throws Exception {
		return feedbackDAO.selectFeedback_bestlike();
	}


    /*------------------------------------------------- 끝 : 피드백 답변 관련 -------------------------------------------------*/



}
