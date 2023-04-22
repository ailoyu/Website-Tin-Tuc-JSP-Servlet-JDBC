package controller.web;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.SystemConstant;
import model.NewModel;
import model.UserModel;
import paging.PageRequest;
import paging.Pageble;
import service.ICategoryService;
import service.INewService;
import service.IUserService;
import sorting.Sorter;
import utils.FormUtil;
import utils.SessionUtil;


@WebServlet(urlPatterns = {"/trang-chu", "/dang-nhap", "/thoat"})
public class HomeController extends HttpServlet {
	
	@Inject
	private ICategoryService categoryService;
	
	
	@Inject
	private IUserService userService;

	private static final long serialVersionUID = 2686801510274002166L;
	
	// thông tin từ file message.properties
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message"); 
	
	@Inject
	private INewService newService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NewModel model = FormUtil.toModel(NewModel.class, request);	
		if(model.getType().equals("home")) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), 
					new Sorter(model.getSortName(), model.getSortBy(), model.getCategoryId())); 
			// dùng pageble để nhận dữ liệu từ model cho hàm findAll()
			model.setListResult(newService.findAll(pageble));
			
			// tất cả item có trong db
			if(model.getCategoryId() == null) {
				model.setTotalItem(newService.getTotalItem());
				request.setAttribute("categoryId", model.getCategoryId());
			}else {
				model.setTotalItem(newService.countCategoryId(model.getCategoryId()));
				request.setAttribute("categoryId", model.getCategoryId());
			}
			
			
			// Công thức tính 	totalPage = totalItem / maxPageItem
			
			// 					tất cả item trong db / tổng số item trong 1 page 
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
				
			request.setAttribute(SystemConstant.MODEL, model);
			request.setAttribute("categories", categoryService.findAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(request, response);	
		}else if(model.getType().equals("dangNhap")) {
			String action = request.getParameter("action"); // lấy value của action bên front - end
			if(action != null && action.equals("login")) {
				
				String message = request.getParameter("message");
				String alert = request.getParameter("alert");
				if(message != null && alert != null) {
					request.setAttribute("message", resourceBundle.getString(message));
					request.setAttribute("alert", alert);
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
				rd.forward(request, response);
			}else if(action != null && action.equals("logout")) {
				
				SessionUtil.getInstance().removeValue(request, "USERMODEL");
				
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}
		}else if(model.getType().equals("info")) { 
			
			if(model.getId() != null) {// Cập nhật bài viết cần id, còn thêm mới thì ko cần id
				
				// find bài viết muốn cập nhật theo ID, lấy các trường dữ liệu lên 
				// -> binding vào data field trong client 
				model = newService.findOne(model.getId());
			} 
			
			// lấy thể loại lên, bỏ vô selection box
			request.setAttribute("categories", categoryService.findAll());
			request.setAttribute("model", model);
			
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/info.jsp");
			rd.forward(request, response);
			
		}
		
//		UserModel userModel = new UserModel();
//		userModel.setFullName("Đây là trang chủ của client");
//		request.setAttribute("model", userModel);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action != null && action.equals("login")) {
			
			// lấy username, password từ request bỏ vô UserModel
			UserModel model = FormUtil.toModel(UserModel.class, request);
			
			// Kiểm tra tài khoản mật khẩu (authentication)
			model = userService.findByUserNameAndPasswordAndStatus(model.getUserName(), model.getPassword(), 1);
			System.out.println(model);
			if(model != null) { 
				
				// Gọi session ra, bỏ model vào session
				// put dữ liệu từ session ra ngoài client, đặt tên là "USERMODEL"
				SessionUtil.getInstance().putValue(request, "USERMODEL", model);
				
				//authorization
				if(model.getRole().getCode().equals("USER")) {
					response.sendRedirect(request.getContextPath()+"/index.jsp");
				}else if(model.getRole().getCode().equals("ADMIN")) {
					response.sendRedirect(request.getContextPath()+"/admin-home");
				}
			}else {
				response.sendRedirect(request.getContextPath()
				+"/dang-nhap?type=dangNhap&action=login&message=not_permission&alert=danger");
			}
		}
	}
	
	
}
