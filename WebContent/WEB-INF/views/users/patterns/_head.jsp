<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LVD - HomePage</title>
<base href="${pageContext.servletContext.contextPath}/">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/product.css">
</head>
<body>
	<div class="row account">
		<i class="fa fa-user" aria-hidden="true"></i>
		<!-- Button trigger modal -->
		<c:choose>
			<c:when test="${user eq Null}">
				<div>
					<a href="#" class="dn" data-toggle="modal"
						data-target="#modalDangNhap"> Đăng nhập </a> &nbsp;&sol;&nbsp; <a
						href="#" class="dk" data-toggle="modal" data-target="#modalDangKy">
						Đăng ký </a>
				</div>
			</c:when>
			<c:otherwise>
				<ul style="z-index: 1; padding-left: 10px;">

					<li style="list-style: none; float: left;" id="user"><a>&nbsp;
							Xin chào, ${user.fullname }</a>
						<ul class="user-action">
							<li style="list-style: none"><a class="action-item"><i
									style="font-size: 20px" class="fa fa-address-card-o"
									aria-hidden="true"></i> &nbsp; Thông tin cá nhân&nbsp;&nbsp;</a></li>

							<c:if test="${isAdmin != null }">
								<li style="list-style: none"><a class="action-item"
									href="admin/dashboard/product-management.htm"><i style="font-size: 20px;"
										class="fa fa-bars" aria-hidden="true"></i> &nbsp;&nbsp;
										${isAdmin}</a></li>
							</c:if>
							<li style="list-style: none"><a class="action-item"
								data-toggle="modal" data-target="#modalDangxuat"><i
									style="font-size: 20px" class="fa fa-sign-out"
									aria-hidden="true"></i> &nbsp; &nbsp;Đăng xuất</a></li>

						</ul></li>
				</ul>
			</c:otherwise>
		</c:choose>

		<!-- Modal -->
		<!-- Đăng nhập -->
		<div class="modal fade" id="modalDangNhap" tabindex="-1" role="dialog"
			aria-labelledby="modalDangNhapLabel" aria-hidden="true">
			<div class="modal-dialog" style="max-width: 1000px" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalDangNhapLabel">Đăng nhập</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row" style="margin-top: 10px">
							<div class="col-8" style="border-right: solid 1px #929090">
								<form id="form-login" class="form-horizontal" action="login.htm">
									<div class="form-group row">
										<label for="inputTenDangNhap" class="control-label col-3">Tên
											đăng nhập:</label>
										<div class="col-9">
											<input name="login-username" type="text" class="form-control"
												id="inputTenDangNhap">
										</div>
									</div>
									<div class="form-group row">
										<label for="inputMatKhau" class="control-label col-3">Mật
											khẩu:</label>
										<div class="col-9">
											<input name="login-password" type="password"
												class="form-control" id="inputMatKhau">
										</div>
									</div>
									<div class="form-group row">
										<div class="offset-3 col-9">
											<a href="#" data-toggle="modal"
												data-target="#modalQuenMatKhau"> Quên mật khẩu? </a>
										</div>
									</div>
									<div class="form-group row">
										<div class="offset-4 col-8">
											<button type="submit"
												style="width: 50%; text-transform: uppercase"
												class="btn btn-primary">Đăng nhập</button>
										</div>
									</div>
								</form>
							</div>
							<div class="col-4">
								<div class="row"
									style="margin-left: 10px; margin-bottom: 15px; font-weight: bold; font-size: 16px;">
									Bạn chưa có tài khoản?</div>
								<div class="row">
									<div class="offset-1 col-11">
										<button type="button"
											style="width: 100%; text-transform: uppercase"
											class="btn btn-danger" data-dismiss="modal"
											data-toggle="modal" data-target="#modalDangKy">Đăng
											ký ngay</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Đăng xuất -->
		<div class="modal fade" id="modalDangxuat" tabindex="-1" role="dialog"
			aria-labelledby="modalDangxuatLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalDangxuatLabel">Đăng xuất</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<span>Bạn thực sự muốn đăng xuất ?</span>
					</div>
					<div class="modal-footer">
						<form action="logout.htm" method="post">
							<button type="submit" class="btn btn-danger">Đồng ý</button>
							<button data-dismiss="modal" class="btn btn-primary">Hủy bỏ</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Đăng ký -->
		<div class="modal fade" id="modalDangKy" tabindex="-1" role="dialog"
			aria-labelledby="modalDangKyLabel" aria-hidden="true">
			<div class="modal-dialog" style="max-width: 1000px" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalDangKyLabel">Đăng ký</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row" style="margin-top: 10px">
							<div class="col-8" style="border-right: solid 1px #929090">
								<form id="form-register" class="form-horizontal"
									action="register.htm" method="post">
									<fieldset>
										<div class="row"
											style="margin-left: 300px; margin-bottom: 10px; color: red">Bạn
											bắt buộc nhập đầy đủ thông tin bên dưới</div>
										<div class="form-group row">
											<label for="inputTenDangNhapDK" class="control-label col-3">Tên
												đăng nhập:</label>
											<div class="col-9">
												<input name="register-username" type="text"
													class="form-control" id="inputTenDangNhapDK" required>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputHoVaTenDK" class="control-label col-3">Họ
												và tên:</label>
											<div class="col-9">
												<input name="register-fullname" type="text"
													class="form-control" id="inputHoVaTenDK" required>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputMatKhauDK" class="control-label col-3">Mật
												khẩu:</label>
											<div class="col-9">
												<input name="register-password" type="password"
													class="form-control" id="inputMatKhauDK" required>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputNLMatKhau" class="control-label col-3">Nhập
												lại mật khẩu:</label>
											<div class="col-9">
												<input name="register-repassword" type="password"
													class="form-control" id="inputNLMatKhau" required>
											</div>
										</div>
										<div class="form-group row">
											<label for="inputEmail" class="control-label col-3">Email:</label>
											<div class="col-9">
												<input name="register-email" type="email"
													class="form-control" id="inputEmail" required>
											</div>
										</div>
										<div class="form-group row">
											<div class="offset-4 col-8">
												<button type="submit"
													style="width: 50%; text-transform: uppercase"
													class="btn btn-primary">Đăng ký</button>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
							<div class="col-4">
								<div class="row"
									style="margin-left: 10px; margin-bottom: 15px; font-weight: bold; font-size: 16px;">
									Bạn đã có tài khoản?</div>
								<div class="row">
									<div class="offset-1 col-11">
										<button type="button"
											style="width: 100%; text-transform: uppercase"
											class="btn btn-danger" data-dismiss="modal"
											data-toggle="modal" data-target="#modalDangNhap">Đăng
											nhập ngay</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Quên mật khẩu -->
		<div class="modal fade" id="modalQuenMatKhau" tabindex="-1"
			role="dialog" aria-labelledby="modalQuenMatKhauLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalQuenMatKhauLabel">Quên mật
							khẩu</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group row">
								<label for="staticEmail" class="col-2 col-form-label">Email:
								</label>
								<div class="col-10">
									<input type="email" class="form-control" id="staticEmail">
									<small id="emailHelp" class="form-text text-muted">Vui
										lòng nhập email mà bạn đã đăng ký tài khoản!</small>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">Gửi yêu cầu</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row header">
		<div class="col-2 logo">
			<a href="home.htm"> <img src="images/logo.png" alt="">
			</a>
		</div>
		<div class="col-6 form-search">
			<form action="search.htm">
				<div class="input-group mb-3" style="margin-top: 25px">
					<input type="text" class="form-control" placeholder="Search..."
						aria-label="Recipient's username" aria-describedby="basic-addon2"
						name="textSearch">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col hotline">Hotline: 1998 9794</div>
		<div class="col cart">
			<a href="cart.htm"> <i class="fa fa-shopping-cart"></i> <span>Giỏ
					hàng</span>
			</a>
		</div>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>