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
            // 세션에 회원 고유번호(mno)가 존재한다 가정
            session.setAttribute("mno", "14");
            Boolean like_ok = board_allService.like_check_mno(boardNum, (String) session.getAttribute("mno"));
            mv.addObject("okok", like_ok);
            mv.addObject("mno",session.getAttribute("mno"));

            Board board = board_allService.getBoard(boardNum);
            board_allService.getBoard_likeCount(boardNum);

            mv.addObject("article", board);
            mv.addObject("page", page);
            mv.setViewName("/boardDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    @GetMapping(value = "/like_on")
    public ModelAndView like_on(@RequestParam(value = "board_num", required=false) int boardNum, @RequestParam(value = "mno") String mno) {
        ModelAndView mv = new ModelAndView();
        try {
            //article_like에서 mno를 추가하는 서비스
            System.out.println(boardNum);
            board_allService.like_ins_mno(boardNum,mno);
            mv.setViewName("/boardDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());

        }
        return mv;
    }

    @GetMapping(value = "/like_off")
    public ModelAndView like_off(@RequestParam(value = "board_num", required=false) int boardNum, @RequestParam(value = "mno") String mno) {
        ModelAndView mv = new ModelAndView();
        try {
            System.out.println(boardNum);
            //article_like에서 mno를 제거하는 서비스
            board_allService.like_del_mno(boardNum,mno);
            mv.setViewName("/boardDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    @GetMapping("/test")
    public String test() {
        return "/infiniteScroll";
    }


    /* 뷰 확인용 */
//    @RequestMapping(value="/custom/{pageName}")
//    public String getSinglePage(@PathVariable("pageName")String pageName){
//        return "/custom/"+pageName;
//    }


}
