package com.semi.controller;

import com.semi.dto.Board;
import com.semi.dto.PageInfo;
import com.semi.service.Board_allService;
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
public class Board_allController {

    @Autowired
    private Board_allService board_allService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    HttpSession session;


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
            board_allService.regBoard(board);
            mv.setViewName("redirect:/boardlist");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

//    @PostMapping("/board_search")
//    @RequestMapping(value = "/board_search", method = {RequestMethod.GET, RequestMethod.POST})
    @GetMapping(value="board_search")
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
                    List<Board> articleList = board_allService.getBoardList_search_subject(page, pageInfo, board);
                    mv.addObject("articleList", articleList);
                    System.out.println(articleList);
                    break;
                }
                case "2": {
                    List<Board> articleList = board_allService.getBoardList_search_nickname(page, pageInfo, board);
                    mv.addObject("articleList", articleList);
                    break;
                }
                case "3": {
                    List<Board> articleList = board_allService.getBoardList_search_content(page, pageInfo, board);
                    mv.addObject("articleList", articleList);
                    break;
                }
            };
//            List<Board> articleList = board_allService.getBoardList_search_subject(page, pageInfo, board);
//            mv.addObject("articleList", articleList);
//            System.out.println(articleList);
            mv.addObject("pageInfo", pageInfo);
//            mv.setViewName("redirect:/boardlist");
            mv.setViewName("/boardForm_all");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    @RequestMapping(value = "/boardlist", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardlist(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_allService.getBoardList(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.setViewName("/boardForm_all");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }
    /* 조회수순*/
    @GetMapping(value="board_all_viewssort")
    public ModelAndView board_all_viewssort(@RequestParam(value = "page", defaultValue = "1") int page){
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_allService.getBoardList_viewsSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.setViewName("/boardForm_all");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 댓글순*/
    @GetMapping(value="board_all_replysort")
    public ModelAndView board_all_replysort(@RequestParam(value = "page", defaultValue = "1") int page){
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_allService.getBoardList_replySort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.setViewName("/boardForm_all");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 좋아요순 */
    @GetMapping(value="board_all_likesort")
    public ModelAndView board_all_likesort(@RequestParam(value = "page", defaultValue = "1") int page){
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_allService.getBoardList_likeSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.setViewName("/boardForm_all");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }



    @GetMapping(value = "/boarddetail")
    public ModelAndView boardDetail(@RequestParam(value = "board_num") int boardNum, @RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {

            // 좋아요 시작
            session.setAttribute("mno", "jay");
            boolean reply_like_ok = false;
            String reply_like_member = "1,2,3,4,5,6,7,8,9,jay";
            List<String> arr = List.of(reply_like_member.split(","));
            System.out.println(arr);
            if (arr.contains(session.getAttribute("mno"))) {
                reply_like_ok = true;
                System.out.println("testOK");
            }
            mv.addObject("okok", reply_like_ok);
            // 좋아요 끝

            System.out.println(reply_like_ok);
            Board board = board_allService.getBoard(boardNum);
            mv.addObject("article", board);
            mv.addObject("page", page);
            mv.setViewName("/boardDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("/board/err");
        }
        return mv;
    }

    @GetMapping("/test")
    public String test() {
        return "/infiniteScroll";
    }

//    @GetMapping("/test")
//    public ResponseEntity<Integer> test(@RequestParam(value = "page", defaultValue = "1") int page) {
//        ResponseEntity<Integer> result = null;
//        try {
//            result = new ResponseEntity<Integer>(page, HttpStatus.OK);
//        } catch (Exception e) {
//            result = new ResponseEntity<Integer>(page, HttpStatus.BAD_REQUEST);
//        }
//        return result;
//    }

//    @RequestMapping(value = "/test", method = {RequestMethod.GET, RequestMethod.POST})
//    public ModelAndView test(@RequestParam(value = "page", defaultValue = "1") int page) {
//        ModelAndView mv = new ModelAndView();
//        try {
//            System.out.println(mv);
//            System.out.println(page);
////            mv.addObject("page",page++);
//            System.out.println(page);
//            mv.setViewName("/infiniteScroll");
//            System.out.println(mv);
//        } catch (Exception e) {
//            e.printStackTrace();
//            mv.addObject("err", e.getMessage());
//        }
//        return mv;
//    }



}
