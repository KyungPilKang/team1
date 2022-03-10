package com.semi.dto;

public class Member {

	int mem_mno; //PK, AI
	String mem_email_id;
	String mem_nickname;
	String mem_pw;
	String mem_code;
	String mem_code_confirm;
	String mem_link_id;
	String mem_link_code;
	String mem_link_confirm;
	String mem_duo_reg_ok;
	
	public Member() {}

	public int getMem_mno() {
		return mem_mno;
	}

	public void setMem_mno(int mem_mno) {
		this.mem_mno = mem_mno;
	}

	public String getMem_email_id() {
		return mem_email_id;
	}

	public void setMem_email_id(String mem_email_id) {
		this.mem_email_id = mem_email_id;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_code() {
		return mem_code;
	}

	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}

	public String getMem_code_confirm() {
		return mem_code_confirm;
	}

	public void setMem_code_confirm(String mem_code_confirm) {
		this.mem_code_confirm = mem_code_confirm;
	}

	public String getMem_link_id() {
		return mem_link_id;
	}

	public void setMem_link_id(String mem_link_id) {
		this.mem_link_id = mem_link_id;
	}

	public String getMem_link_code() {
		return mem_link_code;
	}

	public void setMem_link_code(String mem_link_code) {
		this.mem_link_code = mem_link_code;
	}

	public String getMem_link_confirm() {
		return mem_link_confirm;
	}

	public void setMem_link_confirm(String mem_link_confirm) {
		this.mem_link_confirm = mem_link_confirm;
	}

	public String getMem_duo_reg_ok() {
		return mem_duo_reg_ok;
	}

	public void setMem_duo_reg_ok(String mem_duo_reg_ok) {
		this.mem_duo_reg_ok = mem_duo_reg_ok;
	}
	
	
}
