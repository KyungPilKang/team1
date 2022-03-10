package com.semi.controller;

import com.semi.dto.Board;
import com.semi.dto.PageInfo;
import com.semi.service.Board_allService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class FeedbackController {

	@Autowired
	private Board_allService board_allService;

	@Autowired
	private ServletContext servletContext;

	@Autowired
	HttpSession session;


	/* 게시판 리스트 (최신순 정렬) */
	@RequestMapping(value = "/feedback", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView feedback(@RequestParam(value = "page", defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Board> articleList = board_allService.getBoardList(page, pageInfo);
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("articleList", articleList);
			mv.addObject("sort_name", "boardlist");
			mv.setViewName("feedback/feedbackForm");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
		}
		return mv;
	}





















	@GetMapping("/feedbackform_all")
	    public String feedbackform_all() {
	        return "feedbackForm_all";
	    }
	 
	 @GetMapping("/feedbackwriteform")
	 	public String feedbackwriteform() {
		 return "feedbackwriteForm";
	 }
}
