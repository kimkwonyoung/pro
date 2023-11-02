package com.kosa.pro.service.common;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosa.pro.model.common.FileTokenVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.utils.StringUtil;


@Service
public class FileTokenService extends BaseService {

	@Transactional
	public String getToken() {
		final String token = StringUtil.getRandomStringByUUID();
		SearchVO search = new SearchVO();
		search.setToken(token);
		
		getDAO().insert("filetoken.insert", search);
		
		return token;
	}
	
	@Transactional
	public int updateUseStatus(String token) {
		FileTokenVO fileTokenVO = new FileTokenVO(token, 1);
		
		return getDAO().update("filetoken.updateStatus", fileTokenVO);
	}

}