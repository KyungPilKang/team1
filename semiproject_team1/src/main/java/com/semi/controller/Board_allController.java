package com.semi.controller;

import com.semi.dto.B_reply;
import com.semi.dto.Board;
import com.semi.dto.PageInfo;
import com.semi.service.Board_allService;
import com.semi.service.MemberServiceImpl;
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
import java.util.*;

@Controller
public class Board_allController {

    @Autowired
    private Board_allService board_allService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    HttpSession session;

    @Autowired
    MemberServiceImpl memberService;

    /* 게시물 작성  */
    @GetMapping("/boardwriteform")
    public String boardwriteform() {
        return "board/boardwriteForm";
    }

    @PostMapping("/regboard")
    public ModelAndView regboard(@ModelAttribute Board board) {
        ModelAndView mv = new ModelAndView();
        try {
            if (!board.getFile().isEmpty()) {
                String path = servletContext.getRealPath("/board_upload/video/");
                File destFile = new File(path + board.getFile().getOriginalFilename());
                board.setBoard_fileName(board.getFile().getOriginalFilename());
                board.getFile().transferTo(destFile);
            }

            /* 썸네일 시작 */
            String thumbnail_base64 = Jsoup.parse(board.getBoard_content()).select("img").attr("src");
            if (!thumbnail_base64.isEmpty()) {
                String path = servletContext.getRealPath("/board_upload/image/");
                // 위에서 파싱한 b64 데이터에서 split("base64,")로 한 후 0,1 중 1번째 값만 가져와서 디코딩 해줘야한다.
                List<String> thumbnail_ok = List.of(thumbnail_base64.split("base64,"));
                // 위에서 파싱한 b64 데이터에서 image 타입을 추출하기 위해 스플릿
                List<String> image_format = List.of(thumbnail_base64.split(";"));
                List<String> image_format_result = List.of(image_format.get(0).split("/"));
                System.out.println("이미지 포맷 체크 : " + image_format_result.get(1));
                // 파싱 데이터의 1번째 값을 디코딩
                byte[] decoded = Base64.decodeBase64(thumbnail_ok.get(1));
                // 고유키값 생성
                UUIDgeneration uuid = new UUIDgeneration();
                String filename_uuid = uuid.getUUID();
                // 경로+파일명(가져오는 파일명이 없으므로 고유키값을 생성하여 넣어준다)+이미지포맷
                File target = new File(path + filename_uuid + "." + image_format_result.get(1));
                FileOutputStream fos;
                fos = new FileOutputStream(target);
                fos.write(decoded);
                fos.close();
                // DB에 thumbnail 이름을 저장 (jsp에서는 아래 이름의 파일이 저장된 경로의 데이터를 불러온다)
                String thumbnail = filename_uuid + "." + image_format_result.get(1);
                board.setBoard_thumbnail(thumbnail);
                /* 썸네일 끝 */
            }
            String board_nickname = (String) session.getAttribute("mem_nickname");
            board.setBoard_nickname(board_nickname);
            System.out.println("닉네임 확인 : "+board.getBoard_nickname());
            board_allService.regBoard(board);
            mv.setViewName("redirect:/boardlist");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    /* 게시물 수정 */
    @GetMapping(value = "/modifyform")
    public ModelAndView modifyform(@RequestParam(value = "board_num") int boardNum,
                                   @RequestParam(value = "page") int page) {
        ModelAndView mv = new ModelAndView();
        try {
            Board board = board_allService.getBoard(boardNum);
            mv.addObject("article", board);
            mv.setViewName("/board/modifyForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    @PostMapping(value = "/boardmodify")
    public ModelAndView boardmodify(@ModelAttribute Board board) {
        ModelAndView mv = new ModelAndView();
        try {
            board_allService.modifyBoard(board);
            mv.addObject("board_num", board.getBoard_num());
            mv.setViewName("redirect:/boarddetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 게시물 삭제 */
    @GetMapping(value = "/boarddelete")
    public ModelAndView boarddelete(@RequestParam(value = "board_num") int boardNum, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        try {
            board_allService.removeBoard(boardNum);
            mv.addObject("page", page);
            mv.setViewName("redirect:/boardlist");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    /* 게시물 상세보기 (게시물 클릭시 화면) */
    @GetMapping(value = "/boarddetail")
    public ModelAndView boardDetail(@RequestParam(value = "board_num") int boardNum, @RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
//        PageInfo pageInfo = new PageInfo();
        try {
            String mno = String.valueOf(session.getAttribute("mem_mno"));
            if(session.getAttribute("mem_nickname")!=null) {
                Boolean like_ok = board_allService.like_check_mno(boardNum,mno );
                Boolean ward_ok = board_allService.ward_check_mno(boardNum,mno);
                mv.addObject("like_ok", like_ok);
                mv.addObject("ward_ok", ward_ok);
                mv.addObject("mno", mno);
            }
            Board board = board_allService.getBoard(boardNum);

            /* 날짜 포맷 변경 시작 */
            // JSTL 날짜 변경 라이브러리를 사용할 경우 아래와 같은 작업이 필요없다.
            Date date = board.getBoard_date();
            SimpleDateFormat b_date = new SimpleDateFormat("yyyy년 M월 d일 E요일 a h:mm");
            mv.addObject("board_date", b_date.format(date));
            /* 날짜 포맷 변경 끝 */

            /* 리플 관련 시작*/
            List<B_reply> reList = board_allService.getReplyList(boardNum);

            for(B_reply reply :reList) {
                System.out.println(reply.getB_reply_like_member());
                List<String> reLikeMem_arr = List.of(reply.getB_reply_like_member().split(","));
                //split해서 배열로 각각 넣은 후 contains
                if (mno != null) {
                    if (reLikeMem_arr.contains(mno)) {
                        reply.setB_reply_like_ok("true");
                    } else {
                        reply.setB_reply_like_ok("false");
                    }
                }
            }

            mv.addObject("reList", reList);
           /* 리플 관련 끝 */

            mv.addObject("article", board);
            mv.addObject("page", page);
            mv.setViewName("board/boardDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }


    /* 게시판에서 게시물 검색 */
    @GetMapping(value = "board_search")
    public ModelAndView board_search(@ModelAttribute Board board, @RequestParam(value = "page", defaultValue = "1") int page) {

        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            String type = board.getBoard_type();
            switch (type) {
                case "1": {
                    List<Board> articleList = board_allService.getBoardList_search_subject(page, pageInfo, board);
                    mv.addObject("articleList", articleList);
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
            }
            mv.addObject("pageInfo", pageInfo);
            mv.setViewName("board/boardForm_all");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 게시판 리스트 (최신순 정렬) */
    @RequestMapping(value = "/boardlist", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardlist(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_allService.getBoardList(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "boardlist");
            mv.setViewName("board/boardForm_all");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 조회수순 정렬 */
    @GetMapping(value = "board_all_viewssort")
    public ModelAndView board_all_viewssort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_allService.getBoardList_viewsSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "viewssort");
            mv.setViewName("board/boardForm_all");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 댓글순 정렬 */
    @GetMapping(value = "board_all_replysort")
    public ModelAndView board_all_replysort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_allService.getBoardList_replySort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "replysort");
            mv.setViewName("board/boardForm_all");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 좋아요순 정렬 */
    @GetMapping(value = "board_all_likesort")
    public ModelAndView board_all_likesort(@RequestParam(value = "page", defaultValue = "1") int page) {
        ModelAndView mv = new ModelAndView();
        PageInfo pageInfo = new PageInfo();
        try {
            List<Board> articleList = board_allService.getBoardList_likeSort(page, pageInfo);
            mv.addObject("pageInfo", pageInfo);
            mv.addObject("articleList", articleList);
            mv.addObject("sort_name", "likesort");
            mv.setViewName("board/boardForm_all");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 좋아요 버튼 on */
    @GetMapping(value = "/like_on")
    public ModelAndView like_on(@RequestParam(value = "board_num", required = false) int boardNum, @RequestParam(value = "mno") String mno) {
        ModelAndView mv = new ModelAndView();
        try {
            //article_like에서 mno를 추가하는 서비스
            board_allService.like_ins_mno(boardNum, mno);
            mv.setViewName("board/boardDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 좋아요 버튼 off */
    @GetMapping(value = "/like_off")
    public ModelAndView like_off(@RequestParam(value = "board_num", required = false) int boardNum, @RequestParam(value = "mno") String mno) {
        ModelAndView mv = new ModelAndView();
        try {
            //article_like에서 mno를 제거하는 서비스
            board_allService.like_del_mno(boardNum, mno);
            mv.setViewName("board/boardDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 즐겨찾기 버튼 on */
    @GetMapping(value = "/ward_on")
    public ModelAndView ward_on(@RequestParam(value = "board_num", required = false) int boardNum, @RequestParam(value = "mno") String mno) {
        ModelAndView mv = new ModelAndView();
        try {
            board_allService.ward_ins_mno(boardNum, mno);
            mv.setViewName("board/boardDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 즐겨찾기 버튼 off */
    @GetMapping(value = "/ward_off")
    public ModelAndView ward_off(@RequestParam(value = "board_num", required = false) int boardNum, @RequestParam(value = "mno") String mno) {
        ModelAndView mv = new ModelAndView();
        try {
            board_allService.ward_del_mno(boardNum, mno);
            mv.setViewName("board/boardDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("err", e.getMessage());
        }
        return mv;
    }

    /* 다운로드, 현재 미사용 상태지만 살려둠 */
    @GetMapping(value = "/file_down")
    public void filedownload(@RequestParam(value = "downFile") String filename, HttpServletRequest request,
                             HttpServletResponse response) {
        String path = servletContext.getRealPath("/board_upload/video/");
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

    /* 동영상 출력 */
    @GetMapping(value = "/video_view/{filename}")
    public void video_view(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
        String path = servletContext.getRealPath("/board_upload/video/");
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

    /* 썸네일 출력 */
    @GetMapping(value = "/thumbnail_view/{filename}")
    public void thumbnail_view(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
        String path = servletContext.getRealPath("/board_upload/image/");
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

    /* UUID 생성 */
    public static class UUIDgeneration {
        public String getUUID() {
            // UUID 생성
            String uuid = UUID.randomUUID().toString();
            System.out.println(uuid);
            // "-" 하이픈 제외
            uuid = uuid.replace("-", "");
            System.out.println(uuid);
            return uuid;
        }
    }

    /* 게시판 ajax 페이지 */
    @RequestMapping(value = "boardForm_all_ajax", method = {RequestMethod.GET, RequestMethod.POST})
    public String boardForm_all_ajax(@RequestParam(value = "page", defaultValue = "1") int page,
                                     @RequestParam(value = "sort") String sort,
                                     HttpServletRequest request, HttpSession session) {
        PageInfo pageInfo = new PageInfo();
        try {
            if (Objects.equals(sort, "boardlist")) {
                List<Board> articleList = board_allService.getBoardList(page, pageInfo);
                request.setAttribute("articleList", articleList);
            } else if (Objects.equals(sort, "viewssort")) {
                List<Board> articleList = board_allService.getBoardList_viewsSort(page, pageInfo);
                request.setAttribute("articleList", articleList);
            } else if (Objects.equals(sort, "replysort")) {
                List<Board> articleList = board_allService.getBoardList_replySort(page, pageInfo);
                request.setAttribute("articleList", articleList);
            } else if (Objects.equals(sort, "likesort")) {
                List<Board> articleList = board_allService.getBoardList_likeSort(page, pageInfo);
                request.setAttribute("articleList", articleList);
            }
            request.setAttribute("pageInfo", pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", e.getMessage());
        }
        return "board/boardForm_all_ajax";
    }

    /* 댓글 작성 */
    @ResponseBody
    @RequestMapping(value = "regreply", method = {RequestMethod.GET, RequestMethod.POST})
    public void regreply(@RequestParam(value = "b_board_num") int boardNum,
                         @RequestParam(value = "b_reply_content") String b_reply_content) {
        B_reply b_reply = new B_reply();
        try {

            String board_nickname = (String) session.getAttribute("mem_nickname");
            b_reply.setB_reply_nickname(board_nickname);
            b_reply.setB_board_num(boardNum);
            b_reply.setB_reply_content(b_reply_content);
            System.out.println("게시물번호 : "+boardNum);
            System.out.println("댓글 내용 : "+b_reply_content);
            board_allService.regReply(b_reply);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* 대댓글 작성 */
    @ResponseBody
    @RequestMapping(value = "re_regreply", method = {RequestMethod.GET, RequestMethod.POST})
    public void re_regreply(@RequestParam(value = "b_board_num") int boardNum,
                            @RequestParam(value = "b_reply_num") int b_reply_num,
                            @RequestParam(value = "b_reply_content") String b_reply_content) {
        B_reply b_reply = new B_reply();
        try {

            String board_nickname = (String) session.getAttribute("mem_nickname");
            b_reply.setB_reply_nickname(board_nickname);
            b_reply.setB_board_num(boardNum);
            b_reply.setB_reply_num(b_reply_num);
            b_reply.setB_reply_content(b_reply_content);
            System.out.println("게시물 번호 : "+boardNum);
            System.out.println("대댓글번호 : "+b_reply_num);
            System.out.println("대댓글 내용 : "+b_reply_content);
            board_allService.re_regReply(b_reply);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* 댓글 삭제 */
    @ResponseBody
    @RequestMapping(value = "replydelete", method = {RequestMethod.GET, RequestMethod.POST})
    public void replydelete(@RequestParam(value = "b_reply_num") int b_reply_num) {
        try {
            board_allService.delReply(b_reply_num);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* 댓글 좋아요 버튼 on */
    @ResponseBody
    @RequestMapping(value = "/re_like_on", method = {RequestMethod.GET, RequestMethod.POST})
    public void re_regreply(@RequestParam(value = "b_reply_num") int b_reply_num,
                            @RequestParam(value = "mno") String mno) {
        try {
            /* b_reply_like_member에 mno를 추가해주는 서비스 */
            /* 추가시 b_reply_likecount도 +1 */
            System.out.println("댓글좋아요on ajax 전달 테스트(댓글번호) : " + b_reply_num);
            System.out.println("댓글좋아요on ajax 전달 테스트(회원번호) : " + mno);
            board_allService.re_like_ins_mno(b_reply_num,mno);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* 댓글 좋아요 버튼 off */
    @ResponseBody
    @RequestMapping(value = "/re_like_off", method = {RequestMethod.GET, RequestMethod.POST})
    public void re_like_off(@RequestParam(value = "b_reply_num") int b_reply_num,
                            @RequestParam(value = "mno") String mno) {
        try {
            /* b_reply_like_member에 mno를 제거해주는 서비스 */
            /* 제거시 b_reply_likecount도 -1 */
            System.out.println("댓글좋아요off ajax 전달 테스트(댓글번호) : " + b_reply_num);
            System.out.println("댓글좋아요off ajax 전달 테스트(회원번호) : " + mno);
            board_allService.re_like_del_mno(b_reply_num,mno);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /* 댓글 ajax 페이지 */
    @RequestMapping(value = "boardDetail_ajax", method = {RequestMethod.GET, RequestMethod.POST})
    public String boardDetail_ajax(@RequestParam(value = "board_num") int boardNum,
                                     HttpServletRequest request, HttpSession session) {

        try {
            // 인기순 정렬로 서비스를 요청해야한다
            List<B_reply> reList = board_allService.getReplyList_like(boardNum);

            String mno = String.valueOf(session.getAttribute("mem_mno"));

            for(B_reply reply :reList) {
                System.out.println(reply.getB_reply_like_member());
                List<String> reLikeMem_arr = List.of(reply.getB_reply_like_member().split(","));
                //split해서 배열로 각각 넣은 후 contains
                if (mno != null) {
                    if (reLikeMem_arr.contains(mno)) {
                        reply.setB_reply_like_ok("true");
                        System.out.println("있어요");
                    } else {
                        reply.setB_reply_like_ok("false");
                        System.out.println("없어요");
                    }
                }
            }
            request.setAttribute("reList", reList);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", e.getMessage());
        }
        return "board/boardDetail_ajax";
    }


    /* 뷰 확인용 */
//    @RequestMapping(value="/custom/{pageName}")
//    public String getSinglePage(@PathVariable("pageName")String pageName){
//        return "/custom/"+pageName;
//    }

//    @GetMapping("/viewtest")
//    public String viewTest() {
//        return "board/layout_boardForm_all";
//    }

}
