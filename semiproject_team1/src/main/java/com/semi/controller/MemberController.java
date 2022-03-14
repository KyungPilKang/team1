package com.semi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.semi.dto.Member;
import com.semi.service.MemberServiceImpl;
import com.semi.service.MypageService;

@Controller
public class MemberController {
	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
    private ServletContext servletContext;
	
	@Autowired
	MypageService mypageService;
	
	@ResponseBody
	@PostMapping(value="/login")
	public ResponseEntity<?> login(@RequestBody Member mem) {
		Map<String, Object> map=new HashMap<>();
		Map<String, String> tier_map=new HashMap<>();
		try {
			if(memberService.accessMember(mem.getMem_email_id(), mem.getMem_pw())) {
				Member result=memberService.selectMemeber(mem.getMem_email_id());
				if(result.getMem_type().equals("admin")) {
					System.out.println("여기로 왔음");
					session.setAttribute("mem_mno", result.getMem_mno());
					session.setAttribute("mem_nickname", result.getMem_nickname());
					result.setPage("admin");
					map.put("mem", result);
				}else {
					if(result.getMem_code_confirm().equals("yes")) {
						session.setAttribute("mem_mno", result.getMem_mno());
						session.setAttribute("mem_nickname", result.getMem_nickname());
						if(result.getMem_link_confirm().equals("yes")) {
							tier_map=mypageService.selectTier((Integer)session.getAttribute("mem_mno"));
							session.setAttribute("my_tier", tier_map.get("lol_tier"));
						} else {
							session.setAttribute("my_tier", "none");
						}
					}
					result.setPage(mem.getPage());
					map.put("mem", result);
				}
			}
		} catch(Exception e){
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	@GetMapping(value="/kakao_login")
	public String kakao_login(@RequestParam("mem_email_id")String mem_email_id,
			@RequestParam("page")String page, Model model) {
		Map<String, String> tier_map=new HashMap<>();
		Member mem=null;
		Member result=null;
		try {
			mem=memberService.selelctMember_bykakao(mem_email_id);
			mem.setPage(page);
			if(mem!=null) {
				result=memberService.selelctMember_bykakao(mem_email_id);
				if(result.getMem_type().equals("admin")) {
					session.setAttribute("mem_mno", result.getMem_mno());
					session.setAttribute("mem_nickname", result.getMem_nickname());
					result.setPage("admin");
					model.addAttribute("mem", result);
				}else {
					if(result.getMem_code_confirm().equals("yes")) {
						session.setAttribute("mem_mno", result.getMem_mno());
						session.setAttribute("mem_nickname", result.getMem_nickname());
						result.setPage(mem.getPage());
						model.addAttribute("mem", result);
						if(result.getMem_link_confirm().equals("yes")) {
							tier_map=mypageService.selectTier(result.getMem_mno());
							session.setAttribute("my_tier", tier_map.get("lol_tier"));
						} else {
							session.setAttribute("my_tier", "none");
						}
					}
				}
			}
		} catch(Exception e){
			e.printStackTrace();
			return "redirect:/joinForm1?kakao=yes&id="+mem_email_id;
		}
		if(result.getPage().equals("main")) {
			return "redirect:/main";
		} else if(result.getPage().equals("board")) {
			return "redirect:/boardlist";
		} else {
			return "redirect:/feedback";
		}
	}
	
	@GetMapping(value="/log_out")
	public ModelAndView logout(@RequestParam("page") String page) {
		ModelAndView mav=new ModelAndView();
		session.invalidate();
		if(page.equals("main")) {
			mav.setViewName("redirect:/main");
		} else if(page.equals("board")) {
			mav.setViewName("redirect:/boardlist");
		} else {
			mav.setViewName("redirect:/feedback");
		}
		return mav;
	}
	
//	@RequestMapping(value = "/join_certifyForm")
//	public ModelAndView join_certifyForm(@RequestParam) {return "login/join_certifyForm";}
	
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
	public ModelAndView join(@ModelAttribute Member mem) {
		ModelAndView mav = new ModelAndView();
		try {
			memberService.insertMember(mem);
			Member result=memberService.selectMemeber(mem.getMem_email_id());
			mav.addObject("mem_mno", result.getMem_mno());
		} catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("login/join_certifyForm");
		return mav;
	}
	
	@PostMapping("join_kakao")
	public ModelAndView join_kakao(@ModelAttribute Member mem) {
		ModelAndView mav = new ModelAndView();
		try {
			memberService.insertMember_kakao(mem);
		} catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:/loginform?page=main");
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
	
	@GetMapping(value = "/join_certifyForm")
	public String join_certifyForm(@RequestParam("mem_mno")int mem_mno, Model model,
			@RequestParam(value="ok", required=false, defaultValue="yes")String ok,
			@RequestParam(value="re", required=false, defaultValue="no")String re) {
		model.addAttribute("mem_mno", mem_mno);
		if(ok.equals("no")) {
			model.addAttribute("ok", ok);
		}
		if(re.equals("yes")) {
			model.addAttribute("re", re);
		}
		return "login/join_certifyForm";
	}
	
	@PostMapping("join_certify")
	public ModelAndView join_certify(@ModelAttribute Member mem) {
		ModelAndView mav=new ModelAndView();
		try {
			Member result=memberService.selectMemeber_bymno(mem.getMem_mno());
			if(result.getMem_code().equals(mem.getMem_code())) {
				memberService.updateMem_code_confirm(mem.getMem_mno());
				mav.setViewName("redirect:/loginform?page=main");
			} else {
				mav.addObject("mem_mno", mem.getMem_mno());
				mav.addObject("ok", "no");
				mav.setViewName("redirect:/join_certifyForm");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@PostMapping("re_join_certify")
	public ModelAndView re_join_certify(@RequestParam("mem_mno")int mem_mno) {
		ModelAndView mav=new ModelAndView();
		try {
			memberService.updateMem_code(mem_mno);
			mav.addObject("re", "yes");
			mav.setViewName("redirect:/join_certifyForm?mem_mno="+mem_mno);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
}
