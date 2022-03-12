package com.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.semi.dto.Member;
import com.semi.service.MemberService;

@Controller
public class ViewController {
	@Autowired
	HttpSession session;
	
	@Autowired
	MemberService memberService;

	@GetMapping(value = "/loginform") 
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
	public String join1(@RequestParam(value="kakao", required=false, defaultValue="no")String kakao,
			Model model) {
		model.addAttribute("kakao", kakao);
		return "login/joinForm1";
	}
	
	@RequestMapping(value = "/joinForm2")
	public String join2() {return "login/joinForm2";}

	@RequestMapping(value = "/recoverForm1")
	public String recoverForm1() {return "login/recoverForm1";}
	
	@RequestMapping(value = "/test2")
	public String test() {return "login/test2";}
	
	@GetMapping("idlinkform")
	public String idLink() {
		return "mypage/idLinkForm";
	}
	
	@GetMapping("codeconfirmform")
	public String codeConfirm(Model model) {
		Member result;
		try {
			result=memberService.selectMemeber_bymno((Integer)session.getAttribute("mem_mno"));
			model.addAttribute("mem", result);
		} catch(Exception e) {
		}
		return "mypage/codeConfirmForm";
	}
}
