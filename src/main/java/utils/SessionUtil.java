package utils;

import javax.servlet.http.HttpServletRequest;

public class SessionUtil {
	
	private static SessionUtil sessionUtil = null;
	
	public static SessionUtil getInstance() {
		if(sessionUtil == null) {
			sessionUtil = new SessionUtil();
		}
		return sessionUtil;  
	}
	
	
	// Khởi tạo Session từ request
	public void putValue(HttpServletRequest request, String key, Object value) {
		request.getSession().setAttribute(key, value);
	}
	
	// lấy đối tượng session ra
	public Object getValue(HttpServletRequest request, String key) {
		return request.getSession().getAttribute(key);
	}
	
	// Hủy session
	public void removeValue(HttpServletRequest request, String key) {
		request.getSession().removeAttribute(key);
	}
	
	
}
