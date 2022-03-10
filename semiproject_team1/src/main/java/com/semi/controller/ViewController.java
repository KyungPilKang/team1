package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewController {

	@GetMapping("/")
	public String main() {
		return "main/main";
	}
	@RequestMapping(value = "/login") 
	public ModelAndView login(@RequestParam("page")String page) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("page", page);
		mav.setViewName("login/loginForm");
		return mav; 
	}
//	@GetMapping("login")
//	public String login() {
//		return "login/loginForm";
//	}

	@RequestMapping(value = "/kakao")
	public String join() { return "login/kakao"; }
	
	@RequestMapping(value = "/joinForm1")
	public String join1() {return "login/joinForm1";}
	
	@RequestMapping(value = "/joinForm2")
	public String join2() {return "login/joinForm2";}

	@RequestMapping(value = "/recoverForm1")
	public String recoverForm1() {return "login/recoverForm1";}
	
	@RequestMapping(value = "/test2")
	public String test() {return "login/test2";}
}
