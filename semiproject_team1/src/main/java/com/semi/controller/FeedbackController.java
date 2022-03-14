package com.semi.controller;

import com.semi.dto.*;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

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


    /* 게시판에서 게시물 검색 */
    @GetMapping(value = "feedback_search")
    public ModelAndView feedback_search(@ModelAttribute Feedback feedback, @RequestParam(value = "page", defaultValue = "1") int page) {
    	System.out.println(feedback.getFeedback_keyword());
    	System.out.println(feedback.getFeedback_type());
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            String type = String.valueOf(feedback.getFeedback_type());
            switch (type) {
                case "1": {
                    List<Feedback> articleList = feedbackService.getFeedbackList_search_subject(page,pageInfo,feedback);
                    mv.addObject("articleList", articleList);
                    break;
                }
                case "2": {
                    List<Feedback> articleList = feedbackService.getFeedbackList_search_nickname(page,pageInfo,feedback);
                    mv.addObject("articleList", articleList);
                    break;
                }
                case "3": {
                    List<Feedback> articleList = feedbackService.getFeedbackList_search_content(page,pageInfo,feedback);
                    mv.addObject("articleList", articleList);
                    break;
                }
            }
            mv.addObject("pageInfo", pageInfo);
            mv.setViewName("feedback/feedbackForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }






    /* 게시판 ajax 페이지 (무한스크롤 응답) */
    @RequestMapping(value = "feedbackForm_ajax", method = {RequestMethod.GET, RequestMethod.POST})
    public String feedbackForm_ajax(@RequestParam(value = "page", defaultValue = "1") int page,
                                     @RequestParam(value = "sort") String sort,
                                     HttpServletRequest request, HttpSession session) {
        PageInfo pageInfo = new PageInfo();
        try {
            if (Objects.equals(sort, "feedbacklist")) {
                List<Feedback> articleList = feedbackService.getFeedbackList(page,pageInfo);
                request.setAttribute("articleList", articleList);
            } else if (Objects.equals(sort, "viewssort")) {
                List<Feedback> articleList = feedbackService.getFeedbackList_viewSort(page,pageInfo);
                request.setAttribute("articleList", articleList);
            } else if (Objects.equals(sort, "replysort")) {
                List<Feedback> articleList = feedbackService.getFeedbackList_replySort(page,pageInfo);
                request.setAttribute("articleList", articleList);
            } else if (Objects.equals(sort, "likesort")) {
                List<Feedback> articleList = feedbackService.getFeedbackList_likeSort(page,pageInfo);
                request.setAttribute("articleList", articleList);
            }
            request.setAttribute("pageInfo", pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", e.getMessage());
        }
        return "feedback/feedbackForm_ajax";
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
                String path_replay = servletContext.getRealPath("/feedback_upload/replay/");
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
    @GetMapping(value = "/fdmodifyform")
    public ModelAndView fdmodifyform(@RequestParam(value = "feedback_num") int feedbackNum,
                                   @RequestParam(value = "page") int page) {
        ModelAndView mv = new ModelAndView();
        try {
            Feedback feedback = feedbackService.getFeedback(feedbackNum);
            mv.addObject("article", feedback);
            mv.setViewName("/feedback/fdModifyForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    @PostMapping(value = "/feedbackmodify")
    public ModelAndView feedbackmodify(@ModelAttribute Feedback feedback) {
        ModelAndView mv = new ModelAndView();
        try {
            feedbackService.modifyFeedback(feedback);
            mv.addObject("feedback_num", feedback.getFeedback_num());
            mv.setViewName("redirect:/feedbackdetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 게시물 삭제 */
    @GetMapping(value = "/feedbackdelete")
    public ModelAndView feedbackdelete(@RequestParam(value = "feedback_num") int feedbackNum, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        try {
            feedbackService.removeFeedback(feedbackNum);
            mv.addObject("page", page);
            mv.setViewName("redirect:/feedback");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }




    /* 게시물 상세보기 (게시물 클릭시 화면) */
    @GetMapping(value = "/feedbackdetail")
    public ModelAndView boardDetail(@RequestParam(value = "feedback_num") int feedbackNum, @RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        try {
            // 세션에서 mno랑 nickname을 일단 받아온다
            String mno = String.valueOf(session.getAttribute("mem_mno"));
            String nickname = String.valueOf(session.getAttribute("mem_nickname"));
            // mv에 넣어주고..?? 넣을 필요가 있나? 어차피 세션이라 이미  mem_mno 이런식으로 jsp에서 불러올 수 있는데?
            mv.addObject("mno", mno);
            mv.addObject("nickname", nickname);

            Feedback feedback = feedbackService.getFeedback(feedbackNum);

            /* 날짜 포맷 변경 시작 */
            // JSTL 날짜 변경 라이브러리를 사용할 경우 아래와 같은 작업이 필요없다.
            Date date = feedback.getFeedback_date();
            SimpleDateFormat b_date = new SimpleDateFormat("yyyy년 M월 d일 E요일 a h:mm");
            mv.addObject("feedback_date", b_date.format(date));
            /* 날짜 포맷 변경 끝 */

            /* 리플 관련 시작*/
            List<Fd_reply> reList = feedbackService.getReplyList(feedbackNum);

            for (Fd_reply reply : reList) {

                List<String> reLikeMem_arr = List.of(reply.getFd_reply_like_member().split(","));
                //split해서 배열로 각각 넣은 후 contains
                if (mno != null) {
                    if (reLikeMem_arr.contains(mno)) {
                        reply.setFd_reply_like_ok("true");
                    } else {
                        reply.setFd_reply_like_ok("false");
                    }
                }
            }
            mv.addObject("reList", reList);
            /* 리플 관련 끝 */

            /* 피드백 답변 관련 시작*/
            List<Fd_answer> anList = feedbackService.getAnswerList(feedbackNum);

            for(Fd_answer answer :anList) {

                List<String> anLikeMem_arr = List.of(answer.getFd_answer_like_member().split(","));
                //split해서 배열로 각각 넣은 후 contains
                if (mno != null) {
                    if (anLikeMem_arr.contains(mno)) {
                        answer.setFd_answer_like_ok("true");
                    } else {
                        answer.setFd_answer_like_ok("false");
                    }
                }
            }

            // 우선 좋아요는 리스트 가져오는거 확인 후 하단에 추가
            /* 답변 관련 끝 */
            mv.addObject("anList",anList);

            mv.addObject("article", feedback);
            mv.addObject("page", page);
            mv.setViewName("feedback/feedbackDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    /* 상세보기시 동영상 출력 */
    @GetMapping(value = "/fd_video_view/{filename}")
    public void fd_video_view(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
        String path = servletContext.getRealPath("/feedback_upload/video/");
        /* 즉, file은 semiproject_team1/src/main/webapp/board_upload/video/filename */
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






    /*------------------------------------ 끝 : 게시물 작성, 수정, 삭제, 상세보기 ------------------------------------*/



    /*------------------------------------ 시작 : 피드백 댓글 ------------------------------------*/

    /* 댓글 작성 */
    @ResponseBody
    @RequestMapping(value = "fd_regreply", method = {RequestMethod.GET, RequestMethod.POST})
    public void fd_regreply(@RequestParam(value = "feedback_num") int feedbackNum,
                         @RequestParam(value = "fd_reply_content") String fd_reply_content) {
        Fd_reply fd_reply = new Fd_reply();
        try {

            String board_nickname = (String) session.getAttribute("mem_nickname");
            fd_reply.setFd_reply_nickname(board_nickname);
            fd_reply.setFd_feedback_num(feedbackNum);
            fd_reply.setFd_reply_content(fd_reply_content);

            feedbackService.regReply(fd_reply);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /* 댓글 삭제 */
    @ResponseBody
    @RequestMapping(value = "fd_replydelete", method = {RequestMethod.GET, RequestMethod.POST})
    public void fd_replydelete(@RequestParam(value = "fd_reply_num") int fd_reply_num) {
        try {
            feedbackService.delReply(fd_reply_num);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* 댓글 좋아요 버튼 on */
    @ResponseBody
    @RequestMapping(value = "/fd_re_like_on", method = {RequestMethod.GET, RequestMethod.POST})
    public void fd_re_like_on(@RequestParam(value = "fd_reply_num") int fd_reply_num,
                            @RequestParam(value = "mno") String mno) {
        try {
            /* b_reply_like_member에 mno를 추가해주는 서비스 */
            /* 추가시 b_reply_likecount도 +1 */

            feedbackService.fd_re_like_ins_mno(fd_reply_num,mno);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* 댓글 좋아요 버튼 off */
    @ResponseBody
    @RequestMapping(value = "/fd_re_like_off", method = {RequestMethod.GET, RequestMethod.POST})
    public void fd_re_like_off(@RequestParam(value = "fd_reply_num") int fd_reply_num,
                            @RequestParam(value = "mno") String mno) {
        try {
            /* b_reply_like_member에 mno를 제거해주는 서비스 */
            /* 제거시 b_reply_likecount도 -1 */

            feedbackService.fd_re_like_del_mno(fd_reply_num,mno);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    /* 댓글 ajax 페이지 */
    @RequestMapping(value = "feedbackDetail_ajax", method = {RequestMethod.GET, RequestMethod.POST})
    public String feedbackDetail_ajax(@RequestParam(value = "feedback_num") int feedbackNum,
                                   HttpServletRequest request, HttpSession session) {

        try {
            // 인기순 정렬로 서비스를 요청해야한다
            List<Fd_reply> reList = feedbackService.getReplyList_like(feedbackNum);
            String mno = String.valueOf(session.getAttribute("mem_mno"));

            for(Fd_reply reply :reList) {

                List<String> reLikeMem_arr = List.of(reply.getFd_reply_like_member().split(","));
                //split해서 배열로 각각 넣은 후 contains
                if (mno != null) {
                    if (reLikeMem_arr.contains(mno)) {
                        reply.setFd_reply_like_ok("true");
                    } else {
                        reply.setFd_reply_like_ok("false");
                    }
                }
            }
            request.setAttribute("reList", reList);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", e.getMessage());
        }
        return "feedback/feedbackDetail_ajax";
    }

    /*------------------------------------ 끝 : 피드백 댓글 ------------------------------------*/


    /*------------------------------------ 시작 : 피드백 답변 ------------------------------------*/
    
    /* 피드백 답변 작성 */
    @ResponseBody
    @RequestMapping(value = "fd_reganswer", method = {RequestMethod.GET, RequestMethod.POST})
    public void fd_reganswer(@RequestParam(value = "feedback_num") int feedbackNum,
                            @RequestParam(value = "fd_answer_content") String fd_answer_content,
                             @RequestParam(value = "fd_answer_title") String fd_answer_title) {
        Fd_answer fd_answer = new Fd_answer();
        try {
            String board_nickname = (String) session.getAttribute("mem_nickname");
            fd_answer.setFd_answer_nickname(board_nickname); //작성자
            fd_answer.setFd_feedback_num(feedbackNum);
            fd_answer.setFd_answer_title(fd_answer_title);
            fd_answer.setFd_answer_content(fd_answer_content);

            feedbackService.regAnswer(fd_answer);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* 피드백 답변 삭제 */
    @ResponseBody
    @RequestMapping(value = "fd_answerdelete", method = {RequestMethod.GET, RequestMethod.POST})
    public void fd_answerdelete(@RequestParam(value = "fd_answer_num") int fd_answer_num) {
        try {
            feedbackService.delAnswer(fd_answer_num);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /* 피드백 답변 좋아요 버튼 on */
    @ResponseBody
    @RequestMapping(value = "/fd_an_like_on", method = {RequestMethod.GET, RequestMethod.POST})
    public void fd_an_like_on(@RequestParam(value = "feedback_num") int feedbackNum,
                              @RequestParam(value = "fd_answer_num") int fd_answer_num,
                            @RequestParam(value = "mno") String mno) {
        try {
            feedbackService.fd_an_like_ins_mno(fd_answer_num,mno,feedbackNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* 피드백 답변 좋아요 버튼 off */
    @ResponseBody
    @RequestMapping(value = "/fd_an_like_off", method = {RequestMethod.GET, RequestMethod.POST})
    public void fd_an_like_off(@RequestParam(value = "feedback_num") int feedbackNum,
                               @RequestParam(value = "fd_answer_num") int fd_answer_num,
                            @RequestParam(value = "mno") String mno) {
        try {

            feedbackService.fd_an_like_del_mno(fd_answer_num,mno,feedbackNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    /* ajax로 넘어갔을 때 고정 버튼 이상으로 보류하기로 결정 */

    /* 피드백 답변 ajax 페이지 */
//    @RequestMapping(value = "feedbackDetail_ajax_answer", method = {RequestMethod.GET, RequestMethod.POST})
//    public String feedbackDetail_ajax_answer(@RequestParam(value = "feedback_num") int feedbackNum,
//                                      HttpServletRequest request, HttpSession session) {
//        try {
//            List<Fd_answer> anList = feedbackService.getAnswerList_latest(feedbackNum);
//            String mno = String.valueOf(session.getAttribute("mem_mno"));
//
//            for(Fd_answer answer :anList) {
//
//                List<String> anLikeMem_arr = List.of(answer.getFd_answer_like_member().split(","));
//                //split해서 배열로 각각 넣은 후 contains
//                if (mno != null) {
//                    if (anLikeMem_arr.contains(mno)) {
//                        answer.setFd_answer_like_ok("true");
//                    } else {
//                        answer.setFd_answer_like_ok("false");
//                    }
//                }
//            }
//            request.setAttribute("anList", anList);
//        } catch (Exception e) {
//            e.printStackTrace();
//            request.setAttribute("err", e.getMessage());
//        }
//        return "feedback/feedbackDetail_ajax_answer";
//    }



    /* 피드백 답변 고정 */
    @ResponseBody
    @RequestMapping(value = "/fd_an_fixed", method = {RequestMethod.GET, RequestMethod.POST})
    public void fd_an_fixed(@RequestParam(value = "fd_answer_num") int fd_answer_num,
                            @RequestParam(value = "feedback_num") int feedbackNum) {
        try {
            feedbackService.fd_an_fixed(fd_answer_num,feedbackNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* 피드백 답변 고정취소 */
    @ResponseBody
    @RequestMapping(value = "/fd_an_fixed_cancel", method = {RequestMethod.GET, RequestMethod.POST})
    public void fd_an_fixed_cancel(@RequestParam(value = "fd_answer_num") int fd_answer_num,
                                   @RequestParam(value = "feedback_num") int feedbackNum) {
        try {
            feedbackService.fd_an_fixed_cancel(fd_answer_num,feedbackNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }





    /*------------------------------------ 끝 : 피드백 답변 ------------------------------------*/


    //리플레이 다운로드
    @GetMapping(value = "/replay_file_down")
    public void filedownload(@RequestParam(value = "downFile") String filename, HttpServletRequest request,
                             HttpServletResponse response) {
        String path = servletContext.getRealPath("/feedback_upload/replay/");
        File file = new File(path + filename);
        String sfilename = null;
        FileInputStream fis = null;
        try {
            if (request.getHeader("User-Agent").indexOf("MSIE") > -1) {
                sfilename = URLEncoder.encode(file.getName(), "utf-8");
            } else {
                sfilename = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
            }
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






}
