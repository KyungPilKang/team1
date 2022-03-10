package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DuoController {
	
	@GetMapping("/duoform")
	public String duoForm() {
		return "duo/duoForm";
	}
	
	@GetMapping("/duoregform")
	public String duoRegForm() {
		return "duo/duoregForm";
	}
	
	@GetMapping("/duodetailform")
	public String duoDetailForm() {
		return "duo/duodetailForm";
	}
}
