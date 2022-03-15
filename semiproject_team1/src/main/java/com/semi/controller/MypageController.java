package com.semi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.semi.api.riotapi.LOL_champion;
import com.semi.api.riotapi.RiotAPI;
import com.semi.dto.Board;
import com.semi.dto.Feedback;
import com.semi.dto.Member;
import com.semi.dto.PageInfo;
import com.semi.service.Board_allService;
import com.semi.service.MemberService;
import com.semi.service.MypageService;

@Controller
public class MypageController {
	@Autowired
	RiotAPI riotapi;
	
	@Autowired
	LOL_champion champion;
	
	@Autowired
	private Board_allService board_allService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	MypageService mypageService;
		
	
	@ResponseBody
	@GetMapping("/statustest")
	public String statustest(@RequestParam(value="mem_link_id")String mem_link_id) {
		String result;
		Map<String, String> map=new HashMap<>();
		map=riotapi.status(riotapi.getIdCode(mem_link_id));
		System.out.println(map);
		result="티어: "+map.get("tier")+"("+map.get("rank")+")"+" 승: "+map.get("wins")+" 패: "+map.get("losses");
		return result;
	}
	
	@ResponseBody
	@GetMapping("/mosttest")
	public String mosttest(@RequestParam(value="mem_link_id")String mem_link_id) {
		Map<Integer, String> map=new HashMap<>();
		map=riotapi.mostChampion(riotapi.getIdCode(mem_link_id));
		System.out.println(map);
		return champion.getChampionName(Integer.parseInt(map.get(0)));
	}
	
	@GetMapping("mypage")
	public ModelAndView mypage(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value="duo_reg_ok", required=false, defaultValue="yes")String duo_reg_ok) {
		ModelAndView mv = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		Member mem=null;
		Map<String, String> tier_map=new HashMap<>();
		Map<String, String> champ_map=new HashMap<>();
		mv.addObject("duo_reg_ok", duo_reg_ok);
		try {
			mem=memberService.selectMemeber_bymno((Integer)session.getAttribute("mem_mno"));
			mv.addObject("mem", mem);
			
			if(mem.getMem_link_confirm().equals("yes")) {
				//롤 티어 정보
				tier_map=mypageService.selectTier((Integer)session.getAttribute("mem_mno"));
				mv.addObject("lol_tier", tier_map.get("lol_tier"));
				mv.addObject("lol_rank", tier_map.get("lol_rank"));
				mv.addObject("lol_point", tier_map.get("lol_point"));
				
				//롤 승률 정보
				mv.addObject("lol_wins", tier_map.get("lol_wins"));
				mv.addObject("lol_losses", tier_map.get("lol_losses"));
				mv.addObject("lol_rate", tier_map.get("lol_rate"));
				
				//모스트 챔피언 정보
				champ_map=mypageService.selectChamp((Integer)session.getAttribute("mem_mno"));
				mv.addObject("most1", champ_map.get("most1"));
				mv.addObject("most2", champ_map.get("most2"));
				mv.addObject("most3", champ_map.get("most3"));
			}
			
			//내가쓴 게시글 리스트
			List<Board> articleList = mypageService.selectBoardList_mine((Integer)session.getAttribute("mem_mno"));
			mv.addObject("articleList", articleList);
			mv.setViewName("mypage/mypage");
			
			//와드 누른 게시글 리스트
			List<Board> articleList_ward = mypageService.selectBoardList_ward((Integer)session.getAttribute("mem_mno"));
			mv.addObject("articleList_ward", articleList_ward);
			mv.setViewName("mypage/mypage");
			
			//내가쓴 피드백 리스트
			List<Feedback> articleList_feedback = mypageService.selectFeedbackList_mine((Integer)session.getAttribute("mem_mno"));
			mv.addObject("articleList_feedback", articleList_feedback);
			mv.setViewName("mypage/mypage");
			
			
			//롤 판독 티어 정보
			mv.addObject("mem_score", memberService.selectMem_score((Integer)session.getAttribute("mem_mno")));
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
		}
		return mv;
	}
	
	@GetMapping("mypage_admin")
	public ModelAndView mypage_admin(@RequestParam(value = "page", defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		Member mem=null;
		try {
			mem=memberService.selectMemeber_bymno((Integer)session.getAttribute("mem_mno"));
			mv.addObject("mem", mem);
			
			//게시판 리스트
			List<Member> memList = memberService.link_member_list();
			mv.addObject("memList", memList);
			mv.setViewName("mypage/mypageAdmin");
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping("idlink")
	public String idLink(@RequestBody Member mem) {
		mem.setMem_mno((Integer)session.getAttribute("mem_mno"));
		try {
			mypageService.idLink(mem);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mem.getMem_link_id();
	}
	
	@ResponseBody
	@PostMapping("codeconfirm")
	public ResponseEntity<?> codeConfirm(@RequestBody Member mem) {
		mem.setMem_mno((Integer)session.getAttribute("mem_mno"));
		Member result;
		try {
			result=memberService.selectMemeber_bymno(mem.getMem_mno());
			if(mypageService.codeConfirm(mem)) {
			} 
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<String>(result.getMem_link_id(), HttpStatus.OK);
	}
	
	@PostMapping("/admin_confirm")
	public String adminConfirm(@ModelAttribute Member mem) {
		Member result;
		try {
			if(mem.getMem_email_id()!=null) {
				result=memberService.selectMemeber(mem.getMem_email_id());
			}else {
				result=memberService.selelctMember_bykakao(mem.getMem_kakao_id());
			}
			mypageService.adminConfirm(result.getMem_mno());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage_admin";
	}
}
