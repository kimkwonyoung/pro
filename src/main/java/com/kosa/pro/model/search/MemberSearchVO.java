package com.kosa.pro.model.search;

import com.kosa.pro.model.common.SearchVO;

import lombok.Data;

@Data
public class MemberSearchVO extends SearchVO{
	
	
    private String memberUseYn; 
    private int memSeq;
    private int recruitSeq;

    /**
     * 회원 관리 사용 여부 값
     * 이 메소드는 사용 여부에 대한 설정을 반환합니다.
     * @return 사용 여부 설정 값
     */
    public String getMemberUseYn() {
        return memberUseYn;
    }

    public void setMemberUseYn(String memberUseYn) {
        this.memberUseYn = memberUseYn;
    }
    public int getMemSeq() {
        return memSeq;
    }
    
    public void setMemSeq(int memSeq) {
        this.memSeq = memSeq;
    }
}
