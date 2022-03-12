package com.semi.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.api.riotapi.RiotAPI;
import com.semi.dto.Member;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	RiotAPI riotapi;
	
	@Autowired
	MemberService memberService;

	@Override
	public Map<String, String> selectTier(int mno) throws Exception {
		Map<String, String> map=new HashMap<>();
		Member mem=null;
		Map<String, String> result=new HashMap<>();
		String selectId;
		String rate;
		float win;
		float loss;
		
		mem=memberService.selectMemeber_bymno(mno);
		
		selectId=mem.getMem_link_id().replaceAll("\\s", "");
		map=riotapi.status(riotapi.getIdCode(selectId));
		
		win=Integer.parseInt(map.get("wins"));
		loss=Integer.parseInt(map.get("losses"));
		rate= String.format("%.2f", (win/(win+loss))*100);
		
		result.put("lol_tier", map.get("tier"));
		result.put("lol_rank", map.get("rank"));
		result.put("lol_point", map.get("leaguePoints"));
		result.put("lol_wins", map.get("wins"));
		result.put("lol_losses", map.get("losses"));
		result.put("lol_rate", rate);
		return result;
	}

}
