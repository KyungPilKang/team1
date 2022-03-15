package com.semi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.api.riotapi.LOL_champion;
import com.semi.api.riotapi.RiotAPI;
import com.semi.dao.MemberDAO;
import com.semi.dto.Board;
import com.semi.dto.Feedback;
import com.semi.dto.Member;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	RiotAPI riotapi;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	LOL_champion champion;
	
	@Autowired
	MemberDAO memberDAO;

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

	@Override
	public void idLink(Member mem) throws Exception {
		int len=6;
		int dupCd=1;
		Random rand = new Random();
        String numStr = ""; //난수가 저장될 변수
        
        for(int i=0;i<len;i++) {
            
            //0~9 까지 난수 생성
            String ran = Integer.toString(rand.nextInt(10));
            
            if(dupCd==1) {
                //중복 허용시 numStr에 append
                numStr += ran;
            }else if(dupCd==2) {
                //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
                if(!numStr.contains(ran)) {
                    //중복된 값이 없으면 numStr에 append
                    numStr += ran;
                }else {
                    //생성된 난수가 중복되면 루틴을 다시 실행한다
                    i-=1;
                }
            }
        }
        mem.setMem_link_code(numStr);
        memberDAO.idLink(mem);
	}

	@Override
	public boolean codeConfirm(Member mem) throws Exception {
		Member queryRes=memberDAO.selelctMember_bymno(mem.getMem_mno());
		if(mem.getMem_link_code().equals(queryRes.getMem_link_code())) {
			memberDAO.updateMem_link_confirm(mem);
			return true;
		} else {
			throw new Exception("인증 오류");
		}
	}

	@Override
	public void adminConfirm(int mno) throws Exception {
		memberDAO.adminConfirm(mno);
	}

	@Override
	public List<Board> selectBoardList_mine(int mno) throws Exception {
		Member mem=memberDAO.selelctMember_bymno(mno);
		return memberDAO.selectBoardList_mine(mem);
	}

	@Override
	public List<Board> selectBoardList_ward(int mno) throws Exception {
		List<Board> result = new ArrayList<Board>();
		List<String> board_numList=memberDAO.selectBoard_numList_ward(String.valueOf(mno));
		for(String board_num : board_numList) {
		    result.add(memberDAO.selectBoard_ward(board_num));
		}
		return result;
	}

	@Override
	public List<Feedback> selectFeedbackList_mine(int mno) throws Exception {
		Member mem=memberDAO.selelctMember_bymno(mno);
		return memberDAO.selectFeedbackList_mine(mem);
	}

}
