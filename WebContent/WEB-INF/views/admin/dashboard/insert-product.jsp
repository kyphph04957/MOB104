<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm sản phẩm</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
					style="font-size: 50px;">Thêm sản phẩm</div>
				<div style="color: red">${insertError }</div>
				<div class="row form-add-product">
					<form id="form-insert-product" action="admin/insertProduct.htm"
						method="post" enctype="multipart/form-data"
						id="form-add-new-product" style="width: 100%">
						<h3>Thông tin cơ bản</h3>
						<div class="row">
							<div class="col-7" style="margin-top: 20px">
								<div class="form-group form-inline row">
									<label for="productID" class="col-3">Mã sản phẩm:</label> <input
										type="text" class="form-control col-9" id="productID"
										name="productID">
								</div>
								<div class="form-group form-inline row">
									<label for="productName" class="col-3">Tên sản phẩm:</label> <input
										type="text" class="form-control col-9" id="productName"
										name="productName">
								</div>
								<div class="form-group form-inline row">
									<label for="productPrice" class="col-3">Giá sản phẩm:</label> <input
										type="text" class="form-control col-9" id="productPrice"
										name="productPrice">
								</div>
								<div class="form-group form-inline row">
									<label for="brand" class="col-3">Hãng sản xuất:</label> <select
										class="form-control col-9" id="brand" name="brandList">
										<option>Apple</option>
										<option>Oppo</option>
										<option>Samsung</option>
										<option>Sony</option>
										<option>Xiaomi</option>
									</select>
								</div>
								<div class="form-group form-inline row">
									<label for="productAmount" class="col-3">Số lượng:</label> <input
										type="text" class="form-control col-9" id="productAmount"
										name="productAmount">
								</div>
								<div class="form-group form-inline row">
									<label for="color" class="col-3">Màu sắc:</label> <select
										class="form-control col-9" id="color" name="colorList">
										<option>Gold</option>
										<option>Black</option>
										<option>Silver</option>
										<option>Pink</option>
										<option>Blue</option>
										<option>Purple</option>
										<option>Red</option>
									</select>
								</div>
								<div class="form-group form-inline row">
									<label for="productMonitor" class="col-3">Độ phân giải:</label>
									<input type="text" class="form-control col-9"
										id="productMonitor" name="productMonitor">
								</div>
								<div class="form-group form-inline row">
									<label for="productOS" class="col-3">Hệ điều hành:</label> <input
										type="text" class="form-control col-9" id="productOS"
										name="productOS">
								</div>
								<div class="form-group form-inline row">
									<label for="productCamera" class="col-3">Camera sau:</label> <input
										type="text" class="form-control col-9" id="productCamera"
										name="productCamera">
								</div>
								<div class="form-group form-inline row">
									<label for="productFrontCamera" class="col-3">Camera
										trước:</label> <input type="text" class="form-control col-9"
										id="productFrontCamera" name="productFrontCamera">
								</div>
								<div class="form-group form-inline row">
									<label for="productCPU" class="col-3">CPU:</label> <input
										type="text" class="form-control col-9" id="productCPU"
										name="productCPU">
								</div>
								<div class="form-group form-inline row">
									<label for="productRAM" class="col-3">Bộ nhớ RAM:</label> <input
										type="text" class="form-control col-9" id="productRAM"
										name="productRAM">
								</div>
								<div class="form-group form-inline row">
									<label for="productROM" class="col-3">Bộ nhớ ROM:</label> <input
										type="text" class="form-control col-9" id="productROM"
										name="productROM">
								</div>
								<div class="form-group form-inline row">
									<label for="productSIM" class="col-3">Khe cắm SIM:</label> <input
										type="text" class="form-control col-9" id="productSIM"
										name="productSIM">
								</div>
								<div class="form-group form-inline row">
									<label for="productPIN" class="col-3">Dung lượng PIN:</label> <input
										type="text" class="form-control col-9" id="productPIN"
										name="productPIN">
								</div>
								<div class="form-group form-inline row">
									<label for="productDescription" class="col-3">Mô tả:</label> <input
										type="text" class="form-control col-9" id="productDescription"
										name="productDescription">
								</div>
							</div>
							<div class="col-5">
								<div class="form-group" style="width: 100%">
									<label style="padding: 0" class="col-3">Ảnh mặt trước:</label>
									<br>
									<div style="margin-bottom: 10px"
										class="d-flex justify-content-center">
										<img id="preview1" src="images/default-image.jpg" alt=""
											height="180px">
									</div>
									<input
										onchange="updateImageDisplay('image_uploads1','preview1');"
										id="image_uploads1" type="file"
										class="form-control-file border" name="productFrontImg">
								</div>
								<div class="form-group" style="width: 100%">
									<label style="padding: 0" class="col-3">Ảnh mặt sau:</label> <br>
									<div style="margin-bottom: 10px"
										class="d-flex justify-content-center">
										<img id="preview2" src="images/default-image.jpg" alt=""
											height="180px">
									</div>
									<input id="image_uploads2" type="file"
										onchange="updateImageDisplay('image_uploads2','preview2');"
										class="form-control-file border" name="productBehindImg">
								</div>
								<div class="form-group" style="width: 100%">
									<label style="padding: 0" class="col-3">Ảnh độ dày:</label> <br>
									<div style="margin-bottom: 10px"
										class="d-flex justify-content-center">
										<img id="preview3" src="images/default-image.jpg" alt=""
											height="180px">
									</div>
									<input id="image_uploads3" type="file"
										class="form-control-file border"
										onchange="updateImageDisplay('image_uploads3','preview3');"
										name="productThicknessImg">
								</div>
							</div>
						</div>

						<div class="row" style="margin-left: 350px">
							<button type="submit" class="btn btn-primary">Thêm sản
								phẩm</button>
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
	<script src="js/validate-insert-product.js"></script>
	<script type="text/javascript" src="js/imgPreview.js"></script>

</body>
</html>