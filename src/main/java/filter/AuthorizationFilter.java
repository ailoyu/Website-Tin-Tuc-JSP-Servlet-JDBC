package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.SystemConstant;
import model.UserModel;
import utils.SessionUtil;

public class AuthorizationFilter implements Filter {

	private ServletContext context;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// setup filter 
		 this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		// Ép kiểu ServletRequest -> HttpServletRequest
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		// lấy link request hiện tại muốn vào
		String url = request.getRequestURI();
		if(url.startsWith(request.getContextPath()+"/admin")) {
			// KIỂM TRA XEM CÓ ĐĂNG NHẬP HAY CHƯA
			UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
			if(model != null) {
				// nếu là admin: ms cho vào trang /admin
				if(model.getRole().getCode().equals(SystemConstant.ADMIN)) {
					filterChain.doFilter(servletRequest, servletResponse);
				}else if(model.getRole().getCode().equals(SystemConstant.USER)) {
					// nếu là user: báo lỗi + cho quay về trang đăng nhập
					response.sendRedirect(request.getContextPath()
							+"/dang-nhap?type=dangNhap&action=login&message=not_permission&alert=danger");
				}
			}else {
				response.sendRedirect(request.getContextPath()
							+"/dang-nhap?type=dangNhap&action=login&message=not_login&alert=danger");
			}
			
		}else {
			filterChain.doFilter(servletRequest, servletResponse);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
}
