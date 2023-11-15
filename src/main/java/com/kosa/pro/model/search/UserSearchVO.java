package com.kosa.pro.model.search;
import org.springframework.web.multipart.MultipartFile;
import com.kosa.pro.model.common.SearchVO;
import lombok.Data;


@Data
public class UserSearchVO extends SearchVO {
	
	private static final long serialVersionUID = -6342602198186321293L;
	
	private int memSeq;
	
}
