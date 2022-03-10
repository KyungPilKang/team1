package com.semi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@Autowired
    private ServletContext servletContext;
	
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
	
	@GetMapping(value = "/join/{filename}")
    public void video_view(@PathVariable String filename, HttpServletRequest request, HttpServletResponse response) {
        String path = servletContext.getRealPath("/smtp_image/");
        /* 즉, file은 semiproject_team1/src/main/webapp/board_upload/video/filename */
        File file = new File(path + filename);
        String sfilename = null;
        FileInputStream fis = null;

        try {
            /* HttpServletRequest request */
            if (request.getHeader("User-Agent").indexOf("MSIE") > -1) {
                sfilename = URLEncoder.encode(file.getName(), "utf-8");
            } else {
                sfilename = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
            }
            /* HttpServletResponse response */
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/octet-stream;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + sfilename);

            OutputStream out = response.getOutputStream();
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
	
}
