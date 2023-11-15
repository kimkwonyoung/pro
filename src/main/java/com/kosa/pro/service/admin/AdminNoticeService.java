package com.kosa.pro.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.NoticeVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.NoticeSearchVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class AdminNoticeService extends BaseService {

	// 공지사항리스트
	public Map<String, List<NoticeVO>> AdminNoticeList(NoticeSearchVO search) throws Exception {

		Map<String, List<NoticeVO>> map = new HashMap<>();
		map.put("noticeList", (List<NoticeVO>) getDAO().selectBySearch("adminnotice.adminselectNoticeList",
				search, "totalCountNotice"));
		return map;
	}
}
