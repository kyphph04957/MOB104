<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đặt hàng</title>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/product-information.css">
</head>

<body>
	<div class="container">
		<jsp:include page="patterns/_head.jsp"></jsp:include>
		<jsp:include page="patterns/_menu.jsp"></jsp:include>
		<div class="row">
			<div class="col-6 banner">
				<div id="banner1" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="images/banner1.png"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner2.png"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner3.png"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner4.png"
								alt="Forth slide">
						</div>
						<a class="carousel-control-prev" href="#banner1" role="button"
							data-slide="prev"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#banner1" role="button"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
			<div class="col-6 banner">
				<div id="banner2" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="images/banner5.png"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner6.png"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner7.png"
								alt="Third slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="images/banner8.png"
								alt="Forth slide">
						</div>
						<a class="carousel-control-prev" href="#banner2" role="button"
							data-slide="prev"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#banner2" role="button"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<form style="width: 100%" action="pay.htm" method="post"
			enctype="multipart/form-data" id="form-add-new-product">
			<div class="row">
				<div class="col-4">
					<a class="product-name"> Thông tin giao hàng </a>
					<div style="border-bottom: 1px solid #c4c0c0; padding-bottom: 5%"
						class="row">
						<div style="margin-top: 20px; width: 100%; padding-left: 15px">
							<div style="width: 100%">
								<label for="clientName">Họ và tên:</label>
							</div>
							<div style="width: 100%">
								<input type="text" class="form-control col-9" id="clientName"
									name="clientName">
							</div>


							<div style="width: 100%">
								<label for="clientPhone">Số điện thoại:</label>
							</div>
							<div style="width: 100%">
								<input type="text" class="form-control col-9" id="clientPhone"
									name="clientPhone">
							</div>

							<div style="width: 100%">
								<label for="clientAddress">Địa chỉ nhận hàng:</label>
							</div>
							<div style="width: 100%">
								<input type="text" class="form-control col-9" id="clientAddress"
									name="clientAddress">
							</div>
							<div style="width: 100%"></div>
						</div>

					</div>
				</div>

				<div class="col-4">
					<a class="product-name" style="visibility: hidden"> Thông tin
						giao hàng </a>
					<div style="border-bottom: 1px solid #c4c0c0; padding-bottom: 5%"
						class="row">

						<div style="margin-top: 20px; width: 100%">
							<div style="width: 100%">
								<label for="clientName">Xã/Thị trấn:</label>
							</div>
							<div style="width: 100%">
								<input name="xa" type="text" class="form-control col-9">
							</div>


							<div style="width: 100%">
								<label for="clientPhone">Quận/Huyện:</label>
							</div>
							<div style="width: 100%">
								<input type="text" class="form-control col-9">
							</div>

							<div style="width: 100%">
								<label for="clientAddress">Tỉnh/Thành Phố:</label>
							</div>
							<div style="width: 100%">
								<input type="text" class="form-control col-9">
							</div>
							<div style="width: 100%"></div>
						</div>
					</div>

				</div>

				<div class="col-4">
					<a class="product-name"> Thông tin đơn hàng </a>
					<div
						style="border-bottom: 1px solid #c4c0c0; padding-bottom: 5%; width: 90%"
						class="row">

						<div style="margin-top: 20px; width: 100%">
							<div style="margin-bottom: 5%" class="row">
								<div class="col-6">Tạm Tính:</div>
								<div style="text-align: right;" class="col-6">
									<fmt:formatNumber type="number" pattern="###,###"
										value="${total}" />
									đ
								</div>
							</div>
							<div style="margin-bottom: 5%" class="row">
								<div class="col-6">Phí giao hàng:</div>
								<div style="text-align: right;" class="col-6"><fmt:formatNumber type="number" pattern="###,###"
												value="30000" /> đ</div>
							</div>

							<div style="margin-bottom: 5%" class="row">
								<div class="col-6">Tổng cộng:</div>
								<div style="text-align: right;" class="col-6"><fmt:formatNumber type="number" pattern="###,###"
												value="${total+30000}" /> đ</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div style="width: 80%; margin-top: 20px"
							class="d-flex justify-content-center">
							<button type="submit" class="btn btn-warning">Thanh toán</button>
						</div>
					</div>

				</div>

			</div>
		</form>


		<div class="row footer">
			<div class="col-2 logo-footer">
				<img src="images/logo.png" alt="">
			</div>
			<div class="col-7 info-footer">
				Công ty TNHH Công nghệ di động LVD - Tòa nhà FPT Polytechnic (Nhà
				H), Hàm Nghi, Mỹ Đình, Nam Từ Liêm, Hà Nội <br> Email:
				company@LVD.vn <br> Copyrights &copy; 2018 LVD.vn <br>
			</div>
			<div class="col-3 hotline-footer">
				<i class="fa fa-phone-square" aria-hidden="true"></i> <span>Hotline:
					1998 9794</span>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>