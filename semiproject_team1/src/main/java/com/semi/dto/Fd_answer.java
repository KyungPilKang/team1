package com.semi.dto;

public class Fd_answer {

	int fd_answer_num; //PK, AI
	String fd_answer_nickname;
	String fd_answer_title;
	String fd_answer_content;
	int fd_answer_date;
	int fd_answer_likecount;
	String fd_answer_like_member;
	int fd_answer_like_ok; //계정별 좋아요를 체크하는 플래그변수 > DB컬럼에서 관리하지않고 DTO멤버변수로 관리
	int fd_answer_edit_controll; //댓글별 수정버튼을 제어하는 변수
	int fd_answer_fixed; //고정됨이면 1, 고정되지않으면 0
	public int getFd_answer_num() {
		return fd_answer_num;
	}
	public void setFd_answer_num(int fd_answer_num) {
		this.fd_answer_num = fd_answer_num;
	}
	public String getFd_answer_content() {
		return fd_answer_content;
	}
	public void setFd_answer_content(String fd_answer_content) {
		this.fd_answer_content = fd_answer_content;
	}
	public int getFd_answer_date() {
		return fd_answer_date;
	}
	public void setFd_answer_date(int fd_answer_date) {
		this.fd_answer_date = fd_answer_date;
	}
	public int getFd_answer_likecount() {
		return fd_answer_likecount;
	}
	public void setFd_answer_likecount(int fd_answer_likecount) {
		this.fd_answer_likecount = fd_answer_likecount;
	}
	public String getFd_answer_like_member() {
		return fd_answer_like_member;
	}
	public void setFd_answer_like_member(String fd_answer_like_member) {
		this.fd_answer_like_member = fd_answer_like_member;
	}
	public int getFd_answer_like_ok() {
		return fd_answer_like_ok;
	}
	public void setFd_answer_like_ok(int fd_answer_like_ok) {
		this.fd_answer_like_ok = fd_answer_like_ok;
	}
	public int getFd_answer_edit_controll() {
		return fd_answer_edit_controll;
	}
	public void setFd_answer_edit_controll(int fd_answer_edit_controll) {
		this.fd_answer_edit_controll = fd_answer_edit_controll;
	}
	public int getFd_answer_fixed() {
		return fd_answer_fixed;
	}
	public void setFd_answer_fixed(int fd_answer_fixed) {
		this.fd_answer_fixed = fd_answer_fixed;
	}
	public String getFd_answer_nickname() {
		return fd_answer_nickname;
	}
	public void setFd_answer_nickname(String fd_answer_nickname) {
		this.fd_answer_nickname = fd_answer_nickname;
	}
	public String getFd_answer_title() {
		return fd_answer_title;
	}
	public void setFd_answer_title(String fd_answer_title) {
		this.fd_answer_title = fd_answer_title;
	}
	
}