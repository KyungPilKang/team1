package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FeedbackController {
	
	 @GetMapping("/feedbackform_all")
	    public String feedbackform_all() {
	        return "feedbackForm_all";
	    }
	 
	 @GetMapping("/feedbackwriteform")
	 	public String feedbackwriteform() {
		 return "feedbackwriteForm";
	 }
}
