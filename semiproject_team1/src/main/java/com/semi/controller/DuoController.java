package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DuoController {
	
	@GetMapping("/duoform")
	public String duoform() {
		return "duo/duoForm";
	}
}
