package com.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.semi.service.FeedbackService;

//메인 페이지 컨트롤러
@Controller
public class MainpageController {
	@Autowired
	FeedbackService feedbackService;

	@GetMapping("/")
	public String main1() {
		return "main/main1";
	}
	
	@GetMapping("/main")
	public String main(Model model) {
		try {
			model.addAttribute("article", feedbackService.selectFeedback_bestlike());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "main/main";
	}
	
	@GetMapping("/main_admin")
	public String main_admin(Model model) {
		try {
			model.addAttribute("article", feedbackService.selectFeedback_bestlike());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "main/mainAdmin";
	}
}
