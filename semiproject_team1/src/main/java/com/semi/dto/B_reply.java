package com.semi.dto;

import java.util.Date;

public class B_reply {
	int b_reply_num; //PK, AI
	String b_reply_nickname;
	int b_board_num;
	String b_reply_content;
	int b_reply_ref;
	int b_reply_lev; //대댓글까지만 가능
	int b_reply_seq;
	Date b_reply_date;
	int b_reply_likecount;
	String b_reply_like_member; //좋아요 누른 회원 고유번호 관리
	String b_reply_like_ok; //요청한 클라이언트가 좋아요 눌렀는지 판단하는 변수
	
	// 수정기능 삭제로 제거
//	String b_reply_edit_controll; //jQuery 선택자 제어 변수
	
	public B_reply() {}

	public int getB_reply_num() {
		return b_reply_num;
	}

	public void setB_reply_num(int b_reply_num) {
		this.b_reply_num = b_reply_num;
	}

	public String getB_reply_nickname() {
		return b_reply_nickname;
	}

	public void setB_reply_nickname(String b_reply_nickname) {
		this.b_reply_nickname = b_reply_nickname;
	}

	public int getB_board_num() {
		return b_board_num;
	}

	public void setB_board_num(int b_board_num) {
		this.b_board_num = b_board_num;
	}

	public String getB_reply_content() {
		return b_reply_content;
	}

	public void setB_reply_content(String b_reply_content) {
		this.b_reply_content = b_reply_content;
	}

	public int getB_reply_ref() {
		return b_reply_ref;
	}

	public void setB_reply_ref(int b_reply_ref) {
		this.b_reply_ref = b_reply_ref;
	}

	public int getB_reply_lev() {
		return b_reply_lev;
	}

	public void setB_reply_lev(int b_reply_lev) {
		this.b_reply_lev = b_reply_lev;
	}

	public int getB_reply_seq() {
		return b_reply_seq;
	}

	public void setB_reply_seq(int b_reply_seq) {
		this.b_reply_seq = b_reply_seq;
	}

	public Date getB_reply_date() {
		return b_reply_date;
	}

	public void setB_reply_date(Date b_reply_date) {
		this.b_reply_date = b_reply_date;
	}

	public int getB_reply_likecount() {
		return b_reply_likecount;
	}

	public void setB_reply_likecount(int b_reply_likecount) {
		this.b_reply_likecount = b_reply_likecount;
	}

	public String getB_reply_like_member() {
		return b_reply_like_member;
	}

	public void setB_reply_like_member(String b_reply_like_member) {
		this.b_reply_like_member = b_reply_like_member;
	}

	public String getB_reply_like_ok() {
		return b_reply_like_ok;
	}

	public void setB_reply_like_ok(String b_reply_like_ok) {
		this.b_reply_like_ok = b_reply_like_ok;
	}

	
	
}
