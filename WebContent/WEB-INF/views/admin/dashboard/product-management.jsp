<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<title>Quản lý sản phẩm</title>
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
						<a class="nav-link active"
							href="admin/dashboard/product-management.htm">Quản lý sản
							phẩm</a> <a class="nav-link "
							href="admin/dashboard/order-management.htm">Quản lý đơn hàng</a>
						<a data-toggle="modal" data-target="#logoutModal" class="nav-link"
							href=""><i class="fa fa-power-off" aria-hidden="true"></i>
							Đăng xuất</a>
					</div>
				</div>
			</div>
			<div class="col-10">
				<div class="row d-flex justify-content-center"
					style="font-size: 50px;">Quản lý sản phẩm</div>
				<div class="row">
					<div class="col-4 form-search">
						<div class="input-group mb-3" style="margin-top: 25px">
							<input type="text" id="filterInput" class="form-control" placeholder="Search..."
								aria-label="Recipient's username"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="offset-6 col-2">
						<form action="admin/insert-product.htm" method="get">
							<button type="submit" class="btn btn-primary"
								style="width: 100%; margin-top: 25px">Thêm sản phẩm</button>
						</form>
					</div>
				</div>
				<div class="row" style="margin-bottom: 10px;">
					<div class="sum-product"
						style="font-weight: bold; margin-left: 30px; margin-top: 5px">
						Tổng số: ${totalProduct} sản phẩm</div>
				</div>
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="table-productid">Mã sản phẩm</th>
								<th class="table-productname">Tên sản phẩm</th>
								<th class="table-productcolor">Màu</th>
								<th class="table-productprice">Giá</th>
								<th class="table-productbrand">Hãng sản xuất</th>
								<th class="table-productamount">Số lượng</th>
								<th class="table-productdetail">Chỉnh sửa</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="productColor" items="${productList }">
								<tr>
									<td class="table-productid">${productColor.product.id }</td>
									<td class="table-productname">${productColor.product.name}</td>
									<td class="table-productcolor">${productColor.color }</td>
									<td class="table-productprice"><fmt:formatNumber
											type="number" pattern="###,###"
											value="${productColor.product.price }" /> đ</td>
									<td class="table-productbrand">${productColor.product.producer }</td>
									<td class="table-productamount">${productColor.product.amount }</td>
									<td class="table-productdetail"><a
										href="admin/edit-product.htm?pID=${productColor.product.id}&color=${productColor.color}">
											<i class="fa fa-pencil-square" aria-hidden="true"
											style="font-size: 25px"></i>
									</a> <a data-toggle="modal" data-target="#deleteModal" href=""
									data-id="${productColor.product.id}"
										title="${productColor.product.name }"
										data-color="${productColor.color }" style="margin-left: 20px"
										class="deleteProduct"> <i class="fa fa-trash"
											aria-hidden="true" style="font-size: 25px"></i>
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

		<!--Delete Modal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Xóa sản phẩm</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div id="deleteProductModal" class="modal-body"></div>
					<div class="modal-footer">
						<form id="form-delete" action="" method="post">
							<button type="submit"  class="btn btn-danger">Đồng ý</button>
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
	<script type="text/javascript">
		$('.deleteProduct').click(
				function() {
					var title = $(this).attr('title');
					var data = $(this).data('color');
					var id = $(this).data('id');
					$('#deleteProductModal').text(
							"Bạn thực sự muốn xóa sản phẩm " + title + " "
									+ data + "?");
					$('#form-delete').attr('action','admin/delete-product.htm?pID='+id+'&color='+data);
				});
	</script>
	 <script>
		$(document).ready(function(){
			  $("#filterInput").on("keyup", function() {
				    var value = $(this).val().toLowerCase();
				    $("tbody tr").filter(function() {
				      	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				    });
			  });
		});
</script> 
</body>
</html>