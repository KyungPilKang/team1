package com.semi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.semi.dto.Duo;
import com.semi.dto.Member;
import com.semi.service.DuoService;
import com.semi.service.MemberService;
import com.semi.service.MypageService;

@Controller
public class DuoController {
	@Autowired
	HttpSession session;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	DuoService duoService;

	@GetMapping("duoform")
	public String duoForm() {
		Member mem=null;
		String view=null;
		try {
			mem=memberService.selectMemeber_bymno((Integer)session.getAttribute("mem_mno"));
			System.out.println(mem.getMem_duo_reg_ok());
			session.setAttribute("mem_duo_reg_ok", mem.getMem_duo_reg_ok());
			if(mem.getMem_link_confirm().equals("no")) {
				view="redirect:/mypage?duo_reg_ok=no";
			} else {
				view="duo/duoForm";
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return view;
	}
	
	@GetMapping("duoregform")
	public String duoRegForm(Model model, @RequestParam(value="duo_reg_ok", required=false, defaultValue="none")String duo_reg_ok) {
		Member mem=null;
		Map<String, String> tier_map=new HashMap<>();
		Map<String, String> champ_map=new HashMap<>();
		model.addAttribute("duo_reg_ok", duo_reg_ok);
		try {
			mem=memberService.selectMemeber_bymno((Integer)session.getAttribute("mem_mno"));
			model.addAttribute("mem", mem);
			
			if(mem.getMem_link_confirm().equals("yes")) {
				//롤 티어 정보
				tier_map=mypageService.selectTier((Integer)session.getAttribute("mem_mno"));
				model.addAttribute("lol_tier", tier_map.get("lol_tier"));
				model.addAttribute("lol_rank", tier_map.get("lol_rank"));
				
				//롤 승률 정보
				model.addAttribute("lol_rate", tier_map.get("lol_rate"));
				
				//모스트 챔피언 정보
				champ_map=mypageService.selectChamp((Integer)session.getAttribute("mem_mno"));
				model.addAttribute("most1", champ_map.get("most1"));
				model.addAttribute("most2", champ_map.get("most2"));
				model.addAttribute("most3", champ_map.get("most3"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "duo/duoregForm";
	}
	
	@GetMapping("duoeditform")
	public String duoEditForm(Model model) {
		Member mem=null;
		Map<String, String> tier_map=new HashMap<>();
		Map<String, String> champ_map=new HashMap<>();
		try {
			mem=memberService.selectMemeber_bymno((Integer)session.getAttribute("mem_mno"));
			model.addAttribute("mem", mem);
			
			if(mem.getMem_link_confirm().equals("yes")) {
				//롤 티어 정보
				tier_map=mypageService.selectTier((Integer)session.getAttribute("mem_mno"));
				model.addAttribute("lol_tier", tier_map.get("lol_tier"));
				model.addAttribute("lol_rank", tier_map.get("lol_rank"));
				
				//롤 승률 정보
				model.addAttribute("lol_rate", tier_map.get("lol_rate"));
				
				//모스트 챔피언 정보
				champ_map=mypageService.selectChamp((Integer)session.getAttribute("mem_mno"));
				model.addAttribute("most1", champ_map.get("most1"));
				model.addAttribute("most2", champ_map.get("most2"));
				model.addAttribute("most3", champ_map.get("most3"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "duo/duoeditForm";
	}
	
	@GetMapping("duosearchform")
	public String duoSearchForm(Model model) {
		List<Duo> duoList=new ArrayList<>();
		try {
			duoList=duoService.selectDuoList();
			model.addAttribute("duoList", duoList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "duo/duosearchForm";
	}
	
	@PostMapping("/duoreg")
	public ModelAndView duoReg(@ModelAttribute Duo duo) {
		ModelAndView mav=new ModelAndView();
		Member mem=null;
		try {
			mem=memberService.selectMemeber_bymno((Integer)session.getAttribute("mem_mno"));
			memberService.updateMem_reg_ok(duo.getDuo_nickname());
			duoService.insertDuo(duo, mem);
			mav.setViewName("redirect:/duoform");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@PostMapping("/duoupdate")
	public ModelAndView duoUpdate(@ModelAttribute Duo duo) {
		ModelAndView mav=new ModelAndView();
		try {
			duoService.updateDuo(duo);
			mav.setViewName("redirect:/duoform");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@GetMapping("/duodetail")
	public ModelAndView duoDetail(@RequestParam("duo_nickname")String duo_nickname) {
		ModelAndView mav=new ModelAndView();
		Duo duo;
		try {
			duo=duoService.selectDuo(duo_nickname);
			mav.addObject("detail", duo);
			mav.setViewName("duo/duodetailForm");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
