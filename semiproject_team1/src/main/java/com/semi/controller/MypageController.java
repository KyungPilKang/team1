package com.semi.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.api.riotapi.RiotAPI;

@Controller
public class MypageController {
	@Autowired
	RiotAPI riotapi;
		
	
	@ResponseBody
	@GetMapping("/statustest")
	public String statustest(@RequestParam(value="mem_link_id")String mem_link_id) {
		String result;
		Map<String, String> map=new HashMap<>();
		map=riotapi.status(riotapi.getIdCode(mem_link_id));
		result="티어: "+map.get("tier")+"("+map.get("rank")+")"+" 승: "+map.get("wins")+" 패: "+map.get("losses");
		return result;
	}
	
}
