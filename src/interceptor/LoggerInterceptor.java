package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import entity.Users;

public class LoggerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			Users user = (Users) session.getAttribute("user");
			if (user.getPosition().equals("admin")) {
				modelAndView.getModelMap().addAttribute("isAdmin", "Dashboard");
			}
		}
	}
}
