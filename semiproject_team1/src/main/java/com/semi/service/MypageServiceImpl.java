package com.semi.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.api.riotapi.LOL_champion;
import com.semi.api.riotapi.RiotAPI;
import com.semi.dto.Member;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	RiotAPI riotapi;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	LOL_champion champion;

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

	@Override
	public Map<String, String> selectChamp(int mno) throws Exception {
		Map<Integer, String> map=new HashMap<>();
		Member mem=null;
		Map<String, String> result=new HashMap<>();
		String selectId;
		
		mem=memberService.selectMemeber_bymno(mno);
		selectId=mem.getMem_link_id().replaceAll("\\s", "");
		map=riotapi.mostChampion(riotapi.getIdCode(selectId));
		
		result.put("most1", champion.getChampionName(Integer.parseInt(map.get(0))));
		result.put("most2", champion.getChampionName(Integer.parseInt(map.get(1))));
		result.put("most3", champion.getChampionName(Integer.parseInt(map.get(2))));
		
		
		return result;
	}

}
