package com.semi.dto;


import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Feedback {
	
	int feedback_num; //PK, AI
	String feedback_nickname;
	String feedback_subject;
	String feedback_content;
	String feedback_replay_fileName; //DB에 originalName 관리
	MultipartFile replay_file; //서버 저장
	String feedback_video_fileName; //DB에 originalName 관리
	MultipartFile video_file; //서버 저장
	int feedback_type; //키워드검색 조건 >> 제목:1, 작성자:2, 내용:3
	String feedback_keyword; //사용자 입력 키워드
	Date feedback_date;
	int feedback_readcount;
	int feedback_likecount;
	String feedback_vote_member; //투표한 회원의 고유번호 관리
	//이하는 각 라인에 대한 투표수
	int feedback_vote_top; 
	int feedback_vote_jungle;
	int feedback_vote_mid;
	int feedback_vote_ad;
	int feedback_vote_support;
	
	public Feedback() {}

	public int getFeedback_num() {
		return feedback_num;
	}

	public void setFeedback_num(int feedback_num) {
		this.feedback_num = feedback_num;
	}

	public String getFeedback_nickname() {
		return feedback_nickname;
	}

	public void setFeedback_nickname(String feedback_nickname) {
		this.feedback_nickname = feedback_nickname;
	}

	public String getFeedback_subject() {
		return feedback_subject;
	}

	public void setFeedback_subject(String feedback_subject) {
		this.feedback_subject = feedback_subject;
	}

	public String getFeedback_content() {
		return feedback_content;
	}

	public void setFeedback_content(String feedback_content) {
		this.feedback_content = feedback_content;
	}

	public String getFeedback_replay_fileName() {
		return feedback_replay_fileName;
	}

	public void setFeedback_replay_fileName(String feedback_replay_fileName) {
		this.feedback_replay_fileName = feedback_replay_fileName;
	}

	public MultipartFile getReplay_file() {
		return replay_file;
	}

	public void setReplay_file(MultipartFile replay_file) {
		this.replay_file = replay_file;
	}

	public String getFeedback_video_fileName() {
		return feedback_video_fileName;
	}

	public void setFeedback_video_fileName(String feedback_video_fileName) {
		this.feedback_video_fileName = feedback_video_fileName;
	}

	public MultipartFile getVideo_file() {
		return video_file;
	}

	public void setVideo_file(MultipartFile video_file) {
		this.video_file = video_file;
	}

	public int getFeedback_type() {
		return feedback_type;
	}

	public void setFeedback_type(int feedback_type) {
		this.feedback_type = feedback_type;
	}

	public String getFeedback_keyword() {
		return feedback_keyword;
	}

	public void setFeedback_keyword(String feedback_keyword) {
		this.feedback_keyword = feedback_keyword;
	}

	public Date getFeedback_date() {
		return feedback_date;
	}

	public void setFeedback_date(Date feedback_date) {
		this.feedback_date = feedback_date;
	}

	public int getFeedback_readcount() {
		return feedback_readcount;
	}

	public void setFeedback_readcount(int feedback_readcount) {
		this.feedback_readcount = feedback_readcount;
	}

	public int getFeedback_likecount() {
		return feedback_likecount;
	}

	public void setFeedback_likecount(int feedback_likecount) {
		this.feedback_likecount = feedback_likecount;
	}
	
	
	
	
}
