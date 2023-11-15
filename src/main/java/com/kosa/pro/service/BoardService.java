package com.kosa.pro.service;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kosa.pro.model.BoardVO;
import com.kosa.pro.model.TestVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.service.common.BaseService;

import lombok.extern.slf4j.Slf4j;
/** 게시판 비즈니스 로직
 * @author kky
 *
 */
@Service
@Slf4j
public class BoardService extends BaseService {
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	//일반 게시판 전체 목록
	public List<BoardVO> boardList(BoardSearchVO search) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		return (List<BoardVO>) getDAO().selectBySearch("board.selectBoardList", search, "totalCount");
//		return (List<BoardVO>) getDAO().selectList("board.selectBoardList", search);
	}
	
	public List<TestVO> testList(SearchVO search) {
		
		return (List<TestVO>) getDAO().selectBySearch("test.selectTest", search);
	}
	

}
