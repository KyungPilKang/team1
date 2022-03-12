package com.semi.dto;
import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

public class Board {
	int board_num; //PK, AI
	String board_nickname; // 회원 닉네임 
	String board_cat; //게시판 카테고리
	String board_subject;
	String board_content;
	String board_fileName;
	MultipartFile file;
	String board_type; //키워드검색 조건 >> 제목:1, 작성자:2, 내용:3
	String board_keyword; //사용자 입력 키워드
	Date board_date;
	int board_readcount; 
	int board_likecount;
	int board_replycount;
	String board_thumbnail; // 0303 추가, 게시판 리스트 출력시 board 객체에 썸네일을 담아오는 목적, 테이블 변경 필수

	public Board() {}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_nickname() {
		return board_nickname;
	}

	public void setBoard_nickname(String board_nickname) {
		this.board_nickname = board_nickname;
	}

	public String getBoard_cat() {
		return board_cat;
	}

	public void setBoard_cat(String board_cat) {
		this.board_cat = board_cat;
	}

	public String getBoard_subject() {
		return board_subject;
	}

	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_fileName() {
		return board_fileName;
	}

	public void setBoard_fileName(String board_fileName) {
		this.board_fileName = board_fileName;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getBoard_keyword() {
		return board_keyword;
	}

	public void setBoard_keyword(String board_keyword) {
		this.board_keyword = board_keyword;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_likecount() {
		return board_likecount;
	}

	public void setBoard_likecount(int board_likecount) {
		this.board_likecount = board_likecount;
	}

	public int getBoard_replycount() {
		return board_replycount;
	}

	public void setBoard_replycount(int board_replycount) {
		this.board_replycount = board_replycount;
	}

	public String getBoard_thumbnail() {
		return board_thumbnail;
	}

	public void setBoard_thumbnail(String board_thumbnail) {
		this.board_thumbnail = board_thumbnail;
	}
}
