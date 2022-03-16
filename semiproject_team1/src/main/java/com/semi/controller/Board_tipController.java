package com.semi.controller;

import com.semi.dto.Board;
import com.semi.dto.PageInfo;
import com.semi.service.Board_highlightService;
import com.semi.service.Board_tipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

@Controller
public class Board_tipController {


    @Autowired
    private Board_tipService board_tipService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    HttpSession session;



    @GetMapping(value="board_tip_search")
    public ModelAndView board_tip_search(@ModelAttribute Board board,
                                     @RequestParam(value = "page", defaultValue = "1") int page) {

        System.out.println(board.getBoard_keyword());
        System.out.println(board.getBoard_type());

        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            String type = board.getBoard_type();
            switch (type) {
                case "1": {
                    List<Board> articleList = board_tipService.getBoardList_search_subject(page, pageInfo, board);
                    mv.addObject("articleList", articleList);
                    System.out.println(articleList);
                    break;
                }
                case "2": {
                    List<Board> articleList = board_tipService.getBoardList_search_nickname(page, pageInfo, board);
                    mv.addObject("articleList", articleList);
                    break;
                }
                case "3": {
                    List<Board> articleList = board_tipService.getBoardList_search_content(page, pageInfo, board);
                    mv.addObject("articleList", articleList);
                    break;
                }
            };
            mv.addObject("pageInfo", pageInfo);
            mv.setViewName("board/boardForm_tip");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }



    /* 게시판 리스트 (최신순 정렬) */
    @RequestMapping(value = "/boardlist_tip", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardlist_highlight(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_tipService.getBoardList(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "boardlist");
            mv.setViewName("board/boardForm_tip");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    /* 조회수순 정렬 */
    @GetMapping(value = "board_tip_viewssort")
    public ModelAndView board_all_viewssort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_tipService.getBoardList_viewsSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "viewssort");
            mv.setViewName("board/boardForm_tip");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    /* 댓글순 정렬 */
    @GetMapping(value = "board_tip_replysort")
    public ModelAndView board_highlight_replysort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_tipService.getBoardList_replySort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "replysort");
            mv.setViewName("board/boardForm_tip");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }




    /* 좋아요순 정렬 */
    @GetMapping(value = "board_tip_likesort")
    public ModelAndView board_highlight_likesort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_tipService.getBoardList_likeSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "likesort");
            mv.setViewName("board/boardForm_tip");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    @RequestMapping(value = "boardForm_tip_ajax", method = {RequestMethod.GET, RequestMethod.POST})
    public String boardForm_tip_ajax(@RequestParam(value = "page", defaultValue = "1") int page,
                                     @RequestParam(value = "sort") String sort,
                                     HttpServletRequest request, HttpSession session) {
        PageInfo pageInfo = new PageInfo();
        try {
            if (Objects.equals(sort, "boardlist")) {
                List<Board> articleList = board_tipService.getBoardList(page, pageInfo);
                request.setAttribute("articleList", articleList);
            } else if (Objects.equals(sort, "viewssort")) {
                List<Board> articleList = board_tipService.getBoardList_viewsSort(page, pageInfo);
                request.setAttribute("articleList", articleList);
            } else if (Objects.equals(sort, "replysort")) {
                List<Board> articleList = board_tipService.getBoardList_replySort(page, pageInfo);
                request.setAttribute("articleList", articleList);
            } else if (Objects.equals(sort, "likesort")) {
                List<Board> articleList = board_tipService.getBoardList_likeSort(page, pageInfo);
                request.setAttribute("articleList", articleList);
            }
            request.setAttribute("pageInfo", pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", e.getMessage());
        }
        return "board/boardForm_all_ajax";
    }


}
