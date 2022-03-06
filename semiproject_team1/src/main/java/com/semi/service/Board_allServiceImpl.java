package com.semi.service;

import com.semi.dao.article_likeDAO;
import com.semi.dao.article_wardDAO;
import com.semi.dao.b_replyDAO;
import com.semi.dao.boardDAO;
import com.semi.dto.B_reply;
import com.semi.dto.Board;
import com.semi.dto.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Board_allServiceImpl implements Board_allService {

    @Autowired
    boardDAO boardDAO;

    @Autowired
    b_replyDAO b_replyDAO;

    @Autowired
    article_likeDAO article_likeDAO;

    @Autowired
    article_wardDAO article_wardDAO;

    @Override
    public void regBoard(Board board) throws Exception {
// Auto increment라 board_num을 안가져가도 자동으로 1씩 증가하는걸 확인 (not null 인데도 가능)
        Integer boardNum = boardDAO.selectMaxBoardNum();
        if (boardNum == null) boardNum = 1;
        else boardNum += 1;
        //db에서 not null이라 임시로 닉네임 가져간다
        board.setBoard_nickname("mno");
        board.setBoard_num(boardNum);
        board.setBoard_readcount(0);
        board.setBoard_likecount(0);
        board.setBoard_replycount(0);
        boardDAO.insertBoard(board);
        //게시물 테이블이 생성될 때 like,ward 테이블도 같이 생성해준다
        article_likeDAO.insertLike(boardNum);
        article_wardDAO.insertWard(boardNum);
    }

    @Override
    public List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_all();
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
        return boardDAO.selectBoardList_all(startrow);
    }

    @Override
    public List<Board> getBoardList_viewsSort(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_all();
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
        return boardDAO.selectBoardList_all_viewsSort(startrow);
    }

    @Override
    public List<Board> getBoardList_replySort(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_all();
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
        return boardDAO.selectBoardList_all_replySort(startrow);
    }

    @Override
    public List<Board> getBoardList_likeSort(int page, PageInfo pageInfo) throws Exception {
        int listCount = boardDAO.selectBoardCount_all();
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
        return boardDAO.selectBoardList_all_likeSort(startrow);
    }

    @Override
    public List<Board> getBoardList_search_subject(int page, PageInfo pageInfo, Board board) throws Exception {
        int listCount = boardDAO.selectBoardCount_all_subject(board.getBoard_keyword());
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
        return boardDAO.selectBoardList_all_search_subject(startrow, board.getBoard_keyword());
    }

    @Override
    public List<Board> getBoardList_search_nickname(int page, PageInfo pageInfo, Board board) throws Exception {
        int listCount = boardDAO.selectBoardCount_all_nickname(board.getBoard_keyword());
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
        return boardDAO.selectBoardList_all_search_nickname(startrow, board.getBoard_keyword());
    }

    @Override
    public List<Board> getBoardList_search_content(int page, PageInfo pageInfo, Board board) throws Exception {
        int listCount = boardDAO.selectBoardCount_all_content(board.getBoard_keyword());
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
        return boardDAO.selectBoardList_all_search_content(startrow, board.getBoard_keyword());
    }

    @Override
    public Board getBoard(int boardNum) throws Exception {
        boardDAO.updateReadCount(boardNum);
        return boardDAO.selectBoard(boardNum);
    }

    @Override
    public void removeBoard(int boardNum) throws Exception {
        boardDAO.deleteBoard(boardNum);
        // 여기에 boardNum에 해당하는 좋아요, 즐찾 테이블도 같이 삭제해야함
        article_likeDAO.delete_like_boardNum(boardNum);
        article_wardDAO.delete_ward_boardNum(boardNum);
    }

    @Override
    public void modifyBoard(Board board) throws Exception {
        boardDAO.updateBoard(board);
    }


    /* ---------------------- 시작 : 좋아요 ---------------------- */
    @Override
    public Boolean like_check_mno(int boardNum, String mno) throws Exception {
        // 선택된 게시물에 존재하는 번호에 있는 mno들 중 가져온 mno가 존재하는지 체크
        boolean like_ok = false;
        List<String> like_member = article_likeDAO.select_article_like(boardNum);
        System.out.println("좋아요를 누른 유저의 고유번호 : " + like_member);
        if (like_member.contains(mno)) {
            like_ok = true;
        }
        System.out.println("좋아요를 누른 유저들 중 현재 유저가 존재? " + like_ok);
        return like_ok;
    }

    @Override
    public void like_ins_mno(int boardNum, String mno) throws Exception {
        article_likeDAO.insert_like_mno(boardNum, mno);
        article_likeDAO.update_like_up(boardNum);
    }

    @Override
    public void like_del_mno(int boardNum, String mno) throws Exception {
        // article_like에서 mno를 제거하는 DAO
        article_likeDAO.delete_like_mno(boardNum, mno);
        article_likeDAO.update_like_down(boardNum);
    }

    @Override
    public void setBoard_likeCount(int boardNum) throws Exception {
        /* DB에 article_like의 mno가 not null이라 생성시 0을 무조건 넣어주므로 -1 해준다 */
        int board_likecount = article_likeDAO.board_like_count(boardNum) - 1;
        System.out.println("serviceImpl의 board_likecount : " + board_likecount);
        boardDAO.updateBoardLike(boardNum, board_likecount);
    }
    /* ----------------------- 끝 : 좋아요 ----------------------- */


    /* ---------------------- 시작 : 즐겨찾기 ---------------------- */
    @Override
    public Boolean ward_check_mno(int boardNum, String mno) throws Exception {
        boolean ward_ok = false;
        List<String> ward_member = article_wardDAO.select_article_ward(boardNum);
        System.out.println("즐겨찾기한 유저의 고유번호 : " + ward_member);
        if (ward_member.contains(mno)) {
            ward_ok = true;
        }
        System.out.println("즐겨찾기한 유저들 중 현재 유저가 존재? " + ward_ok);
        return ward_ok;
    }

    @Override
    public void ward_ins_mno(int boardNum, String mno) throws Exception {
        article_wardDAO.insert_ward_mno(boardNum, mno);
    }

    @Override
    public void ward_del_mno(int boardNum, String mno) throws Exception {
        article_wardDAO.delete_ward_mno(boardNum, mno);
    }

    /* ----------------------- 끝 : 즐겨찾기 ----------------------- */


    /* ---------------------- 시작 : 댓글 ---------------------- */
    @Override
    public List<B_reply> getReplyList(int boardNum) throws Exception {
        return b_replyDAO.selectReplyList(boardNum);
    }

    @Override
    public void regReply(B_reply b_reply) throws Exception {
        Integer b_replyNum = b_replyDAO.selectMaxReplyNum();
        if (b_replyNum == null) b_replyNum = 1;
        else b_replyNum += 1;
        //db에서 not null이라 임시로 닉네임 가져간다
        b_reply.setB_reply_nickname("세션nick");
        b_reply.setB_reply_num(b_replyNum);
        b_reply.setB_reply_likecount(0);

        b_reply.setB_reply_ref(b_replyNum);
        b_reply.setB_reply_lev(0); // 대댓글이 아니라 lev는 0
        b_reply.setB_reply_seq(0); // 대댓글이 아니라 seq는 0
//        b_reply.setB_reply_like_member("0");
        b_replyDAO.insertReply(b_reply);
        boardDAO.updateReplyCount(b_reply.getB_board_num());
    }

    @Override
    public void delReply(int b_reply_num) throws Exception {
        B_reply b_reply = b_replyDAO.selectReply(b_reply_num);
        b_replyDAO.deleteReply(b_reply_num);
        boardDAO.deleteReplyCount(b_reply.getB_board_num());
    }



//    @Override
//    public String getReplyList_json(int page, PageInfo pageInfo) throws Exception {
//        int listCount = b_replyDAO.selectReplyCount();
//        int maxPage = (int) Math.ceil((double) listCount / 10);
//        int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
//        int endPage = startPage + 10 - 1;
//        if (endPage > maxPage) endPage = maxPage;
//        pageInfo.setStartPage(startPage);
//        pageInfo.setEndPage(endPage);
//        pageInfo.setMaxPage(maxPage);
//        pageInfo.setPage(page);
//        pageInfo.setListCount(listCount);
//        int startrow = (page - 1) * 10 + 1;
//
//        List<B_reply> reList = b_replyDAO.selectReplyList_all(startrow);
//        JSONObject totalObject=new JSONObject();
//        JSONArray replysArray=new JSONArray();
//        for(B_reply re:reList){
//            JSONObject reply = new JSONObject();
//            reply.put("b_reply_num",re.getB_reply_num());
//            reply.put("b_reply_nickname",re.getB_reply_nickname());
//            reply.put("b_board_num",re.getB_board_num());
//            reply.put("b_reply_content",re.getB_reply_content());
//            reply.put("b_reply_ref",re.getB_reply_ref());
//            reply.put("b_reply_lev",re.getB_reply_lev());
//            reply.put("b_reply_seq",re.getB_reply_seq());
//            // 여기서 날짜 형식을 변경해줘야 컨트롤러에서 response시 날짜가 정상적인 json데이터로 넘어간다
//            // 이유는 모르겠지만 바로 put하면 {"date":2022 KST 11} 같이 따옴표 없이 넘어가서 파싱시 오류뜸
//            Date date = re.getB_reply_date();
//            SimpleDateFormat b_date = new SimpleDateFormat("yyyy년 M월 d일 E요일 a H:mm");
//            reply.put("b_reply_date",b_date.format(date));
//            reply.put("b_reply_likecount",re.getB_reply_likecount());
//            reply.put("b_reply_like_member",re.getB_reply_like_member());
//            reply.put("b_reply_edit_controll",re.getB_reply_edit_controll());
//            replysArray.add(reply);
//        }
//        totalObject.put("replys",replysArray);
//        return totalObject.toJSONString();
//    }


    /* ----------------------- 끝 : 댓글 ----------------------- */


}
