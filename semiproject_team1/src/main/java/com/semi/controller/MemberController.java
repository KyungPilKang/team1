package com.semi.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.semi.dto.Member;
import com.semi.service.MemberServiceImpl;

@Controller
public class MemberController {
	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	HttpSession session;
	
	@PostMapping(value="/login")
	public ModelAndView login(@RequestParam Map<String,String> info) {
		ModelAndView modelAndView=new ModelAndView("login/test");
		try {
			String mem_email_id=info.get("mem_email_id");
			String mem_pw=info.get("mem_pw");
			if(memberService.accessMember(mem_email_id, mem_pw)) {
				session.setAttribute("mem_email_id", mem_email_id);
				modelAndView.addObject("success", "로그인성공");
			} else throw new Exception();
		} catch(EmptyResultDataAccessException e) {
			modelAndView.addObject("fail", "로그인실패");
			
		} catch(Exception e){
			modelAndView.addObject("fail2", "실패");
		}
		return modelAndView;
	}
	
	@ResponseBody
	@PostMapping(value="/emailCheck")
	public String emailOverlap(@RequestParam(value="mem_email_id", required=true)String mem_email_id) {
		boolean overlap=false;
		try {
			overlap=memberService.emailOverlap(mem_email_id);
		} catch(Exception e) {
		}
		return String.valueOf(overlap);
	}
	
	@ResponseBody
	@PostMapping(value="/nickCheck")
	public String nickOverlap(@RequestParam(value="mem_nickname", required=true)String mem_nickname) {
		boolean overlap=false;
		try {
			overlap=memberService.nickOverlap(mem_nickname);
		} catch(Exception e) {
		}
		return String.valueOf(overlap);
	}
	
	@PostMapping("join")
	public ModelAndView join(@ModelAttribute Member member) {
		ModelAndView mav = new ModelAndView();
		try {
			memberService.insertMember(member);
		} catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("login/join_certifyForm");
		return mav;
	}
	
}
