package controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.SystemConstant;
import model.NewModel;
import paging.PageRequest;
import paging.Pageble;
import service.ICategoryService;
import service.INewService;
import sorting.Sorter;
import utils.FormUtil;
import utils.MessageUtil;


@WebServlet(urlPatterns = {"/admin-new"})
public class NewController extends HttpServlet {
	
	@Inject
	private INewService newService;
	
	@Inject
	private ICategoryService categoryService;
	
	private static final long serialVersionUID = 2686801510274002166L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		NewModel model = new NewModel();
//		String page = request.getParameter("page");
//		if(page != null) {
//			model.setPage(Integer.parseInt(page));
//		}else {
//			model.setPage(1);
//		}
		
		
		// Nhận dữ liệu từ những thằng 'name' bên list.jsp 
		
		// Chuyển Kiểu dữ liệu String của getParameter thành của kiểu dữ liệu NewModel
		// nếu có bất kỳ request.getParameter nào thì tự động set vào model
		NewModel model = FormUtil.toModel(NewModel.class, request);	
		String url = "";
		if(model.getType().equals(SystemConstant.LIST)) { // thực hiện Phân trang
			// offset là số index của đầu trang, limit: là tổng số item trong 1 page
			// sử dụng interface: thì new Class() implement của interface
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), 
					new Sorter(model.getSortName(), model.getSortBy(), null)); 
			// dùng pageble để nhận dữ liệu từ model cho hàm findAll()
			model.setListResult(newService.findAll(pageble));
			
			// tất cả item có trong db
			model.setTotalItem(newService.getTotalItem());
			
			// Công thức tính 	totalPage = totalItem / maxPageItem
			
			// 					tất cả item trong db / tổng số item trong 1 page 
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
										// ceil: làm tròn số lớn tiếp theo
			if(request.getParameter("message") != null) {
				request.setAttribute("message", "");
				request.setAttribute("alert", "");
			}
			
			url = "/views/admin/new/list.jsp";
		}else if(model.getType().equals(SystemConstant.EDIT)) { 
			
			if(model.getId() != null) {// Cập nhật bài viết cần id, còn thêm mới thì ko cần id
				
				// find bài viết muốn cập nhật theo ID, lấy các trường dữ liệu lên 
				// -> binding vào data field trong client 
				model = newService.findOne(model.getId());
			} 
			
			// lấy thể loại lên, bỏ vô selection box
			request.setAttribute("categories", categoryService.findAll());
			url = "/views/admin/new/edit.jsp";
			
		}
		
		MessageUtil.showMessage(request);
		// Xử lý xong, đẩy dữ liệu từ đối tượng model ra ngoài Front - end
		request.setAttribute(SystemConstant.MODEL, model);
		
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);


	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	
}
