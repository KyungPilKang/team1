CREATE DATABASE `semi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `article_like` (
  `article_like_num` int NOT NULL AUTO_INCREMENT,
  `mno` varchar(1000) NOT NULL,
  `board_num` varchar(1000) NOT NULL,
  PRIMARY KEY (`article_like_num`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `article_ward` (
  `article_ward_num` int NOT NULL AUTO_INCREMENT,
  `mno` varchar(1000) NOT NULL,
  `board_num` varchar(1000) NOT NULL,
  PRIMARY KEY (`article_ward_num`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `b_reply` (
  `b_reply_num` int NOT NULL AUTO_INCREMENT,
  `b_reply_nickname` varchar(1000) NOT NULL,
  `b_board_num` varchar(1000) NOT NULL,
  `b_reply_content` mediumtext NOT NULL,
  `b_reply_ref` int NOT NULL,
  `b_reply_lev` int NOT NULL,
  `b_reply_seq` int NOT NULL,
  `b_reply_date` datetime NOT NULL,
  `b_reply_likecount` int NOT NULL,
  `b_reply_like_member` varchar(1000) NOT NULL,
  PRIMARY KEY (`b_reply_num`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `board` (
  `board_num` int NOT NULL AUTO_INCREMENT,
  `board_nickname` varchar(1000) NOT NULL,
  `board_cat` varchar(1000) NOT NULL,
  `board_subject` varchar(1000) NOT NULL,
  `board_content` mediumtext NOT NULL,
  `board_fileName` varchar(1000) DEFAULT NULL,
  `board_date` datetime NOT NULL,
  `board_readcount` int NOT NULL,
  `board_likecount` int NOT NULL,
  `board_replycount` int NOT NULL,
  `board_thumbnail` mediumtext,
  PRIMARY KEY (`board_num`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `duo` (
  `duo_num` int NOT NULL AUTO_INCREMENT,
  `duo_email_id` varchar(1000) DEFAULT NULL,
  `duo_nickname` varchar(1000) NOT NULL,
  `duo_link_id` varchar(1000) NOT NULL,
  `duo_position` varchar(1000) NOT NULL,
  `duo_subposition` varchar(1000) NOT NULL,
  `duo_lol_tier` varchar(1000) NOT NULL,
  `duo_lol_ratio` varchar(1000) NOT NULL,
  `duo_most1` varchar(1000) NOT NULL,
  `duo_most2` varchar(1000) NOT NULL,
  `duo_most3` varchar(1000) NOT NULL,
  `duo_play_type` varchar(1000) NOT NULL,
  `duo_mic_ok` varchar(1000) DEFAULT NULL,
  `duo_allcham` varchar(1000) DEFAULT NULL,
  `duo_info` mediumtext NOT NULL,
  `duo_date` datetime NOT NULL,
  PRIMARY KEY (`duo_num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `fd_answer` (
  `fd_answer_num` int NOT NULL AUTO_INCREMENT,
  `fd_answer_nickname` varchar(1000) NOT NULL,
  `fd_answer_title` varchar(1000) NOT NULL,
  `fd_answer_content` mediumtext NOT NULL,
  `fd_answer_date` datetime NOT NULL,
  `fd_answer_likecount` int NOT NULL,
  `fd_answer_like_member` varchar(1000) DEFAULT NULL,
  `fd_answer_fixed` varchar(1000) NOT NULL,
  `fd_feedback_num` varchar(1000) NOT NULL,
  PRIMARY KEY (`fd_answer_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `fd_reply` (
  `fd_reply_num` int NOT NULL AUTO_INCREMENT,
  `fd_reply_nickname` varchar(1000) NOT NULL,
  `fd_reply_content` mediumtext NOT NULL,
  `fd_reply_date` datetime NOT NULL,
  `fd_reply_likecount` int NOT NULL,
  `fd_reply_like_member` varchar(1000) DEFAULT NULL,
  `fd_feedback_num` varchar(1000) NOT NULL,
  PRIMARY KEY (`fd_reply_num`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `feedback` (
  `feedback_num` int NOT NULL AUTO_INCREMENT,
  `feedback_nickname` varchar(1000) NOT NULL,
  `feedback_subject` varchar(1000) NOT NULL,
  `feedback_content` mediumtext NOT NULL,
  `feedback_replay_fileName` varchar(1000) NOT NULL,
  `feedback_video_fileName` varchar(1000) NOT NULL,
  `feedback_date` datetime NOT NULL,
  `feedback_readcount` int NOT NULL,
  `feedback_likecount` int NOT NULL,
  `feedback_thumbnail` mediumtext,
  `feedback_replycount` int NOT NULL,
  `feedback_answercount` int NOT NULL,
  PRIMARY KEY (`feedback_num`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `member` (
  `mem_mno` int NOT NULL AUTO_INCREMENT,
  `mem_email_id` varchar(1000) DEFAULT NULL,
  `mem_nickname` varchar(1000) NOT NULL,
  `mem_pw` varchar(1000) DEFAULT NULL,
  `mem_code` varchar(1000) DEFAULT NULL,
  `mem_code_confirm` varchar(1000) NOT NULL,
  `mem_link_id` varchar(1000) DEFAULT NULL,
  `mem_link_code` varchar(1000) DEFAULT NULL,
  `mem_link_confirm` varchar(1000) NOT NULL,
  `mem_duo_reg_ok` varchar(1000) NOT NULL,
  `mem_score` int DEFAULT NULL,
  `mem_type` varchar(1000) NOT NULL,
  `mem_admin_confirm` varchar(1000) DEFAULT NULL,
  `mem_kakao_id` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`mem_mno`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;