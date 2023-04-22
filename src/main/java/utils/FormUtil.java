package utils;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class FormUtil {
	
	
	// Chuyển Kiểu dữ liệu String của getParameter thành của kiểu dữ liệu NewModel
	// nếu có bất kỳ request.getParameter nào thì tự động set vào model
	@SuppressWarnings("unchecked")
	public static <T> T toModel (Class<T> tClass, HttpServletRequest request) {
		T object = null;
		try {
			object = tClass.newInstance();
			// Chuyển Kiểu dữ liệu String của getParameter thành của dữ liệu của các Model
			BeanUtils.populate(object, request.getParameterMap());
		} catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {
			System.out.println(e.getMessage());
		} 
		return object;	
	}
}
