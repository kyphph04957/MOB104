<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<title>Quản lý đơn hàng</title>
<!-- Required meta tags -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/dashboard.css">
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-2">
				<div class="row d-flex justify-content-center"
					style="margin: 10px 0px">
					<a href="home.htm"> <img src="images/logo.png" alt="">
					</a>
				</div>
				<div class="row" style="width: 100%">
					<div class="nav flex-column nav-pills" style="width: 100%">
						<a class="nav-link" href="admin/dashboard/product-management.htm">Quản
							lý sản phẩm</a> <a class="nav-link active"
							href="admin/dashboard/order-management.htm">Quản lý đơn hàng</a>
						<a data-toggle="modal" data-target="#logoutModal" class="nav-link"
							href=""><i class="fa fa-power-off" aria-hidden="true"></i>
							Đăng xuất</a>
					</div>
				</div>
			</div>
			<div class="col-10">
				<div class="row d-flex justify-content-center"
					style="font-size: 50px;">Quản lý đơn hàng</div>
				<div class="row">
					<div class="col-4 form-search">
						<div class="input-group mb-3" style="margin-top: 25px">
							<input type="text" id="filterInput" class="form-control"
								placeholder="Search..." aria-label="Recipient's username"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="table-purchaseid">Mã hóa đơn</th>
								<th class="table-customername">Tên khách hàng</th>
								<th class="table-address">Địa chỉ</th>
								<th class="table-phone">Số điện thoại</th>
								<th class="table-status">Trạng thái</th>
								<th class="table-purchasedetail">Chi tiết hóa đơn</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${orderList.size() ==0 }">
								<tr>
									<h3>Chưa giao dịch nào được thực hiện</h3>
								</tr>
							</c:if>
							<c:forEach var="purchase" items="${orderList }">
								<tr>
									<td class="table-purchaseid">${purchase.id }</td>
									<td class="table-customername">${purchase.username.fullname }</td>
									<td class="table-address">${purchase.client_address }</td>
									<td class="table-phone">${purchase.client_phone }</td>
									<td class="table-status">${purchase.status }</td>
									<td class="table-purchasedetail"><a
										href="admin/update-order.htm?purID=${purchase.id}"> <i
											class="fa fa-pencil-square" aria-hidden="true"
											style="font-size: 25px"></i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Đăng xuất</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Bạn thực sự muốn đăng xuất?</div>
					<div class="modal-footer">
						<form action="logout.htm" method="post">
							<button type="submit" class="btn btn-danger">Đồng ý</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Hủy bỏ</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script>
		$(document)
				.ready(
						function() {
							$("#filterInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("tbody tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>
</body>
</html>