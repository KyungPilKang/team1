package com.semi.controller;

import com.semi.dto.Board;
import com.semi.dto.PageInfo;
import com.semi.service.Board_highlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller
public class Board_highlightController {

    @Autowired
    private Board_highlightService board_highlightService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    HttpSession session;


    @RequestMapping(value = "/boardlist_highlight", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardlist_highlight(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_highlightService.getBoardList(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.setViewName("/boardForm_highlight");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
//            mv.setViewName("/err");
        }
        return mv;
    }

    /* 조회수순*/
    @GetMapping(value="board_highlight_viewssort")
    public ModelAndView board_highlight_viewssort(@RequestParam(value = "page", defaultValue = "1") int page){
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_highlightService.getBoardList_viewsSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.setViewName("/boardForm_highlight");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 댓글순*/
    @GetMapping(value="board_highlight_replysort")
    public ModelAndView board_highlight_replysort(@RequestParam(value = "page", defaultValue = "1") int page){
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_highlightService.getBoardList_replySort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.setViewName("/boardForm_highlight");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 좋아요순 */
    @GetMapping(value="board_highlight_likesort")
    public ModelAndView board_highlight_likesort(@RequestParam(value = "page", defaultValue = "1") int page){
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_highlightService.getBoardList_likeSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.setViewName("/boardForm_highlight");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


}
