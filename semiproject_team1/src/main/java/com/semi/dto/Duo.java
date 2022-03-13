package com.semi.dto;

import java.util.Date;

public class Duo {
	
	String duo_num; //PK, AI
	String duo_email_id; //쪽지함 데이터 요청 시 활용
	String duo_nickname;
	String duo_link_id;
	String duo_position; //탑:1, 정글:2, 미드:3, 원딜:4, 서폿:5
	String duo_subposition; //탑:1, 정글:2, 미드:3, 원딜:4, 서폿:5
	String duo_lol_tier;
	String duo_lol_ratio;
	String duo_most1;
	String duo_most2;
	String duo_most3;
	String duo_play_type;
	String duo_mic_ok;
	String duo_allcham;
	String duo_info;
	Date duo_date; //등록한 날짜&수정된 날짜&갱신할 날짜 관리 >> 조회 결과 갱신순으로 뿌려주기
	
	public Duo() {}

	public String getDuo_num() {
		return duo_num;
	}

	public void setDuo_num(String duo_num) {
		this.duo_num = duo_num;
	}

	public String getDuo_email_id() {
		return duo_email_id;
	}

	public void setDuo_email_id(String duo_email_id) {
		this.duo_email_id = duo_email_id;
	}

	public String getDuo_nickname() {
		return duo_nickname;
	}

	public void setDuo_nickname(String duo_nickname) {
		this.duo_nickname = duo_nickname;
	}

	public String getDuo_link_id() {
		return duo_link_id;
	}

	public void setDuo_link_id(String duo_link_id) {
		this.duo_link_id = duo_link_id;
	}

	public String getDuo_position() {
		return duo_position;
	}

	public void setDuo_position(String duo_position) {
		this.duo_position = duo_position;
	}

	public String getDuo_subposition() {
		return duo_subposition;
	}

	public void setDuo_subposition(String duo_subposition) {
		this.duo_subposition = duo_subposition;
	}

	public String getDuo_lol_tier() {
		return duo_lol_tier;
	}

	public void setDuo_lol_tier(String duo_lol_tier) {
		this.duo_lol_tier = duo_lol_tier;
	}

	public String getDuo_lol_ratio() {
		return duo_lol_ratio;
	}

	public void setDuo_lol_ratio(String duo_lol_ratio) {
		this.duo_lol_ratio = duo_lol_ratio;
	}

	public String getDuo_most1() {
		return duo_most1;
	}

	public void setDuo_most1(String duo_most1) {
		this.duo_most1 = duo_most1;
	}

	public String getDuo_most2() {
		return duo_most2;
	}

	public void setDuo_most2(String duo_most2) {
		this.duo_most2 = duo_most2;
	}

	public String getDuo_most3() {
		return duo_most3;
	}

	public void setDuo_most3(String duo_most3) {
		this.duo_most3 = duo_most3;
	}

	public String getDuo_play_type() {
		return duo_play_type;
	}

	public void setDuo_play_type(String duo_play_type) {
		this.duo_play_type = duo_play_type;
	}

	public String getDuo_mic_ok() {
		return duo_mic_ok;
	}

	public void setDuo_mic_ok(String duo_mic_ok) {
		this.duo_mic_ok = duo_mic_ok;
	}

	public String getDuo_allcham() {
		return duo_allcham;
	}

	public void setDuo_allcham(String duo_allcham) {
		this.duo_allcham = duo_allcham;
	}

	public String getDuo_info() {
		return duo_info;
	}

	public void setDuo_info(String duo_info) {
		this.duo_info = duo_info;
	}

	public Date getDuo_date() {
		return duo_date;
	}

	public void setDuo_date(Date duo_date) {
		this.duo_date = duo_date;
	}

	
}
