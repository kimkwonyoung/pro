package com.kosa.pro.service.common;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosa.pro.model.common.FileAttacheVO;
import com.kosa.pro.model.common.FileTokenVO;
import com.kosa.pro.model.search.UserSearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SchedulerService extends BaseService {
	

//	@Scheduled(fixedDelay = 60000) // 60초마다 실행
//	public void run2() {
//		System.out.println("60초마다 실행");
//	}
	
	//Cron 표현식을 사용하여 작업을 예약할 수 있다.
	/*
	첫 번째 * 부터
	초(0-59)
	분(0-59)
	시간(0-23)
	일(1-31)
	월(1-12)
	요일(0-6) (0: 일, 1: 월, 2:화, 3:수, 4:목, 5:금, 6:토)
	Spring @Scheduled cron은 6자리 설정만 허용하며 연도 설정을 할 수 없다.
	
	Cron 표현식 :
		* : 모든 조건(매시, 매일, 매주처럼 사용)을 의미
		? : 설정 값 없음 (날짜와 요일에서만 사용 가능)
		- : 범위를 지정할 때
		, : 여러 값을 지정할 때
		/ : 증분값, 즉 초기값과 증가치 설정에 사용
		L : 마지막 - 지정할 수 있는 범위의 마지막 값 설정 시 사용 (날짜와 요일에서만 사용 가능)
		W : 가장 가까운 평일(weekday)을 설정할 때
	 */
	// 매일 오전 04시에 실행
//	@Scheduled(cron = "0 0 04 * * *") 
//	public void run3() {
//		System.out.println("매일 오전 04시에 실행");
//	}
//	 
//	// 매달 10일,20일 04시에 실행
//	@Scheduled(cron = "0 0 04 10,20 * ?") 
//	public void run4() {
//		System.out.println("매달 10일,20일 04시에 실행");
//	}
//	 
//	// 매달 마지막날 04시에 실행
//	@Scheduled(cron = "0 0 04 L * ?") 
//	public void run5() {
//		System.out.println("매달 마지막날 04시에 실행");
//	}
//	 
//	// 1시간 마다 실행 ex) 01:00, 02:00, 03:00 ...
//	@Scheduled(cron = "0 0 0/1 * * *") 
//	public void run6() {
//		System.out.println("1시간 마다 실행");
//	}
//	 
//	// 매일 9시00분-9시55분, 18시00분-18시55분 사이에 5분 간격으로 실행
//	@Scheduled(cron = "0 0/5 9,18 * * *") 
//	public void run7() {
//		System.out.println("매일 9시00분-9시55분, 18시00분-18시55분 사이에 5분 간격으로 실행");
//	}
//	 
//	// 매일 9시00분-18시55분 사이에 5분 간격으로 실행
//	@Scheduled(cron = "0 0/5 9-18 * * *") 
//	public void run8() {
//		System.out.println("매일 9시00분-18시55분 사이에 5분 간격으로 실행");
//	}
//	 
//	// 매달 1일 10시30분에 실행
//	@Scheduled(cron = "0 30 10 1 * *") 
//	public void run9() {
//		System.out.println("// 매달 1일 10시30분에 실행");
//	}
//	 
//	// 매년 3월내 월-금 04시30분에 실행
//	@Scheduled(cron = "0 30 04 ? 3 1-5") 
//	public void run10() {
//		System.out.println("매년 3월내 월-금 04시30분에 실행");
//	}
//	 
//	// 매달 마지막 토요일 10시30분에 실행
//	@Scheduled(cron = "0 30 10 ? * 6L") 
//	public void run11() {
//		System.out.println("매달 마지막 토요일 10시30분에 실행");
//	}
	
	
	//
	@Transactional
	@Scheduled(fixedDelay = 10 * 60 * 1000) // 20분 마다 실행 
	public void fileTokenAutoDelete() {
		System.out.println("첨부 파일 업로드 중 완료되지 않음 파일을 삭제한다");
		List<FileTokenVO> fileTokenList = (List<FileTokenVO>) getDAO().selectList("filetoken.listToken", null);
		if (fileTokenList.size() != 0) {
			System.out.println("fileTokenList : " + fileTokenList);
			Map<String, Object> map = Map.of("list", fileTokenList);
			System.out.println("map : " + map);
			List<FileAttacheVO> fileUploadList =  (List<FileAttacheVO>) getDAO().selectList("fileattache.deleteFileList", map);
			System.out.println(">>>>> " + fileUploadList);
			for (FileAttacheVO fileUpload : fileUploadList) {
				System.out.println("삭제 파일 : " + fileUpload.getPhysicalName());
				new File(fileUpload.getPhysicalName()).delete();
			}
			getDAO().delete("fileattache.deleteTokenList", map);
			getDAO().delete("filetoken.deletes", map);
		}
	}
	
	
    @Transactional
    @Scheduled(fixedDelay = 24 * 60 * 60 * 1000) // 24시간마다 실행 (예: 매일 자정)
    public void updateVolunteerTimeForAllMembers() {
        List<Long> allMemberIds = getAllMemberIds(); // 모든 회원의 mem_seq를 가져오는 메소드

        for (Long memberId : allMemberIds) {	// 가져온 모든 회원의 mem_seq를 가지고, 자정에 모든 회원의 봉사온도 update하는 메소드
        	updateVolunteerHeatForMember();
        }
    }

    private void updateVolunteerHeatForMember() {
        // 해당 회원의 volun_heat 업데이트 쿼리 실행
    	UserSearchVO search = new UserSearchVO();
        getDAO().update("user.updateVolunteerHeat", search);
    }

    private List<Integer> getAllMemberIds() {
        // 모든 회원의 mem_seq를 조회하는 메소드
        return (List<Integer>) getDAO().selectList("user.getAllMemberIds", null);
    }
}