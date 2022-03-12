package com.semi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.semi.api.riotapi.LOL_champion;
import com.semi.api.riotapi.RiotAPI;
import com.semi.dto.Board;
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
		return champion.getChampionName(map.get(2));
	}
	
	@GetMapping("mypage")
	public ModelAndView mypage(@RequestParam(value = "page", defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		int mem_score=0;
		Member mem=null;
		String lol_tier=null;
		String lol_rank=null;
		String lol_point=null;
		String lol_wins=null;
		String lol_losses=null;
		String lol_rate=null;
		Map<String, String> map=new HashMap<>();
		try {
			mem=memberService.selectMemeber_bymno((Integer)session.getAttribute("mem_mno"));
			mv.addObject("mem", mem);
			
			//게시판 리스트
			List<Board> articleList = board_allService.getBoardList(page, pageInfo);
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("articleList", articleList);
			mv.addObject("sort_name", "boardlist");
			mv.setViewName("mypage/mypage");
			
			//롤 티어 정보
			map=mypageService.selectTier((Integer)session.getAttribute("mem_mno"));
			lol_tier=map.get("lol_tier");
			lol_rank=map.get("lol_rank");
			lol_point=map.get("lol_point");
			mv.addObject("lol_tier", lol_tier);
			mv.addObject("lol_rank", lol_rank);
			mv.addObject("lol_point", lol_point);
			
			//롤 승률 정보
			lol_wins=map.get("lol_wins");
			lol_losses=map.get("lol_losses");
			lol_rate=map.get("lol_rate");
			mv.addObject("lol_wins", lol_wins);
			mv.addObject("lol_losses", lol_losses);
			mv.addObject("lol_rate", lol_rate);
			
			//롤 판독 티어 정보
			mem_score=memberService.selectMem_score((Integer)session.getAttribute("mem_mno"));
			mv.addObject("mem_score", mem_score);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
		}
		return mv;
	}
}
