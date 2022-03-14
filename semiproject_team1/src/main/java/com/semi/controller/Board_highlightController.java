package com.semi.controller;

import com.semi.dto.Board;
import com.semi.dto.PageInfo;
import com.semi.service.Board_highlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class Board_highlightController {

    @Autowired
    private Board_highlightService board_highlightService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    HttpSession session;



    @GetMapping(value="board_highlight_search")
    public ModelAndView board_search(@ModelAttribute Board board,
                                     @RequestParam(value = "page", defaultValue = "1") int page) {

        System.out.println(board.getBoard_keyword());
        System.out.println(board.getBoard_type());

        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            String type = board.getBoard_type();
            switch (type) {
                case "1": {
                    List<Board> articleList = board_highlightService.getBoardList_search_subject(page, pageInfo, board);
                    mv.addObject("articleList", articleList);
                    System.out.println(articleList);
                    break;
                }
                case "2": {
                    List<Board> articleList = board_highlightService.getBoardList_search_nickname(page, pageInfo, board);
                    mv.addObject("articleList", articleList);
                    break;
                }
                case "3": {
                    List<Board> articleList = board_highlightService.getBoardList_search_content(page, pageInfo, board);
                    mv.addObject("articleList", articleList);
                    break;
                }
            };
            mv.addObject("pageInfo", pageInfo);
            mv.setViewName("board/boardForm_highlight");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }



    /* 게시판 리스트 (최신순 정렬) */
    @RequestMapping(value = "/boardlist_highlight", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardlist_highlight(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_highlightService.getBoardList(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "boardlist");
            mv.setViewName("board/boardForm_highlight");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    /* 조회수순 정렬 */
    @GetMapping(value = "board_highlight_viewssort")
    public ModelAndView board_all_viewssort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_highlightService.getBoardList_viewsSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "viewssort");
            mv.setViewName("board/boardForm_highlight");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    /* 댓글순 정렬 */
    @GetMapping(value = "board_highlight_replysort")
    public ModelAndView board_highlight_replysort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_highlightService.getBoardList_replySort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "replysort");
            mv.setViewName("board/boardForm_highlight");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }




    /* 좋아요순 정렬 */
    @GetMapping(value = "board_highlight_likesort")
    public ModelAndView board_highlight_likesort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_highlightService.getBoardList_likeSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "likesort");
            mv.setViewName("board/boardForm_highlight");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }



}
