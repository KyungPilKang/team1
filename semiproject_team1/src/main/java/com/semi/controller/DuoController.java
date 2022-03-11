package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DuoController {

	@GetMapping("/duoform1")
	public String duoForm1() {
		return "duo/duoForm1";
	}

	@GetMapping("/duoform")
	public String duoForm() {
		return "duo/duoForm";
	}

	@GetMapping("/duoform2")
	public String duoForm2() {
		return "duo/duoForm2";
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
