package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//메인 페이지 컨트롤러
@Controller
public class MainpageController {

	@GetMapping("/")
	public String main1() {
		return "main/main1";
	}
	
	@GetMapping("/main")
	public String main() {
		return "main/main";
	}
}
