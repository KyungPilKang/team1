package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@GetMapping("/")
	public String main() {
		return "main/main";
	}
	@RequestMapping(value = "/login") 
	public String login() { return "login/loginForm"; }

	@RequestMapping(value = "/kakao")
	public String join() { return "login/kakao"; }
	
	@RequestMapping(value = "/joinForm1")
	public String join1() {return "login/joinForm1";}
	
	@RequestMapping(value = "/joinForm2")
	public String join2() {return "login/joinForm2";}

	@RequestMapping(value = "/recoverForm1")
	public String recoverForm1() {return "login/recoverForm1";}
	
	@RequestMapping(value = "/join_certifyForm")
	public String join_certifyForm() {return "login/join_certifyForm";}
	
	@RequestMapping(value = "/test2")
	public String test() {return "login/test2";}
}
