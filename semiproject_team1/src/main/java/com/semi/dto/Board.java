package com.semi.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	int board_num;
	String board_subject;
	String board_content;
	int board_readcount; 
	Date board_date;
	String board_fileName; 
	MultipartFile file;
	String board_cat;
	int board_likecount;
}
