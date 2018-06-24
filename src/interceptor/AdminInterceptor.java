package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import entity.Users;


public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Users user =(Users)  session.getAttribute("user");
		if(user == null || user.getPosition().equals("client")) {
			response.sendRedirect(request.getContextPath()+"/403.htm");
			return false;
		}
		return true;
	}
}
