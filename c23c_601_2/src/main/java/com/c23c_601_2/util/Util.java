package com.c23c_601_2.util;

public class Util {

	public static String changeEmailMasking(String str) {
		
		String[] email = str.split("@");
		String result = email[0].substring(0,2)+"*******@"+email[1].substring(0,1)+"*******.com";
		
		
		return result;
	}
	
	public static String changephoneMasking(String str) {
		
		String[] phone = str.split("-");
		
		String result = phone[0]+"-"+phone[1].substring(0,1)+"***-"+phone[2].substring(0,1)+"***";
		
		return result;
	}
	
	public static int str2Int(String str) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < str.length(); i++) {
			if (Character.isDigit(str.charAt(i))) {
				sb.append(str.charAt(i));
			}
		}
		int number = 0;
		if (sb.length() > 0) {
			number = Integer.parseInt(sb.toString());
		}
		return number;
	}

	public static boolean intCheck(String str) {
		try {
			Integer.parseInt(str);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public static boolean intCheck2(String str) {
		boolean result = false;

		for (int i = 0; i < str.length(); i++) {
			if (!Character.isDigit(str.charAt(i))) {
				result = false;
				break;
			} else {
				result = true;
			}
		}
		return result;
	}

	public static int str2Int2(String str) {
		String numberOnly = str.replaceAll("[^0-9]", "");
		return Integer.parseInt(numberOnly);
	}
	
	   
	   //HTML태그를 특수기호로 변경하기 < &lt > &gt
	   public static String removeTag(String str) {
		   str = str.replaceAll("<", "&lt");
		   str = str.replaceAll(">", "&gt");
		   
		   return str;
	}
	   //엔터키 처리
	   public static String addBR(String str) {
		      return str.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		   }
	   
	   public static String removeBR(String str) {
		   return str.replaceAll("<br>", "");
	   }
	   public static String removeP(String str) {
		   return str.replaceAll("<p>", "");
	   }
	   public static String removeP2(String str) {
		   return str.replaceAll("</p>", "");
	   }
	   
	   
	   
	   public static String ipChange(String ip) {
		   if (ip.indexOf('.') != -1) {
			   int idx = ip.indexOf(".")+1;
			      int idx2 = ip.indexOf(".",idx+1);
			      String ip2 = ip.substring(0, idx);
			      String ip3 = ip.substring(idx2);
			      ip = ip2+"♡"+ip3;
		}
		   return ip;
	}

}
