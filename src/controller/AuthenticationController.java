package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.UsersDao;
import entity.Users;

@Controller
public class AuthenticationController {
	@Autowired
	UsersDao userDao;

	@RequestMapping("login")
	public String login(HttpSession session, @RequestParam("login-username") String username,
			@RequestParam("login-password") String password, ModelMap md) {
		Users user = userDao.getUSER(username);

		if (user != null) {
			if (user.getPassword().equals(password)) {
				System.out.println(user.getFullname());
				session.setAttribute("user", user);

			} else {
				md.addAttribute("login_error", "Mật khẩu bạn nhập không chính xác!");
			}
		} else {
			md.addAttribute("login_error", "Tài khoản không tồn tại!");

		}
		return "redirect:/home.htm";

	}

	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		session.invalidate();
		return "redirect:/home.htm";
	}

	@RequestMapping("register")
	public String register(HttpServletRequest request,
			@RequestParam(value = "register-username", required = true, defaultValue = "") String username,
			@RequestParam(value = "register-fullname", required = true, defaultValue = "") String fullname,
			@RequestParam(value = "register-password", required = true, defaultValue = "") String password,
			@RequestParam(value = "register-repassword", required = true, defaultValue = "") String repassword,
			@RequestParam(value = "register-email", required = true, defaultValue = "") String email, ModelMap md) {
		if (username.isEmpty() || password.isEmpty() || repassword.isEmpty() || email.isEmpty()) {
			md.addAttribute("reg-error", "Vui lòng nhập đủ các trường!");
		} else if (password.equals(repassword)) {
			try {
				userDao.insertUser(new Users(username, fullname, password, email));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			md.addAttribute("reg-error", "Đã xảy ra lỗi trong quá trình đăng ký tài khoản!");
		}
		return "redirect:/home.htm";
	}

	@RequestMapping("403")
	public String notPermission() {
		return "users/403";
	}
}
