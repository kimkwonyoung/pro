package com.kosa.pro.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kosa.pro.model.NoticeVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.service.common.BaseService;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class MainService extends BaseService {
	
	public List<ReviewBoardVO> mainTop3List() {
		return (List<ReviewBoardVO>) getDAO().selectList("review.selectMainReviewTop3", null);
	}
	
	public List<RecruitBoardVO> mainRecruitList() {
		return (List<RecruitBoardVO>) getDAO().selectList("recruit.selectMainRecruit", null);
	}
	
	public List<NoticeVO> mainNoticeList() {
		return (List<NoticeVO>) getDAO().selectList("adminnotice.selectMainNotice", null);
	}
	

}
