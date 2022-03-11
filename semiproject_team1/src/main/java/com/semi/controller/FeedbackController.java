package com.semi.controller;

import com.semi.dto.Board;
import com.semi.dto.Feedback;
import com.semi.dto.PageInfo;
import com.semi.service.Board_allService;
import com.semi.service.FeedbackService;
import org.apache.tomcat.util.codec.binary.Base64;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;

@Controller
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    HttpSession session;
    @Autowired
    private Board_allService board_allService;

    /*------------------------------------ 시작 : 피드백 게시판 출력및 정렬 ------------------------------------*/

    /* 피드백 게시판 리스트 (최신순 정렬) */
    @RequestMapping(value = "/feedback", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView feedback(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            // 일단 화면 출력용으로 boardlist 데이터를 보내줌
//            List<Board> articleList = board_allService.getBoardList(page, pageInfo);
            List<Feedback> articleList = feedbackService.getFeedbackList(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            // 아래 sort_name은 안바꿔도 되는데 좀 찜찜하니까 변경 예정 (무한스크롤 내려보내는거)
            // 폼에서 자바스크립트 부분에 있음
            mv.addObject("sort_name", "feedbacklist");
            mv.setViewName("feedback/feedbackForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    /* 썸네일 출력 */
    @GetMapping(value = "/fd_thumbnail_view/{filename}")
    public void thumbnail_view(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
        String path = servletContext.getRealPath("/feedback_upload/image/");
        /* 즉, file은 semiproject_team1/src/main/webapp/feedback_upload/image/filename */
        File file = new File(path + filename);
        String sfilename = null;
        FileInputStream fis = null;
        try {
            /* HttpServletRequest request */
            if (request.getHeader("User-Agent").indexOf("MSIE") > -1) {
                sfilename = URLEncoder.encode(file.getName(), "utf-8");
            } else {
                sfilename = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
            }
            /* HttpServletResponse response */
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/octet-stream;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + sfilename);

            OutputStream out = response.getOutputStream();
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }




    /* 피드백 게시판 조회수순 정렬 */
    @GetMapping(value = "feedback_viewssort")
    public ModelAndView feedback_viewssort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Feedback> articleList = feedbackService.getFeedbackList_viewSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "viewssort");
            mv.setViewName("feedback/feedbackForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 피드백 게시판 댓글순 정렬 */
    @GetMapping(value = "feedback_replysort")
    public ModelAndView feedback_replysort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Feedback> articleList = feedbackService.getFeedbackList_replySort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "replysort");
            mv.setViewName("feedback/feedbackForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 피드백 게시판좋아요순 정렬 */
    @GetMapping(value = "feedback_likesort")
    public ModelAndView feedback_likesort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Feedback> articleList = feedbackService.getFeedbackList_likeSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "likesort");
            mv.setViewName("feedback/feedbackForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /*------------------------------------ 끝 : 피드백 게시판 출력및 정렬 ------------------------------------*/



    /*------------------------------------ 시작 : 게시물 작성, 수정, 삭제, 상세보기 ------------------------------------*/

    /* 게시물 작성  */
    @GetMapping("/feedbackwriteform")
    public String feedbackwriteform() {
        return "feedback/feedbackwriteForm";
    }

    @PostMapping("/regfeedback")
    public ModelAndView regfeedback(@ModelAttribute Feedback feedback) {
        ModelAndView mv = new ModelAndView();
        try {
            /* 동영상 시작 */
            /* 동영상 여부, 피드백 게시판은 필수이므로 if문 제거 예정  */
            if (!feedback.getVideo_file().isEmpty()) {
                String path_mov = servletContext.getRealPath("/feedback_upload/video/");
                File destFile_mov = new File(path_mov + feedback.getVideo_file().getOriginalFilename());
                feedback.setFeedback_video_fileName(feedback.getVideo_file().getOriginalFilename());
                feedback.getVideo_file().transferTo(destFile_mov);
            }
            /* 동영상 끝 */

            /* 썸네일 시작 */
            String thumbnail_base64 = Jsoup.parse(feedback.getFeedback_content()).select("img").attr("src");
            if (!thumbnail_base64.isEmpty()) {
                String path = servletContext.getRealPath("/feedback_upload/image/");
                List<String> thumbnail_ok = List.of(thumbnail_base64.split("base64,"));
                List<String> image_format = List.of(thumbnail_base64.split(";"));
                List<String> image_format_result = List.of(image_format.get(0).split("/"));
                System.out.println("이미지 포맷 체크 : " + image_format_result.get(1));
                byte[] decoded = Base64.decodeBase64(thumbnail_ok.get(1));
                // 고유키값 생성(Board_allController에 존재)
                Board_allController.UUIDgeneration uuid = new Board_allController.UUIDgeneration();
                String filename_uuid = uuid.getUUID();
                // 경로+파일명(가져오는 파일명이 없으므로 고유키값을 생성하여 넣어준다)+이미지포맷
                File target = new File(path + filename_uuid + "." + image_format_result.get(1));
                FileOutputStream fos;
                fos = new FileOutputStream(target);
                fos.write(decoded);
                fos.close();
                // DB에 thumbnail 이름을 저장 (jsp에서는 아래 이름의 파일이 저장된 경로의 데이터를 불러온다)
                String thumbnail = filename_uuid + "." + image_format_result.get(1);
                feedback.setFeedback_thumbnail(thumbnail);
                /* 썸네일 끝 */
            }
            /* 리플레이 시작 */
            /* 리플레이 여부, 피드백 게시판은 필수이므로 if문 제거 예정  */
            if (!feedback.getReplay_file().isEmpty()) {
                String path_replay = servletContext.getRealPath("/feedback_upload/video/");
                File destFile_reply = new File(path_replay + feedback.getReplay_file().getOriginalFilename());
                feedback.setFeedback_replay_fileName(feedback.getReplay_file().getOriginalFilename());
                feedback.getReplay_file().transferTo(destFile_reply);
            }
            /* 리플레이 끝 */

            String feedback_nickname = (String) session.getAttribute("mem_nickname");
            feedback.setFeedback_nickname(feedback_nickname);
            feedbackService.regFeedback(feedback);
            mv.setViewName("redirect:/feedback");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }



    /* 게시물 수정 */
//    @GetMapping(value = "/modifyform")
//    public ModelAndView modifyform(@RequestParam(value = "board_num") int boardNum,
//                                   @RequestParam(value = "page") int page) {
//        ModelAndView mv = new ModelAndView();
//        try {
//            Board board = board_allService.getBoard(boardNum);
//            mv.addObject("article", board);
//            mv.setViewName("/board/modifyForm");
//        } catch (Exception e) {
//            e.printStackTrace();
//            mv.addObject("err", e.getMessage());
//        }
//        return mv;
//    }
//
//
//    @PostMapping(value = "/boardmodify")
//    public ModelAndView boardmodify(@ModelAttribute Board board) {
//        ModelAndView mv = new ModelAndView();
//        try {
//            board_allService.modifyBoard(board);
//            mv.addObject("board_num", board.getBoard_num());
//            mv.setViewName("redirect:/boarddetail");
//        } catch (Exception e) {
//            e.printStackTrace();
//            mv.addObject("err", e.getMessage());
//        }
//        return mv;
//    }
//




    /*------------------------------------ 끝 : 게시물 작성, 수정, 삭제, 상세보기 ------------------------------------*/


    @GetMapping("/feedbackform_all")
    public String feedbackform_all() {
        return "feedbackForm_all";
    }

//	 @GetMapping("/feedbackwriteform")
//	 	public String feedbackwriteform() {
//		 return "feedback/feedbackwriteForm";
//	 }
}
