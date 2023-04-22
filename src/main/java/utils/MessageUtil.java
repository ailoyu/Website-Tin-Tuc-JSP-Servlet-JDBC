package utils;

import javax.servlet.http.HttpServletRequest;

public class MessageUtil {
	
	
	public static void showMessage(HttpServletRequest request) {
		if(request.getParameter("message") != null) {
			String messageResponse = "";
			String alert = "";
			String message = request.getParameter("message");
			if(message.equals("insert_success")) {
				messageResponse = "Insert success"; // hiển thị thông báo
				alert = "success"; // hiển thị màu xanh, thành công
			}else if(message.equals("update_success")) {
				messageResponse = "Update success"; // hiển thị thông báo
				alert = "success"; // hiển thị màu xanh, thành công
			}else if(message.equals("delete_success")) {
				messageResponse = "Delete success"; // hiển thị thông báo
				alert = "success"; // hiển thị màu xanh, thành công
			}else if(message.equals("error_system")) {
				messageResponse = "Lỗi hệ thống"; // hiển thị thông báo
				alert = "danger"; // hiển thị màu xanh, thành công
			}
			request.setAttribute("messageResponse", messageResponse);
			request.setAttribute("alert", alert);
		}
	}
	
}
