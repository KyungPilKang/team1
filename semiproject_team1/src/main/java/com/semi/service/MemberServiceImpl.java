package com.semi.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.semi.dao.MemberDAO;
import com.semi.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public boolean accessMember(String mem_email_id, String mem_pw) throws Exception {
		Member mem=memberDAO.queryMember(mem_email_id);
		if(mem==null) {
			throw new Exception("아이디 또는 비밀번호가 일치하지 않습니다");
		}
		if(mem_email_id.equals(mem.getMem_email_id())&&passwordEncoder.matches(mem_pw, mem.getMem_pw())) {
			return true;
		} else if(mem_email_id.equals(mem.getMem_email_id())&&!passwordEncoder.matches(mem_pw, mem.getMem_pw())) {
			throw new Exception("아이디 또는 비밀번호가 일치하지 않습니다");
		} else return false;
	}
	   
	@Override
	public boolean emailOverlap(String mem_email_id) throws Exception {
		Member email = memberDAO.queryMember(mem_email_id);
		if(email==null) return false;
		return true;
	}
	
	@Override
	public boolean nickOverlap(String mem_nickname) throws Exception {
		Member nickName = memberDAO.queryMember_nickname(mem_nickname);
		if(nickName==null) return false;
		return true;
	}

	@Override
	public void insertMember(Member member) throws Exception {
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
        String encodedPassword = passwordEncoder.encode(member.getMem_pw());
        member.setMem_pw(encodedPassword);
		member.setMem_code(numStr);
		member.setMem_code_confirm("no");
		member.setMem_link_id(null);
		member.setMem_link_code(null);
		member.setMem_link_confirm("no");
		member.setMem_duo_reg_ok("no");
		member.setMem_score(0);
		member.setMem_type("normal");
		memberDAO.insertMember(member);
		mailService.joinMailSend(member);
	}
	
	@Override
	public void insertMember_kakao(Member member) throws Exception {
		member.setMem_code_confirm("yes");
		member.setMem_link_confirm("no");
		member.setMem_duo_reg_ok("no");
		member.setMem_score(0);
		member.setMem_type("normal");
		memberDAO.insertMember(member);
	}

	@Override
	public Member selectMemeber(String id) throws Exception {
		Member mem=memberDAO.queryMember(id);
		return mem;
	}

	@Override
	public Member selectMemeber_bymno(int mno) throws Exception {
		Member mem=memberDAO.selelctMember_bymno(mno);
		return mem;
	}

	@Override
	public void updateMem_code_confirm(int mno) throws Exception {
		memberDAO.updateMem_code_confirm(mno);
	}

	@Override
	public void updateMem_code(int mno) throws Exception {
		Member mem=memberDAO.selelctMember_bymno(mno);
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
		mem.setMem_code(numStr);
		memberDAO.updateMem_code(mem);
		mailService.joinMailSend(mem);
	}

	@Override
	public int selectMem_score(int mno) throws Exception {
		int mem_score=0;
		mem_score=memberDAO.selectMem_score(mno);
		return mem_score;
	}

	@Override
	public List<Member> link_member_list() throws Exception {
		return memberDAO.link_member_list();
	}

	@Override
	public Member selelctMember_bykakao(String id) throws Exception {
		return memberDAO.selelctMember_bykakao(id);
	}

	@Override
	public void updateMem_reg_ok(String nickname) throws Exception {
		memberDAO.updateMem_reg_ok(nickname);
	}

	
	
	
    
}

	
		
	

