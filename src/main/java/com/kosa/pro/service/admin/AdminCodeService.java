package com.kosa.pro.service.admin;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosa.pro.model.MasterCodeVO;
import com.kosa.pro.model.search.CodeSearchVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class AdminCodeService extends BaseService {

	public Map<String, Object> groupCode(CodeSearchVO search) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("groupList", (List<MasterCodeVO>) getDAO().selectList("code.selectGroupList", search));
		
		return map;
	}
	
	public List<MasterCodeVO> codeList(CodeSearchVO search) {
		return (List<MasterCodeVO>) getDAO().selectList("code.selectGroupCode", search);
	}
	
	@Transactional
	public void deleteCode(MasterCodeVO code) {
		getDAO().delete("code.delete", code);
		getDAO().delete("code.categoryCountDelete", code);
	}
	
	@Transactional
	public void saveCode(MasterCodeVO code) {
		if (code.getCodeSeq() == 0)
			getDAO().insert("code.categoryCountInsert", code);
		getDAO().insert("code.merge", code);
		
	}
}
