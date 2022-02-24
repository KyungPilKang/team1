package com.semi.dto;

public class B_reply {

	int b_reply_num;
	String b_reply_content;
	int b_reply_date;
	int b_reply_likecount;
	String b_reply_like_member;
	int b_reply_like_ok;  // 계정별 좋아요를 체크하는 플래그변수 > DB컬럼에서 관리하지않고 DTO멤버변수로 관리
	int b_reply_edit_controll; // 수정버튼과 댓글을 수정하기 위한 form태그를 id선택자로 연결지어주기 위한 변수
}
