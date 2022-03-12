package com.semi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		return champion.getChampionName(Integer.parseInt(map.get(0)));
	}
	
	@GetMapping("mypage")
	public ModelAndView mypage(@RequestParam(value = "page", defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		Member mem=null;
		Map<String, String> tier_map=new HashMap<>();
		Map<String, String> champ_map=new HashMap<>();
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
			
			//롤 판독 티어 정보
			mv.addObject("mem_score", memberService.selectMem_score((Integer)session.getAttribute("mem_mno")));
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
			} else new Exception();
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("에러 발생", HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<String>(result.getMem_link_id(), HttpStatus.OK);
	}
}
