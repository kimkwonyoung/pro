package com.kosa.pro.model.auth;

import java.util.List;

import org.springframework.http.HttpStatus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ResponseVO {
    private HttpStatus httpStatus;
    private String message;
    private List<?> result;
    private int count;
    private boolean status;
    
    public int getCode() {
    	return httpStatus.value();
    }
}
