package com.kosa.pro.service.common;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.pro.service.dao.GeneralDAOImpl;
import com.kosa.pro.utils.GlobalProperty;


/**
 * 부모 service 클래스
 * @author kky
 *
 */
@Service
public abstract class BaseService {
	
	@Resource
	private GeneralDAOImpl _gDao;
	
	@Autowired
	private GlobalProperty _globalProperty;
	
	
	protected GeneralDAOImpl getDAO() {
		return this._gDao;
	}
	
	protected GlobalProperty getConfig() {
		return this._globalProperty;
	}
}
