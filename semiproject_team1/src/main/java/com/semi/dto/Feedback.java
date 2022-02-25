package com.semi.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Feedback {
	
	String feedback_cat;
	int feedback_num;
	String feedback_content;
	String feedback_subject;
	String feedback_fileName;
	int feedback_likecount;
	int feedback_readcount;
	Date feedback_date;
	MultipartFile file;
	
	public String getFeedback_cat() {
		return feedback_cat;
	}
	public void setFeedback_cat(String feedback_cat) {
		this.feedback_cat = feedback_cat;
	}
	public int getFeedback_num() {
		return feedback_num;
	}
	public void setFeedback_num(int feedback_num) {
		this.feedback_num = feedback_num;
	}
	public String getFeedback_content() {
		return feedback_content;
	}
	public void setFeedback_content(String feedback_content) {
		this.feedback_content = feedback_content;
	}
	public String getFeedback_subject() {
		return feedback_subject;
	}
	public void setFeedback_subject(String feedback_subject) {
		this.feedback_subject = feedback_subject;
	}
	public String getFeedback_fileName() {
		return feedback_fileName;
	}
	public void setFeedback_fileName(String feedback_fileName) {
		this.feedback_fileName = feedback_fileName;
	}
	public int getFeedback_likecount() {
		return feedback_likecount;
	}
	public void setFeedback_likecount(int feedback_likecount) {
		this.feedback_likecount = feedback_likecount;
	}
	public int getFeedback_readcount() {
		return feedback_readcount;
	}
	public void setFeedback_readcount(int feedback_readcount) {
		this.feedback_readcount = feedback_readcount;
	}
	public Date getFeedback_date() {
		return feedback_date;
	}
	public void setFeedback_date(Date feedback_date) {
		this.feedback_date = feedback_date;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
}
