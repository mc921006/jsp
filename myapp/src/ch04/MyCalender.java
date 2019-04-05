package ch04;

import java.util.*;

public class MyCalender {

	public static String getTime() {
		
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int minute = c.get(Calendar.MINUTE);
		int second = c.get(Calendar.SECOND);
		
		return hour+" : "+minute+" : "+second;
		
	}
}
