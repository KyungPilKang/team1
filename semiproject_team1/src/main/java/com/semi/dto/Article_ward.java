package com.semi.dto;

public class Article_ward {
	
	String article_ward_num; //PK, AI
	String mno; // 즐겨찾기 한 사용자의 고유번호
	String board_num; // 즐겨찾기 된 게시물 번호

	public Article_ward() {}

	public String getArticle_ward_num() {
		return article_ward_num;
	}

	public void setArticle_ward_num(String article_ward_num) {
		this.article_ward_num = article_ward_num;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}
}
