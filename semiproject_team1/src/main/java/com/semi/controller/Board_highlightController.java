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
/* 테스트 */

    @GetMapping("/boardwriteform")
    public String boardwriteform() {
        return "/boardwriteForm";
    }

    @PostMapping("/regboard")
    public ModelAndView regboard(@ModelAttribute Board board) {
        ModelAndView mv = new ModelAndView();
        try {
            if (!board.getFile().isEmpty()) {
                String path = servletContext.getRealPath("/boardupload/");
                File destFile = new File(path + board.getFile().getOriginalFilename());
                board.setBoard_fileName(board.getFile().getOriginalFilename());
                board.getFile().transferTo(destFile);
            }
            board_highlightService.regBoard(board);
            mv.setViewName("redirect:/boardlist");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
//            mv.setViewName("/err");
        }
        return mv;
    }

    @RequestMapping(value = "/boardlist", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardlist(@RequestParam(value = "page", defaultValue = "1") int page) {
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


}
