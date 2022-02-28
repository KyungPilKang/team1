package com.semi.dto;

public class Article_like {
	
	String article_like_num; // PK, AI1
	String mno; // 좋아요 한 사용자의 고유번호
	String board_num; // 좋아요 된 게시물 번호
	
	public Article_like() {}

	public String getArticle_like_num() {
		return article_like_num;
	}

	public void setArticle_like_num(String article_like_num) {
		this.article_like_num = article_like_num;
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
