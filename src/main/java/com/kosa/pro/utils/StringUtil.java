package com.kosa.pro.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class StringUtil {
	
	private static long dummy = 0l;
	
	/**
	 * String 빈값, null 체크
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}
	/*
	 * String params = Stream.of(boardIds).collect(Collectors.joining("','", "('", "')"));
	 * */
	
	/**
	 * 문자열 숫자로 체크 빈값, null 일시 정수형 0 반환
	 * @param str
	 * @return
	 */
	public static int checkNullInt(String str) {
		
		if (str == null || str.length() == 0) {
			return 0;
		} else {
			return Integer.parseInt(str);
		}
	}
	
	/**
	 * yyyy-MM-dd 형식의 문자열을 Date 객체로 가져옵니다.
	 * @param input
	 * @return
	 */
	public static Date getDate(String input) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.parse(input);
	}
	
	/**
	 * 오늘 날짜를 형식에 맞는 문자열로 가져옵니다.
	 * @param format
	 * @return
	 */
	public static String getDateToString(String format) {
		Date date = new Date();
		return getDateToString(date, format);
	}
	
	/**
	 * 날짜 객체를 형식에 맞는 문자열로 가져옵니다.
	 * @param date
	 * @param format
	 * @return
	 */
	public static String getDateToString(Date date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}
	
//	public static String getDateToString(String format) {
//	    LocalDateTime now = LocalDateTime.now();
//	    return getDateToString(now, format);
//	}
//
//	public static String getDateToString(LocalDateTime dateTime, String format) {
//	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
//	    return dateTime.format(formatter);
//	}
	
	/**
	 * date1에 대한 date2의 일수 차이를 가져옵니다.
	 * - date2가 date1보다 미래일 경우 음수가 나옵니다.
	 * @param date1  
	 * @param date2
	 * @return
	 * @throws Exception
	 */
	public static long compareTwoDate(Date date1, Date date2) throws Exception {
		//logger.debug(">>>>> date1 : {}, date2 : {}", date1, date2);
		long interval = (date1.getTime() - date2.getTime()) / (24 * 60 * 60 * 1000);
		return interval;
	}
	
	/**
	 * 문자열 날짜 비교
	 * 
	 * @param Object
	 * @return String
	 */
	public static boolean diffOfDate(String begin, String end) throws Exception {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date thisdate = formatter.parse(formatter.format(new Date()));
			
			Date beginDate = formatter.parse(begin);
			Date endDate = formatter.parse(end);
			
			if ((thisdate.equals(beginDate) || thisdate.after(beginDate)) && (thisdate.equals(endDate) || thisdate.before(endDate))) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 시간 값을 이용하여 20자리 고유 문자열 반환
	 * 
	 * @return 숫자형태의 문자
	 */
	public static synchronized String getUniqueNumber() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS"); // 17 characters
		String sReturn = sdf.format(Calendar.getInstance().getTime());
		try {
			++dummy;
		} catch (Exception e) {
			dummy = 0;
		}
		sReturn += padLeft(String.valueOf(dummy % 1000), 3, '0');
		
		return sReturn;
	}
	
	/**
	 * java.util.UUID를 이용한 32자리 랜덤 문자열 : 하이픈 제거
	 * @return
	 */
	public static String getRandomStringByUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	/**
	 * 랜덤으로 패스위드 생성
	 * @param type
	 *            GenType 참조
	 * @param length
	 *            길이
	 * @return
	 */
	public static String getRandomValue(GenType type, int length) {
		
		StringBuffer strPwd = new StringBuffer();
		char str[] = new char[1];
		// 특수기호 포함
		if (type.equals(GenType.SpecialMarks)) {
			for (int i = 0; i < length; i++) {
				str[0] = (char) ((Math.random() * 94) + 33);
				strPwd.append(str);
			}
			// 대문자로만
		} else if (type.equals(GenType.UpperCase)) {
			for (int i = 0; i < length; i++) {
				str[0] = (char) ((Math.random() * 26) + 65);
				strPwd.append(str);
			}
			// 소문자로만
		} else if (type.equals(GenType.LowerCase)) {
			for (int i = 0; i < length; i++) {
				str[0] = (char) ((Math.random() * 26) + 97);
				strPwd.append(str);
			}
			// 숫자형으로
		} else if (type.equals(GenType.Number)) {
			int strs[] = new int[1];
			for (int i = 0; i < length; i++) {
				strs[0] = (int) (Math.random() * 9);
				strPwd.append(strs[0]);
			}
			// 소문자, 숫자형
		} else if (type.equals(GenType.LowerCaseAndNumber)) {
			Random rnd = new Random();
			for (int i = 0; i < length; i++) {
				if (rnd.nextBoolean()) {
					strPwd.append((char) ((rnd.nextInt(26)) + 97));
				} else {
					strPwd.append((rnd.nextInt(10)));
				}
			}
		}
		
		return strPwd.toString();
	}
	

	
	/**
	 * 문자열 오른쪽 패딩
	 * 
	 * @param value
	 *            적용시킬 문자열
	 * @param width
	 *            패딩 길이
	 * @param paddingChar
	 *            채울 문자
	 * @return
	 */
	public static String padRight(String value, int width, char paddingChar) {
		try {
			if (value.length() >= width)
				return value;
			
			String sReturn = value;
			while (sReturn.length() < width)
				sReturn = sReturn + String.valueOf(paddingChar);
			
			return sReturn;
		} catch (Exception e) {
			return "";
		}
	}
	
	/**
	 * 문자열 왼쪽 패딩
	 * 
	 * @param value
	 *            적용시킬 문자열
	 * @param width
	 *            패딩 길이
	 * @param paddingChar
	 *            채울 문자
	 * @return 왼쪽으로 패딩된 문자열
	 */
	public static String padLeft(String value, int width, char paddingChar) {
		try {
			if (value.length() >= width)
				return value;
			
			String sReturn = value;
			while (sReturn.length() < width)
				sReturn = String.valueOf(paddingChar) + sReturn;
			
			return sReturn;
		} catch (Exception e) {
			return "";
		}
	}

}
