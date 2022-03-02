package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController 
{

	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public String login() { return "login/recoverForm2"; }

	@GetMapping("/login")
	public String test() {
		return "login/joinForm2";
	}

	
}
