<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sửa sản phẩm</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/add-new-product.css">
<style type="text/css">
label.error {
	color: red;
	line-height: 20px;
	padding-top: 5px;
	margin-left: 236px;
	margin-bottom: 0px;
}
</style>
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
					<div class="row" style="width: 100%">
						<div class="nav flex-column nav-pills" style="width: 100%">
							<a class="nav-link active"
								href="admin/dashboard/product-management.htm">Quản lý sản
								phẩm</a> <a class="nav-link"
								href="admin/dashboard/order-management.htm">Quản lý đơn hàng</a>
							<a data-toggle="modal" data-target="#logoutModal"
								class="nav-link" href=""><i class="fa fa-power-off"
								aria-hidden="true"></i> Đăng xuất</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-10">
				<div class="row d-flex justify-content-center"
					style="font-size: 50px;">Sửa sản phẩm</div>
				<div class="row form-add-product">
					<form id="form-edit-product" action="admin/update-product.htm" method="post"
						enctype="multipart/form-data" id="form-add-new-product"
						style="width: 100%">
						<h3>Thông tin cơ bản</h3>
						<div class="row">
							<div class="col-7" style="margin-top: 20px">
								<div class="form-group form-inline row">
									<label for="productID" class="col-3">Mã sản phẩm:</label> <input
										type="text" class="form-control col-9" id="productID"
										name="productID" readonly="readonly"
										value="${editProduct.product.id }">
								</div>
								<div class="form-group form-inline row">
									<label for="productName" class="col-3">Tên sản phẩm:</label> <input
										type="text" class="form-control col-9" id="productName"
										name="productName" value="${editProduct.product.name }">
								</div>
								<div class="form-group form-inline row">
									<label for="productPrice" class="col-3">Giá sản phẩm:</label> <input
										type="text" class="form-control col-9" id="productPrice"
										name="productPrice" value="${editProduct.product.price }">
								</div>
								<div class="form-group form-inline row">
									<label for="brand" class="col-3">Hãng sản xuất:</label> <select
										class="form-control col-9" id="brand" name="brandList">
										<option
											${(editProduct.product.producer eq 'Apple')?'selected':'' }>Apple</option>
										<option
											${(editProduct.product.producer eq 'OPPO')?'selected':'' }>Oppo</option>
										<option
											${(editProduct.product.producer eq 'Samsung')?'selected':'' }>Samsung</option>
										<option
											${(editProduct.product.producer eq 'Sony')?'selected':'' }>Sony</option>
										<option
											${(editProduct.product.producer eq 'Xiaomi')?'selected':'' }>Xiaomi</option>
									</select>
								</div>
								<div class="form-group form-inline row">
									<label for="productAmount" class="col-3">Số lượng:</label> <input
										type="text" class="form-control col-9" id="productAmount"
										name="productAmount" value="${editProduct.product.amount }">
								</div>
								<div class="form-group form-inline row">
									<label for="color" class="col-3">Màu sắc:</label> <select
										class="form-control col-9" id="color" name="colorList">
										<option ${(editProduct.color eq 'Gold')?'selected':'' }>Gold</option>
										<option ${(editProduct.color eq 'Black')?'selected':'' }>Black</option>
										<option ${(editProduct.color eq 'Silver')?'selected':'' }>Silver</option>
										<option ${(editProduct.color eq 'Pink')?'selected':'' }>Pink</option>
										<option ${(editProduct.color eq 'Blue')?'selected':'' }>Blue</option>
										<option ${(editProduct.color eq 'Purple')?'selected':'' }>Purple</option>
										<option ${(editProduct.color eq 'Red')?'selected':'' }>Red</option>
									</select>
								</div>
								<div class="form-group form-inline row">
									<label for="productMonitor" class="col-3">Độ phân giải:</label>
									<input type="text" class="form-control col-9"
										id="productMonitor" name="productMonitor"
										value="${editProduct.product.monitor }">
								</div>
								<div class="form-group form-inline row">
									<label for="productOS" class="col-3">Hệ điều hành:</label> <input
										type="text" class="form-control col-9" id="productOS"
										name="productOS" value="${editProduct.product.os }">
								</div>
								<div class="form-group form-inline row">
									<label for="productCamera" class="col-3">Camera sau:</label> <input
										type="text" class="form-control col-9" id="productCamera"
										name="productCamera" value="${editProduct.product.camera }">
								</div>
								<div class="form-group form-inline row">
									<label for="productFrontCamera" class="col-3">Camera
										trước:</label> <input type="text" class="form-control col-9"
										id="productFrontCamera" name="productFrontCamera"
										value="${editProduct.product.front_camera }">
								</div>
								<div class="form-group form-inline row">
									<label for="productCPU" class="col-3">CPU:</label> <input
										type="text" class="form-control col-9" id="productCPU"
										name="productCPU" value="${editProduct.product.cpu }">
								</div>
								<div class="form-group form-inline row">
									<label for="productRAM" class="col-3">Bộ nhớ RAM:</label> <input
										type="text" class="form-control col-9" id="productRAM"
										name="productRAM" value="${editProduct.product.ram }">
								</div>
								<div class="form-group form-inline row">
									<label for="productROM" class="col-3">Bộ nhớ ROM:</label> <input
										type="text" class="form-control col-9" id="productROM"
										name="productROM" value="${editProduct.product.rom }">
								</div>
								<div class="form-group form-inline row">
									<label for="productSIM" class="col-3">Khe cắm SIM:</label> <input
										type="text" class="form-control col-9" id="productSIM"
										name="productSIM" value="${editProduct.product.sim }">
								</div>
								<div class="form-group form-inline row">
									<label for="productPIN" class="col-3">Dung lượng PIN:</label> <input
										type="text" class="form-control col-9" id="productPIN"
										name="productPIN" value="${editProduct.product.pin }">
								</div>
								<div class="form-group form-inline row">
									<label for="productDescription" class="col-3">Mô tả:</label> <input
										type="text" class="form-control col-9" id="productDescription"
										name="productDescription"
										value="${editProduct.product.description }">
								</div>
							</div>
							<div class="col-5">
								<div class="form-group" style="width: 100%">
									<label style="padding: 0" class="col-3">Ảnh mặt trước:</label>
									<br>
									<div style="margin-bottom: 10px"
										class="d-flex justify-content-center">
										<img id="preview1" id="image_uploads1"
											src="images/${editProduct.img_front}" alt="" height="180px">
										<div id="preview1"></div>
									</div>
									<input id="image_uploads1" type="file"
										class="form-control-file border"
										onchange="updateImageDisplay('image_uploads1','preview1');"
										name="productFrontImg">
								</div>
								<div class="form-group" style="width: 100%">
									<label style="padding: 0" class="col-3">Ảnh mặt sau:</label> <br>
									<div style="margin-bottom: 10px"
										class="d-flex justify-content-center">
										<img id="preview2" src="images/${editProduct.img_behind}"
											alt="" height="180px">
									</div>
									<input id="image_uploads2" type="file"
										class="form-control-file border"
										onchange="updateImageDisplay('image_uploads2','preview2');"
										name="productBehindImg">
								</div>
								<div class="form-group" style="width: 100%">
									<label style="padding: 0" class="col-3">Ảnh độ dày:</label> <br>
									<div style="margin-bottom: 10px"
										class="d-flex justify-content-center">
										<img id="preview3" src="images/${editProduct.img_thickness}"
											alt="" height="180px">
									</div>
									<input id="image_uploads3" type="file"
										class="form-control-file border"
										onchange="updateImageDisplay('image_uploads3','preview3');"
										name="productThicknessImg">
								</div>
							</div>
						</div>

						<div class="row" style="margin-left: 350px">
							<button type="submit" class="btn btn-primary">Cập nhật</button>
							<button type="reset" class="btn btn-default"
								style="margin-left: 10px">Hủy</button>
						</div>
					</form>
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
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"
		type="text/javascript"></script>
		<script src="js/validate-edit-product.js"></script>
	<script type="text/javascript" src="js/imgPreview.js"></script>
</body>
</html>