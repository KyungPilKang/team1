package com.semi.dto;

import java.util.Date;

public class Fd_reply {

	int fd_reply_num; //PK, AI
	String fd_reply_nickname;
	String fd_reply_content;
	Date fd_reply_date;
	int fd_reply_likecount;
	String fd_reply_like_member;
	int fd_reply_like_ok;  // 계정별 좋아요를 체크하는 플래그변수 > DB컬럼에서 관리하지않고 DTO멤버변수로 관리
	int fd_reply_edit_controll; // 수정버튼과 댓글을 수정하기 위한 form태그를 id선택자로 연결지어주기 위한 변수
	public int getFd_reply_num() {
		return fd_reply_num;
	}
	public void setFd_reply_num(int fd_reply_num) {
		this.fd_reply_num = fd_reply_num;
	}
	public String getFd_reply_content() {
		return fd_reply_content;
	}
	public void setFd_reply_content(String fd_reply_content) {
		this.fd_reply_content = fd_reply_content;
	}
	public String getFd_reply_nickname() {
		return fd_reply_nickname;
	}
	public void setFd_reply_nickname(String fd_reply_nickname) {
		this.fd_reply_nickname = fd_reply_nickname;
	}
	public Date getFd_reply_date() {
		return fd_reply_date;
	}
	public void setFd_reply_date(Date fd_reply_date) {
		this.fd_reply_date = fd_reply_date;
	}
	public int getFd_reply_likecount() {
		return fd_reply_likecount;
	}
	public void setFd_reply_likecount(int fd_reply_likecount) {
		this.fd_reply_likecount = fd_reply_likecount;
	}
	public String getFd_reply_like_member() {
		return fd_reply_like_member;
	}
	public void setFd_reply_like_member(String fd_reply_like_member) {
		this.fd_reply_like_member = fd_reply_like_member;
	}
	public int getFd_reply_like_ok() {
		return fd_reply_like_ok;
	}
	public void setFd_reply_like_ok(int fd_reply_like_ok) {
		this.fd_reply_like_ok = fd_reply_like_ok;
	}
	public int getFd_reply_edit_controll() {
		return fd_reply_edit_controll;
	}
	public void setFd_reply_edit_controll(int fd_reply_edit_controll) {
		this.fd_reply_edit_controll = fd_reply_edit_controll;
	}

}
