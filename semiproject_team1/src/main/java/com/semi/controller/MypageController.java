package com.semi.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.api.riotapi.LOL_champion;
import com.semi.api.riotapi.RiotAPI;

@Controller
public class MypageController {
	@Autowired
	RiotAPI riotapi;
	
	@Autowired
	LOL_champion champion;
		
	
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
		return champion.getChampionName(map.get(0));
	}
	
}
