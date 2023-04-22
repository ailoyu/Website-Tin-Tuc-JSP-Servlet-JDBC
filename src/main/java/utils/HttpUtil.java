package utils;

import java.io.BufferedReader;
import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUtil {
	
	private String value;
	
	
	public HttpUtil(String value) {
		this.value = value;
	}
	
	// Chuyển từ String của JsonData => Kiểu Model bất kỳ 
	// Mapping các giá trị từ Json vs các biến trong model
	public <T> T toModel (Class<T> tClass) {
		try {
			return new ObjectMapper().readValue(value, tClass);
		} catch (Exception e) {
			return null;
		}
	}
	
	// Chuyển JSon => String
	public static HttpUtil of (BufferedReader br) {
		StringBuilder sb = new StringBuilder();
		try {
			String line = br.readLine(); // chạy line đầu tiên trong json Data
			while(line != null) {
				sb.append(line);
				line = br.readLine(); // hết line đầu tiên -> tiếp tục gắn line kế tiếp
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		return new HttpUtil(sb.toString()); // return v�? constructor
	}
}
