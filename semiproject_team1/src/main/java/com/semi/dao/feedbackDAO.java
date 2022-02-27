package com.semi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semi.dto.Feedback;

@Mapper
@Repository
public interface feedbackDAO {
	
	void insertFeedback(Feedback feedback) throws Exception;
	Integer selectMaxFeedbackNum() throws Exception;
	
	int selectFeedbackCount() throws Exception;
	
	List<Feedback> selectFeedbackList_all(int startrow) throws Exception;
	List<Feedback> selectFeedbackList_all_viewsSort(int startrow) throws Exception;
}
