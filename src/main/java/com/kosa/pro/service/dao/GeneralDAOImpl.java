package com.kosa.pro.service.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.general.GeneralModel;
import com.kosa.pro.utils.StringUtil;



/**
 * 일반화 DAO 클래스
 * @author kky
 *
 */
//@Repository("generalDAO")
@Repository
public class GeneralDAOImpl implements GeneralDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(GeneralDAOImpl.class);
	
	@Autowired
	private  SqlSession sqlSession;
	
	/**
	 * 1 레코드 결과를 가져옵니다.
	 * 
	 * @param sqlMapID
	 * @param obj
	 * @return
	 */
	public Object selectOne(String sqlMapID, Object obj) {
		Object result = sqlSession.selectOne(sqlMapID, obj);
		return result; 
	}
	
	/**
	 * 검색 레코드 수 search.paging.totalCount 세팅을 포함합니다.
	 */
	@Override
	public int getCountBySearch(String sqlMapID, SearchVO search) {
		int iCount = 0;
		iCount = sqlSession.selectOne(sqlMapID, search);
		search.getPaging().setTotalCount(iCount);
		return iCount;
	}
	
	/**
	 * 1 레코드 결과를 가져옵니다. 없을 경우 null을 반환합니다.
	 */
	@Override
	public Object selectByKey(String sqlMapID, Object key) {
		List<?> list = sqlSession.selectList(sqlMapID, key);
		
		if (list.size() == 0)
			return null;
		else
			return list.get(0);
	}
	
	/**
	 * 목록 가져오기 - 호출될 때 카운트 쿼리도 같이 실행. search.paging.totalCount에 매핑 - sqlMapID가 맞아야 함.
	 * 
	 * @param sqlMapID
	 * @param search
	 */
	@Override
	public List<?> selectBySearch(String sqlMapID, SearchVO search) {
		return this.selectBySearch(sqlMapID, search, "totalCount");
	}
	
	/**
	 * 목록 가져오기 - 호출될 때 카운트 쿼리도 같이 실행. search.paging.totalCount에 매핑 - sqlMapID가 맞아야 함. 
	 * 
	 * @param sqlMapID
	 * @param search
	 * @param countQueryID
	 *            카운트 쿼리 id를 넣을 경우 해당 쿼리를 실행하여 search.paging.totalCount에 결과값 매핑. 빈 값을 넣으면 카운트 쿼리를 실행하지 않음
	 * @return
	 */
	public List<?> selectBySearch(String sqlMapID, SearchVO search, String countQueryID) {
		if (!StringUtil.isEmpty(countQueryID)) {
			try {
				String mapID = sqlMapID.substring(0, sqlMapID.lastIndexOf(".") + 1) + countQueryID;
				int iCount = this.getCountBySearch(mapID, search);
				search.getPaging().setTotalCount(iCount);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}			
		}
		
		return sqlSession.selectList(sqlMapID, search);
	}
	
	/**
	 * 쿼리에 해당하는 리스트를 가져옵니다.
	 * @param sqlMapID
	 * @param search
	 * @return
	 */
	public List<?> selectList(String sqlMapID, SearchVO search) {
		return sqlSession.selectList(sqlMapID, search);
	}
	
	
	/**
	 * 특정 모델을 파라미터에 해당하는 리스트를 가져옵니다.
	 * @param sqlMapID
	 * @param vo
	 * @return
	 */
	public List<?> selectList(String sqlMapID, Object vo) {
		return sqlSession.selectList(sqlMapID, vo);
	}
	
	
	
	
	/**
	 * 등록
	 */
	@Override
	public int insert(String sqlMapID, GeneralModel model) {
		return sqlSession.insert(sqlMapID, model);
	}
	
	/**
	 * 수정
	 */
	@Override
	public int update(String sqlMapID, GeneralModel model) {
		return sqlSession.update(sqlMapID, model);
	}
	
	/**
	 * 삭제
	 */
	@Override
	public int delete(String sqlMapID, Object key) {
		return sqlSession.delete(sqlMapID, key);
	}

	/**
	 * 
	 * @param 민재 만든거
	 * @param memSeqArray
	 * @return
	 */
	public int update(String sqlMapID, List<Long> memSeqArray) {
		return sqlSession.update(sqlMapID, memSeqArray);
	}
	
	/**
	 * 
	 * @param 스프링 스케줄러 온도 업데이트용
	 * @param 김민기가 잠깐 씀; ㅈㅅㅈㅅ
	 * @return
	 */
	public int update(String sqlMapID, Object key) {
		return sqlSession.update(sqlMapID, key);
	}
}
