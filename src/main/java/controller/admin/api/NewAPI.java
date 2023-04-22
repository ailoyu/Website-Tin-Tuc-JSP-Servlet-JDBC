package controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.NewModel;
import model.UserModel;
import service.INewService;
import utils.HttpUtil;
import utils.SessionUtil;


@WebServlet(urlPatterns = {"/api-admin-new"})
public class NewAPI extends HttpServlet{
	
	@Inject
	private INewService newService;

	private static final long serialVersionUID = -915988021506484384L;
	
	@Override // Hàm thêm mới bài viết
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// Chuyển từ JSon Data => Kiểu dữ liệu NewModel
		NewModel newModel = HttpUtil.of(request.getReader()).toModel(NewModel.class); // request.getReader(): là JSon data
		
		// lấy session của user -> để lấy username
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
		newModel.setCreatedBy(userModel.getFullName());
		newModel = newService.save(newModel);
		
		// Chuyển từ NewModel => JSon Data
		response.setContentType("application/json");
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getOutputStream(), newModel);
	}
	
	@Override // Hàm cập nhật bài viết
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// Chuyển từ JSon Data => Kiểu dữ liệu NewModel
		NewModel newModel = HttpUtil.of(request.getReader()).toModel(NewModel.class); // request.getReader(): là JSon data
		UserModel userModel = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
		newModel.setModifiedBy(userModel.getFullName());
		newModel = newService.update(newModel);
		
		
		// Chuyển từ NewModel => JSon Data
		response.setContentType("application/json");
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getOutputStream(), newModel);
	}
	
	@Override // Hàm xóa bài viết
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// Chuyển từ JSon Data => Kiểu dữ liệu NewModel
		NewModel newModel = HttpUtil.of(request.getReader()).toModel(NewModel.class); // request.getReader(): là JSon data
		newService.delete(newModel.getIds());
		
		// Chuyển từ NewModel => JSon Data
		response.setContentType("application/json");
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getOutputStream(), "{}");
	}
	
	@Override // Hàm lấy dữ liệu lên
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	
}
