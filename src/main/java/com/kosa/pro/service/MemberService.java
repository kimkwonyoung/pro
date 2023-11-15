package com.kosa.pro.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.kosa.pro.config.exception.ExistMemberException;
import com.kosa.pro.config.exception.LoginBenException;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.VolunteerTimeVO;
import com.kosa.pro.model.auth.LoginMember;
import com.kosa.pro.service.common.BaseService;


@Service
public class MemberService extends BaseService {

	@Autowired
	private PasswordEncoder passwordEncoder;


	public LoginMember findMemid(String memId) {
		return (LoginMember) getDAO().selectOne("member.findMemid", memId);
	}
	
	@Transactional
	public void insertMember(MemberVO memberVO) throws Exception {
		try {
			if (memberVO == null ||
				Objects.isNull(memberVO.getMemId())) {
				throw new Exception("아이디는 필수 정보입니다");
			} 
//			else if (Objects.isNull(memberVO.getp)) {
//				throw new Exception("비밀번호는 필수 정보입니다");
//			}
			LoginMember existMember = findMemid(memberVO.getMemId());
			if (existMember != null) {
				if ("Y".equals(existMember.getBenYn())) {
					throw new LoginBenException("정지된 계정 입니다.");
				}
			}

			if (existMember != null && !Objects.isNull(memberVO.getMemId())) {
				throw new ExistMemberException(memberVO.getMemId());
			}
			//비밀번호 암호화 한다
//			memberVO.setPwd(passwordEncoder.encode(memberVO.getPwd()));
			getDAO().insert("member.insert", memberVO);

			//insert후 seq를 불러오는데 문제 존재
			MemberVO mem = (MemberVO) getDAO().selectOne("member.selectMemId", memberVO.getMemId());

			VolunteerTimeVO voluntime = VolunteerTimeVO.builder()
										.memSeq(mem.getMemSeq())
										.build();
			System.out.println(">>>>" + voluntime);
			getDAO().insert("member.insertVolunteerTime", voluntime);

			System.out.println(memberVO);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
		
	}
	
//	public boolean updateMember(MemberVO memberVO)  {
//		try {
//			if (memberVO == null || Objects.isNull(memberVO.getMemId())) {
//				throw new Exception("아이디는 필수 정보입니다");
//			} 
////			else if (Objects.isNull(memberVO.getPwd())) {
////				throw new Exception("비밀번호는 필수 정보입니다");
////			}
//			MemberVO existMember = memberDAO.findByEmail(memberVO.getEmail());
//			if (existMember == null || Objects.isNull(memberVO.getEmail())) {
//				throw new NotExistMemberException(memberVO.getEmail());
//			}
//			
//			//비밀번호 암호화 한다
//			memberVO.setPwd(passwordEncoder.encode(memberVO.getPwd()));
//			
//			memberDAO.updateMember(memberVO);
//			
//			memberVO.setRoles(existMember.getRoles());
//			
//			return true;
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			return false;
//		}
//	}
}